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

    /// Ringkasan rating per `offer_id`.
    ///
    /// Diambil sekali lewat `GET /offers/reviews-summary?ids=` untuk seluruh
    /// kartu yang tampil — bukan satu panggilan per kartu. Grid ini sudah
    /// membayar mahal untuk melengkapi harga; menambah N request lagi hanya
    /// untuk bintang akan membuatnya tidak bisa dipakai.
    @Default(<int, ReviewSummaryModel>{})
    Map<int, ReviewSummaryModel> reviews,

    /// Nama toko per id, untuk penawaran yang tidak membawa `seller_name`
    /// (semua hasil `GET /offers`; hanya `GET /search` yang memuatnya).
    @Default(<int, String>{}) Map<int, String> sellers,

    CategoryModel? activeCategory,
    @Default('') String keyword,

    @Default(false) bool isLoadingCategories,
    @Default(false) bool isLoadingOffers,

    /// Kegagalan terakhir. Dipisah dari data supaya daftar yang sudah termuat
    /// tidak hilang hanya karena satu permintaan berikutnya gagal.
    DataError? error,

    /// Jumlah penawaran yang tersedia di server, dari `meta.total_available`.
    /// Bisa lebih besar dari panjang [offers] karena harga hanya bisa
    /// dilengkapi sebagian per muat.
    @Default(0) int totalAvailable,

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

  /// Nama toko yang layak ditampilkan, dari respons penawaran kalau ada,
  /// kalau tidak dari direktori toko.
  String? sellerNameFor(OfferModel offer) =>
      offer.sellerName ?? sellers[offer.sellerId];

  /// Ringkasan rating sebuah penawaran, `null` kalau belum termuat.
  ReviewSummaryModel? reviewFor(OfferModel offer) => reviews[offer.id];

  /// Satuan jual bawaan SKU, untuk label "/ sak", "/ dus".
  String? offerUnit(OfferModel offer) {
    final sku = offer.skuId == null ? null : skus[offer.skuId];
    return sku?.defaultSellUnit?.unitName ?? sku?.baseUnit;
  }
}
