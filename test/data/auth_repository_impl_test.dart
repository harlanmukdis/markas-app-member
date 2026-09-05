import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data/repositories/auth_repository_impl.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/auth/auth_session_model.dart';
import 'package:navy_wear/core/domain/model/auth/user_model.dart';
import 'package:navy_wear/core/services/token_store.dart';

/// Service palsu — meniru dua bentuk respons berbeda yang sudah diverifikasi
/// dari backend: `register` tanpa `refresh_token`/`role`, `login` dengan
/// keduanya.
class _FakeAuthService extends AuthService {
  _FakeAuthService() : super(Dio());

  bool registerCalled = false;
  bool loginCalled = false;
  ApiException? loginError;
  ApiException? registerError;

  @override
  Future<ApiEnvelope<AuthSessionModel>> register({
    required String phone,
    required String password,
    required String fullName,
    required String role,
    String? email,
    String? npwp,
    String? nibSiupNo,
  }) async {
    registerCalled = true;
    if (registerError != null) throw registerError!;
    return const ApiEnvelope(
      data: AuthSessionModel(
        userId: 3,
        accessToken: 'access-dari-register',
        expiresIn: 7200,
        // Sengaja: backend TIDAK mengirim keduanya di endpoint register.
        refreshToken: null,
        role: null,
      ),
      statusCode: 201,
    );
  }

  @override
  Future<ApiEnvelope<AuthSessionModel>> login({
    required String password,
    String? phone,
    String? email,
  }) async {
    loginCalled = true;
    if (loginError != null) throw loginError!;
    return const ApiEnvelope(
      data: AuthSessionModel(
        userId: 3,
        accessToken: 'access-dari-login',
        refreshToken: 'refresh-30-hari',
        role: 'BUY_R',
        expiresIn: 7200,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<ApiEnvelope<UserModel>> me() async => const ApiEnvelope(
        data: UserModel(
          id: 3,
          phone: '081200000001',
          role: 'BUY_R',
          buyerSegment: 'RETAIL',
          status: 'ACTIVE',
        ),
        statusCode: 200,
      );
}

/// TokenStore palsu yang mencatat apa yang tersimpan, tanpa menyentuh
/// keychain maupun SharedPreferences.
class _FakeTokenStore extends TokenStore {
  _FakeTokenStore() : super(const FlutterSecureStorage());

  final List<Map<String, Object?>> sessions = [];
  final List<Map<String, Object?>> profiles = [];
  bool cleared = false;

  @override
  bool get hasSession => sessions.isNotEmpty;

  @override
  Future<void> saveSession({
    required String accessToken,
    String? refreshToken,
    int? expiresIn,
    int? userId,
    String? role,
    String? buyerSegment,
  }) async {
    sessions.add({
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userId': userId,
      'role': role,
    });
  }

  @override
  Future<void> saveProfile({
    int? userId,
    String? role,
    String? buyerSegment,
    String? fullName,
  }) async {
    profiles.add({
      'userId': userId,
      'role': role,
      'buyerSegment': buyerSegment,
      'fullName': fullName,
    });
  }

  @override
  Future<void> clear() async => cleared = true;
}

ApiException _apiError(String code, {int status = 409}) => ApiException(
      DataError(
        code: code,
        message: code,
        statusCode: status,
        kind: DataErrorKind.api,
      ),
    );

void main() {
  late _FakeAuthService service;
  late _FakeTokenStore tokens;
  late AuthRepositoryImpl repository;

  setUp(() {
    service = _FakeAuthService();
    tokens = _FakeTokenStore();
    repository = AuthRepositoryImpl(service, tokens);
  });

  group('register wajib dilanjutkan login otomatis', () {
    test('memanggil login dan menyimpan refresh token', () async {
      final result = await repository.register(
        phone: '081200000001',
        password: 'secret123',
        fullName: 'Budi',
        role: 'BUY_R',
      );

      expect(service.registerCalled, isTrue);
      expect(
        service.loginCalled,
        isTrue,
        reason: 'tanpa login, sesi mati setelah 2 jam tanpa bisa dipulihkan',
      );

      final success = result as DataSuccess<AuthSessionModel>;
      expect(success.meta['auto_login'], isTrue);
      expect(success.data.refreshToken, 'refresh-30-hari');

      // Sesi disimpan dua kali: dari register (jaring aman) lalu dari login.
      expect(tokens.sessions, hasLength(2));
      expect(tokens.sessions.first['refreshToken'], isNull);
      expect(tokens.sessions.last['refreshToken'], 'refresh-30-hari');
    });

    test('role diambil dari input client karena register tidak mengirimnya',
        () async {
      await repository.register(
        phone: '081200000002',
        password: 'secret123',
        fullName: 'Sinta',
        role: 'BUY_B',
      );

      // Respons register tidak memuat `role`; tanpa fallback ini, gating B2B
      // tidak punya dasar sampai `GET /auth/me` dipanggil.
      expect(tokens.sessions.first['role'], 'BUY_B');
    });

    test('login otomatis gagal tetap dilaporkan SUKSES dengan penanda',
        () async {
      service.loginError = _apiError('CLIENT_NETWORK', status: 0);

      final result = await repository.register(
        phone: '081200000003',
        password: 'secret123',
        fullName: 'Agus',
        role: 'BUY_R',
      );

      // Akunnya sungguh terbentuk. Melaporkan gagal akan membuat user
      // mendaftar ulang dan kena 409 PHONE_TAKEN.
      expect(result, isA<DataSuccess<AuthSessionModel>>());
      final success = result as DataSuccess<AuthSessionModel>;
      expect(success.meta['auto_login'], isFalse);
      expect(success.data.role, 'BUY_R');
    });

    test('register gagal tidak memanggil login dan mengembalikan DataFailed',
        () async {
      service.registerError = _apiError('PHONE_TAKEN');

      final result = await repository.register(
        phone: '081200000001',
        password: 'secret123',
        fullName: 'Budi',
        role: 'BUY_R',
      );

      expect(service.loginCalled, isFalse);
      expect(result, isA<DataFailed<AuthSessionModel>>());
      expect((result as DataFailed<AuthSessionModel>).error.code,
          'PHONE_TAKEN');
    });
  });

  group('repository tidak pernah throw', () {
    test('kegagalan login jadi DataFailed, bukan exception', () async {
      service.loginError = _apiError('INVALID_CREDENTIALS', status: 401);

      final result =
          await repository.login(phone: '0812', password: 'salah');

      expect(result, isA<DataFailed<AuthSessionModel>>());
      final error = (result as DataFailed<AuthSessionModel>).error;
      expect(error.code, ApiErrorCode.invalidCredentials);
      expect(error.isUnauthenticated, isTrue);
    });
  });

  group('me menyimpan buyer_segment', () {
    test('buyer_segment disimpan tanpa menyentuh token', () async {
      final result = await repository.me();

      expect(result, isA<DataSuccess<UserModel>>());
      expect(tokens.profiles, hasLength(1));
      expect(tokens.profiles.single['buyerSegment'], 'RETAIL');
      // Penting: tidak lewat saveSession, jadi tidak butuh access token.
      expect(tokens.sessions, isEmpty);
    });
  });
}
