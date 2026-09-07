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

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';

/// Akun uji resmi dari tim backend.
///
/// Dipakai apa adanya, bukan nomor acak per run, supaya tabel `users` di
/// database dev tidak terus bertambah setiap kali test dijalankan.
const _retailPhone = '081100000001';
const _b2bPhone = '081100000002';
const _password = 'password123';

void main() {
  late AuthService service;

  setUpAll(() {
    service = AuthService(DioClient.createBare(Env.apiBaseUrl));
  });

  test('login mengembalikan refresh token dan role', () async {
    final session = await service.login(phone: _retailPhone, password: _password);

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
    // Dijalankan di web, di-skip di native. Bug backend-nya hanya menjegal
    // klien native: Dart dart:io me-lowercase nama header, sedangkan adapter
    // browser mengirimnya sesuai ejaan yang ditulis.
    //   flutter test --platform chrome test/integration/
    skip: kIsWeb
        ? false
        : 'DIBLOKIR BUG BACKEND (native saja): endpoint terproteksi hanya menerima nama '
        'header dengan ejaan persis `Authorization`. Dart selalu me-lowercase '
        'nama header (`authorization`), sehingga SEMUA request terautentikasi '
        'dari klien native Dart/Flutter balik 401. Dibuktikan: curl dengan '
        '`Authorization` -> 200, dengan `authorization` -> 401; dan '
        'HttpHeaders.set(..., preserveHeaderCase: true) -> 200 sementara '
        'default -> 401. Perbaikannya di BE (baca header case-insensitive, '
        'mis. lewat \$_SERVER[HTTP_AUTHORIZATION]). Hapus skip ini setelah '
        'diperbaiki. Test ini LOLOS di --platform chrome.',
    () async {
    final session = await service.login(phone: _retailPhone, password: _password);

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
    expect(profile.data.phone, _retailPhone);

    // Backend v2.2 mengganti nama field di endpoint INI saja: id user jadi
    // `seq` dan nama jadi `name`, sementara /offers, /categories, /brands dan
    // sisanya tetap `id`. Perubahan itu TIDAK disebutkan di catatan rilis —
    // dua assert ini yang menangkapnya, dan yang akan menangkapnya lagi kalau
    // penamaannya berubah sekali lagi.
    expect(profile.data.fullName, isNotNull);
    expect(profile.data.fullName, isNotEmpty);
    expect(profile.data.createdDate, isNotNull,
        reason: 'v2.2: created_at -> created_date');
    },
  );

  test('password salah jadi INVALID_CREDENTIALS, bukan sesi kedaluwarsa',
      () async {
    try {
      await service.login(phone: _retailPhone, password: 'jelas-salah');
      fail('seharusnya melempar');
    } on ApiException catch (e) {
      expect(e.error.code, 'INVALID_CREDENTIALS');
      expect(e.error.statusCode, 401);
    }
  });

  test('nomor sudah terdaftar jadi 409 PHONE_TAKEN', () async {
    try {
      await service.register(
        phone: _retailPhone,
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

  test(
    'akun B2B membuka gating tier PROJECT dan modul RFQ',
    // Sama seperti test /auth/me di atas: hanya bisa dijalankan di web
    // sampai bug case-sensitivity header di backend diperbaiki.
    skip: kIsWeb
        ? false
        : 'DIBLOKIR BUG BACKEND (native saja): header Authorization '
            'case-sensitive. Jalankan dengan --platform chrome.',
    () async {
      final session =
          await service.login(phone: _b2bPhone, password: _password);
      expect(session.data.role, 'BUY_B');

      final dio = DioClient.createBare(Env.apiBaseUrl);
      dio.options.headers['Authorization'] =
          'Bearer ${session.data.accessToken}';
      final profile = await AuthService(dio).me();

      expect(profile.data.buyerSegment, 'B2B');

      // Penentu tunggal apakah tier harga PROJECT boleh dirender dan menu
      // RFQ boleh muncul (aturan PRD-06).
      expect(profile.data.isB2B, isTrue);
      expect(profile.data.npwp, isNotNull);

      // NPWP sudah diisi tapi admin belum memverifikasi — UI perlu
      // membedakan ini dari akun B2B yang sudah terverifikasi.
      expect(profile.data.b2bVerifiedAt, isNull);
      expect(profile.data.isPendingB2BVerification, isTrue);
    },
  );

  test('GET /auth/me tanpa token ditolak 401', () async {
    try {
      await service.me();
      fail('seharusnya melempar');
    } on ApiException catch (e) {
      expect(e.error.isUnauthenticated, isTrue);
    }
  });
}
