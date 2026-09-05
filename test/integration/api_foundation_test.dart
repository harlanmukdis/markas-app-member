/// Uji lapisan jaringan terhadap backend Markas yang **benar-benar jalan**.
///
/// Berbeda dari `test/util/` yang murni dan selalu bisa dijalankan, file ini
/// butuh backend hidup di `API_BASE_URL` (lihat `.env`). Jalankan dengan:
///
/// ```bash
/// flutter test test/integration/
/// ```
///
/// Tujuannya membuktikan bahwa amplop respons, pemetaan error, dan pembedaan
/// 404-salah-URL vs 404-data-tidak-ada memang cocok dengan perilaku server —
/// bukan hanya cocok dengan dokumentasi.
library;

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navy_wear/config/env/env.dart';
import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/util/json_converters.dart';

void main() {
  late Dio dio;

  setUpAll(() {
    dio = DioClient.createBare(Env.apiBaseUrl);
  });

  /// Meniru apa yang dilakukan lapisan `*Service`: tangkap [DioException],
  /// lempar ulang sebagai [ApiException].
  Future<ApiEnvelope<T>> call<T>(
    Future<Response<dynamic>> Function() request,
    T Function(dynamic raw) parse, {
    required String context,
  }) async {
    try {
      return parseEnvelope<T>(await request(), parse, context: context);
    } on DioException catch (e) {
      throw ApiException.fromDio(e, context: context);
    }
  }

  test('backend terjangkau di ${Env.apiBaseUrl}', () async {
    final response = await dio.get<dynamic>('/zones');
    expect(
      response.statusCode,
      200,
      reason: 'Backend harus jalan untuk test ini. '
          'Cek Apache/MAMP dan nilai API_BASE_URL di .env.',
    );
  });

  test('parseEnvelopeList membuka amplop GET /zones', () async {
    final env = await call<List<Map<String, dynamic>>>(
      () => dio.get<dynamic>('/zones'),
      (raw) => (raw as List).cast<Map<String, dynamic>>(),
      context: 'GET /zones',
    );

    expect(env.data, isNotEmpty);
    expect(env.statusCode, 200);

    // Membuktikan alasan converter itu ada: `id` datang sebagai String dari
    // driver MySQL, bukan number.
    final first = env.data.first;
    expect(first['id'], isA<String>());
    expect(asInt(first['id']), greaterThan(0));
    expect(first['level'], isNotNull);
  });

  test('kredensial salah dipetakan jadi DataError yang benar', () async {
    await expectLater(
      call<Map<String, dynamic>>(
        () => dio.post<dynamic>(
          '/auth/login',
          data: {'phone': '080000000000', 'password': 'pasti-salah'},
        ),
        (raw) => raw as Map<String, dynamic>,
        context: 'POST /auth/login',
      ),
      throwsA(
        isA<ApiException>().having(
          (e) => e.error,
          'error',
          isA<DataError>()
              .having((e) => e.statusCode, 'statusCode', 401)
              .having((e) => e.kind, 'kind', DataErrorKind.api)
              // Bukan token kedaluwarsa — ini kredensial salah, jadi UI harus
              // menampilkan pesan, bukan memaksa logout.
              .having((e) => e.code, 'code', ApiErrorCode.invalidCredentials),
        ),
      ),
    );
  });

  test('URL salah dibedakan dari data tidak ada', () async {
    try {
      await call<dynamic>(
        () => dio.get<dynamic>('/endpoint-yang-tidak-ada'),
        (raw) => raw,
        context: 'GET /endpoint-yang-tidak-ada',
      );
      fail('seharusnya melempar');
    } on ApiException catch (e) {
      expect(e.error.statusCode, 404);
      // Inti pembedaannya: ini bug URL di sisi app, dan TIDAK boleh
      // ditampilkan ke user sebagai "data tidak ditemukan".
      expect(e.error.isRouteNotFound, isTrue);
      expect(e.error.isDataNotFound, isFalse);
    }
  });

  test('endpoint terproteksi menolak request tanpa token', () async {
    try {
      await call<dynamic>(
        () => dio.get<dynamic>('/cart/view'),
        (raw) => raw,
        context: 'GET /cart/view',
      );
      fail('seharusnya melempar 401');
    } on ApiException catch (e) {
      expect(e.error.statusCode, 401);
      expect(e.error.isUnauthenticated, isTrue);
    }
  });
}
