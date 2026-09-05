import 'package:dio/dio.dart';

import '../../../core/services/auth_events.dart';
import '../../../core/services/token_store.dart';
import '../token_refresher.dart';

/// Penanda yang dibaca [AuthInterceptor] dari `RequestOptions.extra`.
abstract final class RequestFlags {
  /// Jangan lampirkan token dan jangan coba refresh untuk request ini.
  static const noAuth = 'markas.noAuth';

  /// Ditanam interceptor supaya satu request tidak diulang dua kali.
  static const authRetried = 'markas.authRetried';
}

/// Menandai request sebagai endpoint yang tidak butuh login —
/// `/auth/login`, `/auth/register`, `/auth/refresh`.
///
/// Perlu ditandai eksplisit supaya 401 dari **login yang salah password**
/// (`INVALID_CREDENTIALS`) tidak disalahartikan sebagai token kedaluwarsa,
/// yang akan memicu refresh lalu logout paksa — padahal user memang belum
/// login.
Options noAuthOptions([Options? base]) {
  final extra = <String, dynamic>{
    ...?base?.extra,
    RequestFlags.noAuth: true,
  };
  return (base ?? Options()).copyWith(extra: extra);
}

/// Melampirkan bearer token, dan memulihkan sesi saat kena 401.
///
/// Alur `onError`:
/// 1. Bukan 401, atau request ditandai [RequestFlags.noAuth], atau sudah
///    pernah diulang → teruskan apa adanya.
/// 2. Coba refresh (digabung single-flight oleh [TokenRefresher]).
/// 3. [RefreshOutcome.success] → ulangi request asli dengan token baru.
/// 4. [RefreshOutcome.rejected] → hapus sesi + siarkan force-logout.
/// 5. [RefreshOutcome.unavailable] → **jangan** logout; teruskan error asli
///    supaya user bisa mencoba lagi setelah koneksinya kembali.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required TokenStore tokens,
    required TokenRefresher refresher,
    required AuthEvents authEvents,
    required Dio retryClient,
  })  : _tokens = tokens,
        _refresher = refresher,
        _authEvents = authEvents,
        _retryClient = retryClient;

  final TokenStore _tokens;
  final TokenRefresher _refresher;
  final AuthEvents _authEvents;

  /// Dio polos untuk mengulang request.
  ///
  /// Sengaja bukan client utama: mengulang lewat client yang sama akan
  /// menjalankan rantai interceptor dari awal. Penanda [RequestFlags.authRetried]
  /// sebenarnya sudah mencegah rekursi, tapi memakai client polos membuat
  /// perilakunya jelas tanpa bergantung pada penanda itu.
  final Dio _retryClient;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.extra[RequestFlags.noAuth] != true) {
      final token = _tokens.accessToken;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;

    final notRecoverable = err.response?.statusCode != 401 ||
        options.extra[RequestFlags.noAuth] == true ||
        options.extra[RequestFlags.authRetried] == true ||
        !_tokens.hasSession;

    if (notRecoverable) return handler.next(err);

    final outcome = await _refresher.refresh();

    switch (outcome) {
      case RefreshOutcome.rejected:
        await _tokens.clear();
        _authEvents.emitForceLogout();
        return handler.next(err);

      case RefreshOutcome.unavailable:
        return handler.next(err);

      case RefreshOutcome.success:
        break;
    }

    try {
      final retried = await _retryClient.fetch<dynamic>(
        options.copyWith(
          extra: {...options.extra, RequestFlags.authRetried: true},
          headers: {
            ...options.headers,
            'Authorization': 'Bearer ${_tokens.accessToken}',
          },
        ),
      );
      return handler.resolve(retried);
    } on DioException catch (retryError) {
      return handler.next(retryError);
    }
  }
}
