import 'package:navy_wear/config/network/api_envelope.dart';
import 'package:navy_wear/config/network/api_exception.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/brand_model.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/model/review/review_model.dart';
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
    int? brandId,
    int? priceMin,
    int? priceMax,
    int? minRating,
    OfferSort? sort,
  }) =>
      _guardList(() => _service.offers(
            skuId: skuId,
            sellerId: sellerId,
            categoryId: categoryId,
            brandId: brandId,
            priceMin: priceMin,
            priceMax: priceMax,
            minRating: minRating,
            sort: sort,
          ));

  @override
  Future<DataState<List<OfferModel>>> flashSale({int limit = 10}) =>
      _guardList(() => _service.flashSale(limit: limit));

  @override
  Future<DataState<List<OfferModel>>> bestSellers({int limit = 10}) =>
      _guardList(() => _service.bestSellers(limit: limit));

  @override
  Future<DataState<List<BrandModel>>> brands() =>
      _guardList(() => _service.brands());

  @override
  Future<DataState<OfferFacetsModel>> facets({int? categoryId}) =>
      _guard(() => _service.facets(categoryId: categoryId));

  @override
  Future<DataState<Map<int, ReviewSummaryModel>>> reviewsSummary(
    Iterable<int> offerIds,
  ) =>
      _guard(() => _service.reviewsSummary(offerIds));

  @override
  Future<DataState<ReviewPageModel>> reviews(
    int offerId, {
    int limit = 20,
    int offset = 0,
  }) =>
      _guard(() => _service.reviews(offerId, limit: limit, offset: offset));

  @override
  Future<DataState<void>> postReview(
    int offerId, {
    required int rating,
    String? comment,
  }) async {
    try {
      await _service.postReview(offerId, rating: rating, comment: comment);
      return const DataSuccess(null);
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  @override
  Future<DataState<List<OfferModel>>> offersWithPrices({
    int? skuId,
    int? sellerId,
    int? categoryId,
    int? brandId,
    int? priceMin,
    int? priceMax,
    int? minRating,
    OfferSort? sort,
  }) async {
    try {
      final env = await _service.offers(
        skuId: skuId,
        sellerId: sellerId,
        categoryId: categoryId,
        brandId: brandId,
        priceMin: priceMin,
        priceMax: priceMax,
        minRating: minRating,
        sort: sort,
      );
      if (env.data.isEmpty) return DataEmpty<List<OfferModel>>(meta: env.meta);

      // Dibatasi karena harga HANYA ada di endpoint detail: melengkapi
      // seluruh 74 penawaran berarti 74 request untuk satu layar Home.
      // Sampai backend menyertakan harga di respons list (lihat catatan di
      // CatalogService.offers), menampilkan lebih banyak justru merugikan
      // user — layarnya jadi lambat tanpa menambah informasi.
      //
      // `meta['total_available']` membawa jumlah sebenarnya supaya UI bisa
      // jujur menampilkan "24 dari 74".
      final page = env.data.take(listPageSize).toList();
      final enriched = await _service.withPriceTiers(page);

      return DataSuccess<List<OfferModel>>(
        enriched,
        meta: {...env.meta, 'total_available': env.data.length},
        statusCode: env.statusCode,
      );
    } on ApiException catch (e) {
      return DataFailed(e.error);
    }
  }

  /// Banyaknya penawaran yang dilengkapi harga sekaligus.
  ///
  /// Ini batas biaya jaringan, bukan pilihan tampilan: setiap penawaran butuh
  /// satu `GET /offers/{id}` hanya untuk mendapat harganya.
  static const int listPageSize = 24;

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
