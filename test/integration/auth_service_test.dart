/// Uji `AuthService` terhadap backend Markas yang **benar-benar jalan**.
///
/// ```bash
/// flutter test test/integration/
/// ```
///
/// Sengaja memakai nomor HP tetap yang sudah terdaftar, bukan nomor acak per
/// run — supaya tabel `users` di database dev tidak terus bertambah setiap
/// kali test dijalankan. Konsekuensinya, bentuk respons `register` yang sukses
/// diverifikasi lewat jalur 409 `PHONE_TAKEN` di sini; bentuk suksesnya
/// didokumentasikan di `AuthSessionModel`.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';

/// Akun uji yang sudah didaftarkan sekali. Kalau database dev di-reset,
/// test `PHONE_TAKEN` akan gagal — daftarkan ulang lewat register manual.
const _phone = '081299000777';
const _password = 'secret123';

void main() {
  late AuthService service;

  setUpAll(() {
    service = AuthService(DioClient.createBare(Env.apiBaseUrl));
  });

  test('login mengembalikan refresh token dan role', () async {
    final session = await service.login(phone: _phone, password: _password);

    expect(session.statusCode, 200);
    expect(
      session.data.refreshToken,
      isNotNull,
      reason: 'hanya login yang memberi refresh token — register tidak',
    );
    expect(session.data.role, 'BUY_R');
    expect(session.data.expiresIn, 7200);
    expect(session.data.userId, greaterThan(0));
  });

  test(
    'GET /auth/me mem-parse id String jadi int',
    skip: 'DIBLOKIR BUG BACKEND: endpoint terproteksi hanya menerima nama '
        'header dengan ejaan persis `Authorization`. Dart selalu me-lowercase '
        'nama header (`authorization`), sehingga SEMUA request terautentikasi '
        'dari klien native Dart/Flutter balik 401. Dibuktikan: curl dengan '
        '`Authorization` -> 200, dengan `authorization` -> 401; dan '
        'HttpHeaders.set(..., preserveHeaderCase: true) -> 200 sementara '
        'default -> 401. Perbaikannya di BE (baca header case-insensitive, '
        'mis. lewat \$_SERVER[HTTP_AUTHORIZATION]). Hapus skip ini setelah '
        'diperbaiki.',
    () async {
    final session = await service.login(phone: _phone, password: _password);

    final dio = DioClient.createBare(Env.apiBaseUrl);
    dio.options.headers['Authorization'] =
        'Bearer ${session.data.accessToken}';
    final authed = AuthService(dio);

    final profile = await authed.me();

    // Backend mengirim `"id": "3"` (String) di sini, tapi `"user_id": 3` (int)
    // di login. Converter yang membuat keduanya sampai sebagai int.
    expect(profile.data.id, isA<int>());
    expect(profile.data.id, session.data.userId);
    expect(profile.data.buyerSegment, 'RETAIL');
    expect(profile.data.isB2B, isFalse);
    expect(profile.data.isSuspended, isFalse);
    expect(profile.data.phone, _phone);
    },
  );

  test('password salah jadi INVALID_CREDENTIALS, bukan sesi kedaluwarsa',
      () async {
    try {
      await service.login(phone: _phone, password: 'jelas-salah');
      fail('seharusnya melempar');
    } on ApiException catch (e) {
      expect(e.error.code, 'INVALID_CREDENTIALS');
      expect(e.error.statusCode, 401);
    }
  });

  test('nomor sudah terdaftar jadi 409 PHONE_TAKEN', () async {
    try {
      await service.register(
        phone: _phone,
        password: _password,
        fullName: 'Tes Integrasi Claude',
        role: 'BUY_R',
      );
      fail('seharusnya melempar — nomor ini sudah terdaftar');
    } on ApiException catch (e) {
      expect(e.error.code, 'PHONE_TAKEN');
      expect(e.error.statusCode, 409);
      expect(e.error.isConflict, isTrue);
    }
  });

  test('B2B tanpa npwp/nib ditolak 422 dengan daftar field yang kurang',
      () async {
    try {
      await service.register(
        phone: '081299000${DateTime.now().millisecond}',
        password: _password,
        fullName: 'Tes B2B Tanpa Dokumen',
        role: 'BUY_B',
      );
      fail('seharusnya melempar — BUY_B wajib npwp dan nib_siup_no');
    } on ApiException catch (e) {
      expect(e.error.statusCode, 422);
      expect(e.error.code, 'VALIDATION_ERROR');
    }
  });

  test('GET /auth/me tanpa token ditolak 401', () async {
    try {
      await service.me();
      fail('seharusnya melempar');
    } on ApiException catch (e) {
      expect(e.error.isUnauthenticated, isTrue);
    }
  });
}
