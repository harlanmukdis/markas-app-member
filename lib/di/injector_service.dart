import 'package:dio/dio.dart';
import 'package:navy_wear/config/network/dio_client.dart';
import 'package:navy_wear/core/data/datasources/remote/service/auth_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart';
import 'package:navy_wear/core/data/datasources/remote/service/reference_service.dart';
import 'package:navy_wear/di/injector.dart';

/// Pendaftaran seluruh `*Service` (lapisan yang benar-benar memanggil HTTP).
///
/// Setiap service menerima instance `Dio` bernama, bukan membuat sendiri:
///
/// ```dart
/// injector.registerLazySingleton<AuthService>(
///   () => AuthService(injector<Dio>(instanceName: DioClient.api)),
/// );
/// ```
///
/// Aturan yang berlaku di lapisan ini:
///
/// * Service **menangkap `DioException`** dan melemparkannya kembali sebagai
///   `ApiException` dengan konteks (nama operasinya), lewat
///   `ApiException.fromDio(e, context: 'GET /orders/12')`.
/// * Service membuka amplop respons dengan `parseEnvelope` /
///   `parseEnvelopeList`, dan mengembalikan `ApiEnvelope<T>` — bukan `T`
///   telanjang — supaya `meta` dan status HTTP (200 vs 201) tidak hilang.
/// * Cache per-id yang mahal disimpan di service sebagai `Map<int, Model>`,
///   dan panggilan massal dipotong jadi batch `Future.wait`, bukan
///   menembakkan request tanpa batas.
///
/// **Dua endpoint yang sengaja TIDAK BOLEH dibuatkan method di sini:**
///
/// * `GET /shipments` (tanpa id) — tidak difilter per buyer, mengembalikan 50
///   pengiriman terbaru **milik seluruh platform** termasuk alamat dan nama
///   penerima orang lain. Ambil daftar pengiriman dari `GET /orders/{id}`.
///   `GET /shipments/{id}` aman karena memeriksa kepemilikan.
/// * `POST /vouchers/apply` — tidak memeriksa autentikasi sama sekali, membaca
///   `buyer_id` dari body, dan memakai `discount_amount` kiriman client tanpa
///   dihitung ulang. Pakai `POST /vouchers/validate` untuk pratinjau diskon.
///
/// Keduanya dibiarkan tidak ada dengan sengaja, bukan sekadar tidak dipakai —
/// method yang ada di repository cepat atau lambat akan dipanggil orang.
void initializeService() {
  final api = injector<Dio>(instanceName: DioClient.api);

  injector.registerLazySingleton<AuthService>(() => AuthService(api));
  injector.registerLazySingleton<CatalogService>(() => CatalogService(api));
  injector.registerLazySingleton<ReferenceService>(
    () => ReferenceService(api),
  );
}
