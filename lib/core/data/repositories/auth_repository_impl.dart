import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/auth/auth_session_model.dart';
import 'package:navy_wear/core/domain/model/auth/user_model.dart';
import 'package:navy_wear/core/domain/repositories/auth_repository.dart';
import 'package:navy_wear/core/services/token_store.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._service, this._tokens);

  final AuthService _service;
  final TokenStore _tokens;

  @override
  bool get hasSession => _tokens.hasSession;

  @override
  Future<DataState<AuthSessionModel>> register({
    required String phone,
    required String password,
    required String fullName,
    required String role,
    String? email,
    String? npwp,
    String? nibSiupNo,
  }) async {
    try {
      final registered = await _service.register(
        phone: phone,
        password: password,
        fullName: fullName,
        role: role,
        email: email,
        npwp: npwp,
        nibSiupNo: nibSiupNo,
      );

      // Simpan dulu access token dari register. Kalau login otomatis di bawah
      // gagal, user setidaknya punya sesi 2 jam yang bisa dipakai.
      //
      // `role` diambil dari yang dikirim client, karena respons register tidak
      // memuatnya — dan tanpa role, gating B2B tidak punya dasar.
      await _tokens.saveSession(
        accessToken: registered.data.accessToken,
        expiresIn: registered.data.expiresIn,
        userId: registered.data.userId,
        role: role,
      );

      // Login otomatis, satu-satunya cara mendapat refresh token.
      try {
        final session = await _service.login(phone: phone, password: password);
        await _persist(session.data, fallbackRole: role);
        return DataSuccess(
          session.data,
          meta: {...registered.meta, 'auto_login': true},
          statusCode: registered.statusCode,
        );
      } on ApiException {
        // Akunnya sudah benar-benar terbentuk. Melaporkan ini sebagai
        // kegagalan akan membuat user mencoba mendaftar ulang dan kena
        // `409 PHONE_TAKEN` — jadi tetap sukses, dengan penanda.
        return DataSuccess(
          registered.data.copyWith(role: role),
          meta: {...registered.meta, 'auto_login': false},
          statusCode: registered.statusCode,
        );
      }
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<DataState<AuthSessionModel>> login({
    required String password,
    String? phone,
    String? email,
  }) async {
    try {
      final session = await _service.login(
        password: password,
        phone: phone,
        email: email,
      );
      await _persist(session.data);
      return DataSuccess(
        session.data,
        meta: session.meta,
        statusCode: session.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<DataState<UserModel>> me() async {
    try {
      final profile = await _service.me();

      // `buyer_segment` hanya ada di endpoint ini, dan dibutuhkan sinkron saat
      // build untuk memutuskan apakah tier PROJECT boleh dirender.
      await _tokens.saveProfile(
        userId: profile.data.id,
        role: profile.data.role,
        buyerSegment: profile.data.buyerSegment,
        fullName: profile.data.fullName,
      );

      return DataSuccess(
        profile.data,
        meta: profile.meta,
        statusCode: profile.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<void> logout() => _tokens.clear();

  Future<void> _persist(
    AuthSessionModel session, {
    String? fallbackRole,
  }) {
    return _tokens.saveSession(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
      expiresIn: session.expiresIn,
      userId: session.userId,
      role: session.role ?? fallbackRole,
    );
  }
}
