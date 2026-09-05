import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/auth/auth_session_model.dart';
import 'package:navy_wear/core/domain/model/auth/user_model.dart';
import 'package:navy_wear/core/domain/repositories/auth_repository.dart';
import 'package:navy_wear/core/services/auth_events.dart';
import 'package:navy_wear/di/injector.dart';
import 'package:navy_wear/ui/main/auth/cubit/auth_cubit.dart';

const _user = UserModel(
  id: 3,
  phone: '081200000001',
  role: 'BUY_R',
  buyerSegment: 'RETAIL',
  status: 'ACTIVE',
);

const _session = AuthSessionModel(
  userId: 3,
  accessToken: 'access',
  refreshToken: 'refresh',
  role: 'BUY_R',
);

DataError _error(String code, {int? status}) => DataError(
      code: code,
      message: code,
      statusCode: status,
      kind: DataErrorKind.api,
    );

class _FakeAuthRepository implements AuthRepository {
  DataState<AuthSessionModel> loginResult = const DataSuccess(_session);
  DataState<AuthSessionModel> registerResult =
      const DataSuccess(_session, meta: {'auto_login': true});
  DataState<UserModel> meResult = const DataSuccess(_user);

  @override
  bool hasSession = false;

  bool loggedOut = false;

  @override
  Future<DataState<AuthSessionModel>> login({
    required String password,
    String? phone,
    String? email,
  }) async =>
      loginResult;

  @override
  Future<DataState<AuthSessionModel>> register({
    required String phone,
    required String password,
    required String fullName,
    required String role,
    String? email,
    String? npwp,
    String? nibSiupNo,
  }) async =>
      registerResult;

  @override
  Future<DataState<UserModel>> me() async => meResult;

  @override
  Future<void> logout() async => loggedOut = true;
}

void main() {
  late _FakeAuthRepository repository;
  late AuthEvents authEvents;

  setUp(() {
    repository = _FakeAuthRepository();
    authEvents = AuthEvents();
    // Cubit menarik dependency-nya dari injector (konvensi Part 2
    // CLAUDE.md), jadi test mendaftarkan versi palsunya.
    injector
      ..registerSingleton<AuthRepository>(repository)
      ..registerSingleton<AuthEvents>(authEvents);
  });

  tearDown(() async {
    await injector.reset();
    await authEvents.dispose();
  });

  group('login', () {
    test('sukses berujung authenticated dengan profil terisi', () async {
      final cubit = AuthCubit();
      final states = <AuthState>[];
      cubit.stream.listen(states.add);

      await cubit.login(phone: '081200000001', password: 'secret123');
      await Future<void>.delayed(Duration.zero);

      expect(states.first, isA<AuthLoading>());
      expect(cubit.state, isA<AuthAuthenticated>());
      expect((cubit.state as AuthAuthenticated).user?.buyerSegment, 'RETAIL');
      await cubit.close();
    });

    test('kredensial salah berujung unauthenticated dengan error', () async {
      repository.loginResult =
          DataFailed(_error(ApiErrorCode.invalidCredentials, status: 401));

      final cubit = AuthCubit();
      await cubit.login(phone: '081200000001', password: 'salah');

      expect(cubit.state, isA<AuthUnauthenticated>());
      expect((cubit.state as AuthUnauthenticated).error?.code,
          ApiErrorCode.invalidCredentials);
      await cubit.close();
    });

    test('GET /auth/me gagal TIDAK menggagalkan login', () async {
      // Token sudah tersimpan dan sah; menendang user ke login hanya karena
      // profilnya belum termuat akan membuat login terasa rusak.
      repository.meResult = DataFailed(_error('CLIENT_NETWORK'));

      final cubit = AuthCubit();
      await cubit.login(phone: '081200000001', password: 'secret123');

      expect(cubit.state, isA<AuthAuthenticated>());
      expect((cubit.state as AuthAuthenticated).user, isNull);
      await cubit.close();
    });
  });

  group('register', () {
    test('auto_login false berujung registeredNeedsLogin', () async {
      repository.registerResult =
          const DataSuccess(_session, meta: {'auto_login': false});

      final cubit = AuthCubit();
      await cubit.register(
        phone: '081200000001',
        password: 'secret123',
        fullName: 'Budi',
        role: 'BUY_R',
      );

      // Bukan authenticated (tidak ada refresh token) dan bukan gagal
      // (akunnya sudah terbentuk).
      expect(cubit.state, isA<AuthRegisteredNeedsLogin>());
      await cubit.close();
    });
  });

  group('restoreSession', () {
    test('tanpa token tersimpan langsung unauthenticated tanpa request',
        () async {
      repository.hasSession = false;

      final cubit = AuthCubit();
      await cubit.restoreSession();

      expect(cubit.state, isA<AuthUnauthenticated>());
      expect((cubit.state as AuthUnauthenticated).error, isNull);
      await cubit.close();
    });

    test('token ditolak server berujung logout', () async {
      repository.hasSession = true;
      repository.meResult =
          DataFailed(_error(ApiErrorCode.unauthenticated, status: 401));

      final cubit = AuthCubit();
      await cubit.restoreSession();

      expect(repository.loggedOut, isTrue);
      expect(cubit.state, isA<AuthUnauthenticated>());
      await cubit.close();
    });

    test('gangguan jaringan TIDAK mem-logout user', () async {
      // Ini pembedaan yang penting: sesi 30 hari tidak boleh hilang hanya
      // karena sinyal sempat mati.
      repository.hasSession = true;
      repository.meResult = DataFailed(_error(ClientErrorCode.network));

      final cubit = AuthCubit();
      await cubit.restoreSession();

      expect(repository.loggedOut, isFalse);
      expect(cubit.state, isA<AuthAuthenticated>());
      await cubit.close();
    });
  });

  group('force logout dari interceptor', () {
    test('siaran AuthEvents mengubah status jadi unauthenticated', () async {
      final cubit = AuthCubit();
      expect(cubit.state, isA<AuthInitial>());

      authEvents.emitForceLogout();
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state, isA<AuthUnauthenticated>());
      expect((cubit.state as AuthUnauthenticated).error?.isUnauthenticated,
          isTrue);
      await cubit.close();
    });
  });
}
