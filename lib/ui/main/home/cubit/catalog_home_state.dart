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

    /// Nama & satuan dasar SKU per id, untuk menamai penawaran jalur
    /// `MASTER` — `OfferModel` sendiri hanya membawa `sku_id`.
    ///
    /// [SkuBriefModel], bukan `SkuModel`: diambil lewat satu panggilan
    /// `GET /sku-master?ids=` yang tidak membawa `units[]`. Grid tidak
    /// butuh pemilih satuan; halaman detail yang butuh, dan itu memakai
    /// `GET /sku-master/{id}` terpisah.
    @Default(<int, SkuBriefModel>{}) Map<int, SkuBriefModel> skus,

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

    /// `meta` dari respons terakhir: `{page, per_page, total, total_pages}`.
    @Default(<String, dynamic>{}) Map<String, dynamic> meta,

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

  /// Satuan dasar SKU, untuk label "/ sak", "/ dus".
  String? offerUnit(OfferModel offer) =>
      offer.skuId == null ? null : skus[offer.skuId]?.baseUnit;

  /// Halaman keberapa yang sedang ditampilkan, dari `meta.page`.
  int get page => asIntOrNull(meta['page']) ?? 1;

  /// Total halaman menurut server, dari `meta.total_pages`.
  ///
  /// **Wajib dibaca**: `GET /offers` dipaginasi sejak v2.4 dengan default 20
  /// per halaman, dan menganggap satu respons sudah lengkap membuat katalog
  /// tampak jauh lebih sedikit tanpa error apa pun.
  int get totalPages => asIntOrNull(meta['total_pages']) ?? 1;

  /// Total penawaran menurut server, dari `meta.total`.
  int get totalOffers => asIntOrNull(meta['total']) ?? offers.length;

  bool get hasMorePages => page < totalPages;
}
