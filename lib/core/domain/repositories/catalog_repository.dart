import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/data/datasources/remote/service/catalog_service.dart'
    show OfferSort;
import 'package:navy_wear/core/domain/model/catalog/brand_model.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';
import 'package:navy_wear/core/domain/model/review/review_model.dart';

/// Katalog: kategori, SKU master, penawaran, pencarian.
abstract interface class CatalogRepository {
  Future<DataState<List<CategoryModel>>> categories({int? parentId});
  Future<DataState<CategoryModel>> categoryDetail(int id);

  /// Salah satu dari [q]/[categoryId] wajib diisi.
  Future<DataState<List<SkuModel>>> skus({String? q, int? categoryId});

  Future<DataState<SkuModel>> skuDetail(int id, {bool forceRefresh = false});

  /// Nama & satuan dasar beberapa SKU sekaligus.
  ///
  /// Satu panggilan lewat `GET /sku-master?ids=`. Hasilnya [SkuBriefModel] —
  /// **tanpa `units[]`**, karena respons bulk tidak membawanya. Untuk pemilih
  /// satuan pakai [skuDetail].
  Future<DataState<Map<int, SkuBriefModel>>> skusByIds(Iterable<int> ids);

  /// Harga termurah beberapa penawaran sekaligus, ber-key `offer_id`.
  Future<DataState<Map<int, int>>> prices(Iterable<int> offerIds);

  /// Penawaran per SKU / toko / kategori.
  ///
  /// **Hasilnya tidak memuat `price_tiers`** (batasan backend, sudah
  /// diverifikasi). Untuk menampilkan harga, lanjutkan dengan
  /// [offersWithPrices] atau panggil [offerDetail].
  Future<DataState<List<OfferModel>>> offers({
    int? skuId,
    int? sellerId,
    int? categoryId,
    int? brandId,
    int? priceMin,
    int? priceMax,
    int? minRating,
    OfferSort? sort,
    int? page,
    int? perPage,
  });

  /// Sama seperti [offers], tapi harganya sudah dilengkapi lewat satu
  /// panggilan `GET /offers/prices` sehingga langsung bisa dirender jadi
  /// kartu produk berharga.
  ///
  /// `meta` pada [DataSuccess] membawa `{page, per_page, total, total_pages}`
  /// — **selalu** periksa itu, jangan menganggap satu respons sudah lengkap.
  Future<DataState<List<OfferModel>>> offersWithPrices({
    int? skuId,
    int? sellerId,
    int? categoryId,
    int? brandId,
    int? priceMin,
    int? priceMax,
    int? minRating,
    OfferSort? sort,
    int? page,
    int? perPage,
  });

  /// Penawaran berharga coret terverifikasi.
  Future<DataState<List<OfferModel>>> flashSale({int limit});

  /// Terlaris, membawa `qty_sold` nyata.
  Future<DataState<List<OfferModel>>> bestSellers({int limit});

  Future<DataState<List<BrandModel>>> brands();

  /// Bahan sidebar filter untuk satu kategori.
  Future<DataState<OfferFacetsModel>> facets({int? categoryId});

  /// Rating untuk **banyak** penawaran sekaligus — dipakai grid/list produk.
  ///
  /// Satu panggilan untuk semua kartu; jangan panggil [reviews] per kartu.
  Future<DataState<Map<int, ReviewSummaryModel>>> reviewsSummary(
    Iterable<int> offerIds,
  );

  Future<DataState<ReviewPageModel>> reviews(
    int offerId, {
    int limit,
    int offset,
  });

  /// [rating] harus 1..5.
  Future<DataState<void>> postReview(
    int offerId, {
    required int rating,
    String? comment,
  });
  Future<DataState<OfferModel>> offerDetail(int id);

  /// Hasilnya penawaran + info toko + estimasi ongkir.
  ///
  /// `meta` pada [DataSuccess] membawa `count` dan `keyword`.
  Future<DataState<List<OfferModel>>> search(
    String q, {
    int? zoneId,
    bool? needsTaxInvoice,
  });

  /// Buang cache SKU — dipakai pull-to-refresh.
  void clearCache();
}
