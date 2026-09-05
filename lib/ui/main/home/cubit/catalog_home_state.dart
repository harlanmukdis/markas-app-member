part of 'catalog_home_cubit.dart';

/// Apa yang sedang ditampilkan di badan Home.
enum CatalogHomeMode {
  /// Grid kategori — keadaan awal.
  browse,

  /// Hasil `GET /search`.
  searchResults,

  /// Penawaran untuk SKU dalam satu kategori.
  categoryOffers,
}

@freezed
sealed class CatalogHomeState with _$CatalogHomeState {
  const CatalogHomeState._();

  const factory CatalogHomeState({
    @Default(CatalogHomeMode.browse) CatalogHomeMode mode,

    /// Kategori level 1. Dimuat sekali saat Home pertama dibuka.
    @Default(<CategoryModel>[]) List<CategoryModel> categories,

    /// Isi daftar untuk mode [CatalogHomeMode.searchResults] dan
    /// [CatalogHomeMode.categoryOffers].
    @Default(<OfferModel>[]) List<OfferModel> offers,

    /// Nama SKU per id, untuk menamai penawaran jalur `MASTER` — `OfferModel`
    /// sendiri tidak membawa nama SKU, hanya `sku_id`.
    @Default(<int, SkuModel>{}) Map<int, SkuModel> skus,

    CategoryModel? activeCategory,
    @Default('') String keyword,

    @Default(false) bool isLoadingCategories,
    @Default(false) bool isLoadingOffers,

    /// Kegagalan terakhir. Dipisah dari data supaya daftar yang sudah termuat
    /// tidak hilang hanya karena satu permintaan berikutnya gagal.
    DataError? error,

    /// Permintaan selesai tapi hasilnya kosong — beda dari "belum dimuat".
    @Default(false) bool isEmptyResult,
  }) = _CatalogHomeState;

  bool get isBusy => isLoadingCategories || isLoadingOffers;

  /// Nama yang layak ditampilkan untuk sebuah penawaran.
  ///
  /// Penawaran jalur `BEBAS` menyimpan namanya sendiri di `freeform_name`;
  /// jalur `MASTER` harus merujuk SKU master, itulah gunanya [skus].
  String offerTitle(OfferModel offer) {
    if (offer.isFreeform) {
      return offer.freeformName ?? 'Barang tanpa nama';
    }
    final sku = offer.skuId == null ? null : skus[offer.skuId];
    return sku?.name ?? 'Produk #${offer.skuId ?? offer.id}';
  }

  /// Satuan jual bawaan SKU, untuk label "/ sak", "/ dus".
  String? offerUnit(OfferModel offer) {
    final sku = offer.skuId == null ? null : skus[offer.skuId];
    return sku?.defaultSellUnit?.unitName ?? sku?.baseUnit;
  }
}
