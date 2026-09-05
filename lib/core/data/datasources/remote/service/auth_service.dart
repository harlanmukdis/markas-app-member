import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/config/network/interceptors/auth_interceptor.dart';
import 'package:navy_wear/core/domain/model/auth/auth_session_model.dart';
import 'package:navy_wear/core/domain/model/auth/user_model.dart';

/// Panggilan HTTP untuk `/auth/*`.
///
/// Sesuai kontrak lapisan: menangkap [DioException] dan melemparkannya kembali
/// sebagai [ApiException] berkonteks. Tidak mengubah status login — itu tugas
/// repository.
///
/// `POST /auth/refresh` **tidak ada di sini** dengan sengaja: refresh dimiliki
/// `TokenRefresher`, yang memakai `Dio` polos supaya tidak memicu
/// `AuthInterceptor` secara rekursif.
class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  /// `POST /auth/register`.
  ///
  /// [npwp] dan [nibSiupNo] **wajib** kalau [role] adalah `BUY_B`; server
  /// membalas `422 VALIDATION_ERROR` kalau kosong.
  Future<ApiEnvelope<AuthSessionModel>> register({
    required String phone,
    required String password,
    required String fullName,
    required String role,
    String? email,
    String? npwp,
    String? nibSiupNo,
  }) async {
    const context = 'POST /auth/register';
    try {
      final response = await _dio.post<dynamic>(
        '/auth/register',
        // Field opsional dibuang kalau kosong, bukan dikirim sebagai null:
        // backend memvalidasi keberadaan field, dan `"email": null` bisa
        // dianggap email kosong yang tidak valid.
        data: _compact({
          'phone': phone,
          'password': password,
          'full_name': fullName,
          'role': role,
          'email': email,
          'npwp': npwp,
          'nib_siup_no': nibSiupNo,
        }),
        options: noAuthOptions(),
      );
      return parseEnvelope(
        response,
        (raw) => AuthSessionModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `POST /auth/login`. Salah satu dari [phone] atau [email] wajib diisi.
  Future<ApiEnvelope<AuthSessionModel>> login({
    required String password,
    String? phone,
    String? email,
  }) async {
    assert(
      (phone != null && phone.isNotEmpty) || (email != null && email.isNotEmpty),
      'login butuh phone atau email',
    );

    const context = 'POST /auth/login';
    try {
      final response = await _dio.post<dynamic>(
        '/auth/login',
        data: _compact({
          'phone': phone,
          'email': email,
          'password': password,
        }),
        // Ditandai noAuth supaya 401 `INVALID_CREDENTIALS` dari password yang
        // salah tidak disalahartikan sebagai token kedaluwarsa — kalau tidak,
        // interceptor akan mencoba refresh lalu memaksa logout.
        options: noAuthOptions(),
      );
      return parseEnvelope(
        response,
        (raw) => AuthSessionModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  /// `GET /auth/me`. Butuh bearer token.
  ///
  /// Ini satu-satunya sumber `buyer_segment` — `login` hanya mengirim `role`.
  Future<ApiEnvelope<UserModel>> me() async {
    const context = 'GET /auth/me';
    try {
      final response = await _dio.get<dynamic>('/auth/me');
      return parseEnvelope(
        response,
        (raw) => UserModel.fromJson(Map<String, dynamic>.from(raw as Map)),
        context: context,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  Map<String, dynamic> _compact(Map<String, dynamic> source) {
    return {
      for (final entry in source.entries)
        if (entry.value != null &&
            !(entry.value is String && (entry.value as String).trim().isEmpty))
          entry.key: entry.value,
    };
  }
}
