import 'package:dio/dio.dart';

import '../../core/services/token_store.dart';
import '../../util/json_converters.dart';

/// Hasil satu upaya refresh.
///
/// Tiga keadaan ini **wajib** dibedakan. Kalau "gagal karena internet mati"
/// diperlakukan sama dengan "ditolak server", user ter-logout setiap kali
/// sinyalnya hilang sebentar — padahal sesinya masih sah sampai 30 hari.
enum RefreshOutcome {
  /// Access token baru sudah tersimpan; request asli boleh diulang.
  success,

  /// Server menolak refresh token (`INVALID_REFRESH_TOKEN` / `REFRESH_REVOKED`)
  /// atau tidak ada refresh token untuk dipakai. Sesi mati → paksa login ulang.
  rejected,

  /// Tidak sampai ke server (jaringan/timeout). Sesi **tetap dianggap sah**;
  /// teruskan saja error aslinya dan biarkan user mencoba lagi.
  unavailable,
}

/// Menukar refresh token jadi access token baru, **satu permintaan sekaligus**.
///
/// Kenapa perlu single-flight: satu layar bisa memicu beberapa request
/// bersamaan (mis. detail order + status pembayaran). Kalau access token sudah
/// kedaluwarsa, semuanya balik 401 hampir serentak. Tanpa penggabungan, tiap
/// request memanggil `/auth/refresh` sendiri — backend melihat rentetan
/// refresh, dan pada implementasi yang merotasi/mencabut token, refresh kedua
/// bisa membatalkan hasil yang pertama sehingga user justru ter-logout.
class TokenRefresher {
  TokenRefresher({required TokenStore tokens, required String baseUrl})
      : _tokens = tokens,
        // Dio terpisah **tanpa interceptor** dengan sengaja: kalau memakai
        // client utama, 401 dari endpoint refresh akan memicu AuthInterceptor
        // lagi dan berujung rekursi.
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
        );

  final TokenStore _tokens;
  final Dio _dio;

  Future<RefreshOutcome>? _inFlight;

  /// Pemanggil yang datang saat refresh sedang berjalan akan menunggu hasil
  /// yang sama, bukan memulai refresh baru.
  Future<RefreshOutcome> refresh() {
    return _inFlight ??= _run().whenComplete(() => _inFlight = null);
  }

  Future<RefreshOutcome> _run() async {
    final refreshToken = _tokens.refreshToken;

    // Tidak ada refresh token sama sekali — kondisi normal untuk user yang
    // baru mendaftar, karena `POST /auth/register` hanya mengembalikan access
    // token. Begitu access token itu kedaluwarsa, sesinya memang tidak bisa
    // dipulihkan.
    if (refreshToken == null) return RefreshOutcome.rejected;

    try {
      final response = await _dio.post<dynamic>(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final body = response.data;
      final data = body is Map ? body['data'] : null;
      final accessToken = data is Map ? data['access_token'] : null;

      // HTTP 2xx tapi bentuk body tidak seperti yang diharapkan. Diperlakukan
      // sebagai penolakan, bukan gangguan jaringan — mengulangnya tidak akan
      // mengubah hasil.
      if (body is! Map ||
          body['success'] != true ||
          accessToken is! String ||
          accessToken.isEmpty) {
        return RefreshOutcome.rejected;
      }

      await _tokens.saveAccessToken(
        accessToken,
        expiresIn: asIntOrNull((data as Map)['expires_in']),
      );
      return RefreshOutcome.success;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.badCertificate:
          return RefreshOutcome.unavailable;

        case DioExceptionType.badResponse:
          // Server menjawab dan menolak. 5xx dikecualikan: itu gangguan di
          // sisi server, bukan pernyataan bahwa token kita tidak sah.
          final status = e.response?.statusCode ?? 0;
          return status >= 500
              ? RefreshOutcome.unavailable
              : RefreshOutcome.rejected;

        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
          return RefreshOutcome.unavailable;
      }
    }
  }
}
