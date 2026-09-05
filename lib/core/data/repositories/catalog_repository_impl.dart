import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._service);

  final CatalogService _service;

  @override
  void clearCache() => _service.clearCache();

  @override
  Future<DataState<List<CategoryModel>>> categories({int? parentId}) =>
      _guardList(() => _service.categories(parentId: parentId));

  @override
  Future<DataState<CategoryModel>> categoryDetail(int id) =>
      _guard(() => _service.categoryDetail(id));

  @override
  Future<DataState<List<SkuModel>>> skus({String? q, int? categoryId}) =>
      _guardList(() => _service.skus(q: q, categoryId: categoryId));

  @override
  Future<DataState<SkuModel>> skuDetail(int id, {bool forceRefresh = false}) =>
      _guard(() => _service.skuDetail(id, forceRefresh: forceRefresh));

  @override
  Future<DataState<Map<int, SkuModel>>> skusByIds(Iterable<int> ids) async {
    try {
      final result = await _service.skusByIds(ids);
      return result.isEmpty ? const DataEmpty() : DataSuccess(result);
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<DataState<List<OfferModel>>> offers({
    int? skuId,
    int? sellerId,
    int? categoryId,
  }) =>
      _guardList(() => _service.offers(
            skuId: skuId,
            sellerId: sellerId,
            categoryId: categoryId,
          ));

  @override
  Future<DataState<List<OfferModel>>> offersWithPrices({
    int? skuId,
    int? sellerId,
    int? categoryId,
  }) async {
    try {
      final env = await _service.offers(
        skuId: skuId,
        sellerId: sellerId,
        categoryId: categoryId,
      );
      if (env.data.isEmpty) return DataEmpty<List<OfferModel>>(meta: env.meta);

      final enriched = await _service.withPriceTiers(env.data);
      return DataSuccess<List<OfferModel>>(
        enriched,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<DataState<OfferModel>> offerDetail(int id) =>
      _guard(() => _service.offerDetail(id));

  /// Hasil pencarian **dilengkapi `price_tiers`** sebelum dikembalikan.
  ///
  /// `GET /search` membawa `seller_name` dan `ongkir_mulai_dari` tapi
  /// `price_tiers`-nya kosong (sudah diverifikasi ke backend). Hasil
  /// pencarian tanpa harga tidak ada gunanya di marketplace yang justru
  /// dipakai untuk membandingkan harga, jadi pelengkapan dilakukan di sini
  /// supaya tidak ada layar yang lupa melakukannya.
  ///
  /// Biayanya satu request tambahan per penawaran. Idealnya backend
  /// menyertakan harga di respons pencarian — lihat catatan di
  /// [CatalogService.offers].
  @override
  Future<DataState<List<OfferModel>>> search(
    String q, {
    int? zoneId,
    bool? needsTaxInvoice,
  }) async {
    try {
      final env = await _service.search(
        q,
        zoneId: zoneId,
        needsTaxInvoice: needsTaxInvoice,
      );
      if (env.data.isEmpty) return DataEmpty<List<OfferModel>>(meta: env.meta);

      final enriched = await _service.withPriceTiers(env.data);
      return DataSuccess<List<OfferModel>>(
        enriched,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  Future<DataState<T>> _guard<T>(
    Future<ApiEnvelope<T>> Function() call,
  ) async {
    try {
      final env = await call();
      return DataSuccess<T>(
        env.data,
        meta: env.meta,
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  /// List kosong dikembalikan sebagai [DataEmpty], bukan [DataSuccess] berisi
  /// `[]` — supaya UI bisa membedakan "tidak ada hasil" dari "gagal memuat"
  /// tanpa memeriksa panjang list di setiap layar.
  ///
  /// `meta` tetap diteruskan karena `GET /search` menaruh `keyword` di sana,
  /// yang dibutuhkan untuk pesan "tidak ada hasil untuk «kata»".
  Future<DataState<List<T>>> _guardList<T>(
    Future<ApiEnvelope<List<T>>> Function() call,
  ) async {
    try {
      final env = await call();
      return env.data.isEmpty
          ? DataEmpty<List<T>>(meta: env.meta)
          : DataSuccess<List<T>>(
              env.data,
              meta: env.meta,
              statusCode: env.statusCode,
            );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }
}
