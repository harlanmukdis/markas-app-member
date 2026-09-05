import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/catalog/category_model.dart';
import 'package:navy_wear/core/domain/model/catalog/offer_model.dart';
import 'package:navy_wear/core/domain/model/catalog/sku_model.dart';

/// Katalog: kategori, SKU master, penawaran, pencarian.
abstract interface class CatalogRepository {
  Future<DataState<List<CategoryModel>>> categories({int? parentId});
  Future<DataState<CategoryModel>> categoryDetail(int id);

  /// Salah satu dari [q]/[categoryId] wajib diisi.
  Future<DataState<List<SkuModel>>> skus({String? q, int? categoryId});

  Future<DataState<SkuModel>> skuDetail(int id, {bool forceRefresh = false});

  /// Beberapa SKU sekaligus, memanfaatkan cache dan dipotong jadi batch.
  Future<DataState<Map<int, SkuModel>>> skusByIds(Iterable<int> ids);

  /// Penawaran per SKU / toko / kategori.
  ///
  /// **Hasilnya tidak memuat `price_tiers`** (batasan backend, sudah
  /// diverifikasi). Untuk menampilkan harga, lanjutkan dengan
  /// [offersWithPrices] atau panggil [offerDetail].
  Future<DataState<List<OfferModel>>> offers({
    int? skuId,
    int? sellerId,
    int? categoryId,
  });

  /// Sama seperti [offers], tapi sudah dilengkapi `price_tiers` sehingga
  /// langsung bisa dirender jadi kartu produk berharga.
  Future<DataState<List<OfferModel>>> offersWithPrices({
    int? skuId,
    int? sellerId,
    int? categoryId,
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
