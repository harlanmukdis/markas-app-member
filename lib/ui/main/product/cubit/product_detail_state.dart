part of 'product_detail_cubit.dart';

@freezed
sealed class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();

  const factory ProductDetailState({
    @Default(true) bool isLoading,
    DataError? error,

    OfferModel? offer,
    SkuModel? sku,

    /// Penawaran **toko lain** untuk SKU yang sama.
    ///
    /// Inti nilai marketplace ini: barang komoditas identik, yang beda hanya
    /// harga dan ongkir. Kalau toko termurah kehabisan stok, pembeli tidak
    /// buntu.
    @Default(<OfferModel>[]) List<OfferModel> otherOffers,

    /// Nama toko per id, karena `GET /offers` tidak memuat `seller_name`.
    @Default(<int, String>{}) Map<int, String> sellers,

    /// Satuan jual yang dipilih user.
    SkuUnitModel? selectedUnit,

    /// Kuantitas dalam [selectedUnit].
    @Default(1.0) double qty,

    /// Input kalkulator kebutuhan, dalam satuan luas/volume.
    @Default(0.0) double calculatorInput,

    @Default(false) bool isAddingToCart,

    /// Terisi setelah berhasil masuk keranjang, untuk umpan balik sekali pakai.
    String? cartMessage,
  }) = _ProductDetailState;

  /// Cadangan standar untuk pemotongan/pecah saat pemasangan.
  ///
  /// 5% adalah angka waste yang lazim dipakai untuk keramik, dan dokumen
  /// panduan FE menyebutnya eksplisit. Ditaruh sebagai konstanta agar tidak
  /// tersebar sebagai angka sihir di UI.
  static const double wasteAllowance = 0.05;

  bool get isReady => !isLoading && offer != null;

  String get title {
    if (offer?.isFreeform == true) {
      return offer?.freeformName ?? 'Barang tanpa nama';
    }
    return sku?.name ?? 'Produk';
  }

  String? get sellerName =>
      offer?.sellerName ?? sellers[offer?.sellerId ?? -1];

  /// Satuan yang bisa dipakai kalkulator: satuan luas atau volume.
  ///
  /// Kalkulator hanya masuk akal kalau SKU punya satuan seperti `m2` — user
  /// mengukur luas lantai, bukan jumlah dus. Untuk semen per sak tidak ada
  /// yang bisa dihitung dari luas, jadi bagiannya disembunyikan.
  SkuUnitModel? get measureUnit {
    for (final u in sku?.units ?? const <SkuUnitModel>[]) {
      final n = u.unitName.toLowerCase().replaceAll('²', '2').replaceAll('³', '3');
      if (n == 'm2' || n == 'm3' || n == 'meter2' || n == 'meter3') return u;
    }
    return null;
  }

  bool get hasCalculator => measureUnit != null && selectedUnit != null;

  /// Satuan yang boleh dipilih user (hasil `units[]` dari `GET /sku-master`).
  List<SkuUnitModel> get units => sku?.units ?? const [];

  /// Tier harga yang boleh dilihat user ini — tier `PROJECT` tidak pernah
  /// dirender ke pembeli retail (aturan PRD-06).
  List<PriceTierModel> visibleTiers({required bool isB2B}) =>
      offer?.visibleTiers(isB2B: isB2B) ?? const [];

  /// Tier yang berlaku untuk [qty] saat ini, dalam **satuan dasar**.
  ///
  /// `min_qty` pada tier mengacu ke satuan dasar SKU, sedangkan [qty] ada
  /// dalam satuan yang dipilih user — jadi harus dikonversi dulu, kalau tidak
  /// memilih "dus" akan salah tier.
  PriceTierModel? activeTier({required bool isB2B}) => offer?.tierFor(
        qty: qtyInBaseUnit,
        segment: isB2B ? 'PROJECT' : 'RETAIL',
      ) ??
      offer?.tierFor(qty: qtyInBaseUnit, segment: 'RETAIL');

  double get qtyInBaseUnit =>
      selectedUnit == null ? qty : selectedUnit!.toBaseQty(qty);

  /// Apakah qty sudah memenuhi minimum order toko.
  ///
  /// `min_order_qty` juga dalam satuan dasar. Diperiksa di sini supaya user
  /// tahu sebelum checkout, bukan ditolak server dengan `BELOW_MIN_ORDER`.
  bool get meetsMinOrder =>
      offer == null || qtyInBaseUnit >= offer!.minOrderQty;

  /// Kekurangan menuju minimum order, dalam satuan dasar.
  double get minOrderShortfall {
    if (offer == null) return 0;
    final gap = offer!.minOrderQty - qtyInBaseUnit;
    return gap <= 0 ? 0 : gap;
  }

  /// Ringkasan konversi antar satuan, mis. "1 dus = 25 pcs = 4 m²".
  ///
  /// Ini elemen yang paling menentukan di kategori bahan bangunan: pembeli
  /// tidak tahu satu dus keramik itu berapa meter persegi, dan tanpa ini
  /// mereka salah beli.
  String? get unitConversionSummary {
    final unit = selectedUnit;
    final base = sku?.baseUnit;
    if (unit == null || base == null) return null;
    if (unit.conversionFactorToBase == 1) return null;

    final parts = <String>[
      '1 ${unit.unitName}',
      '${_num(unit.conversionFactorToBase)} $base',
    ];

    final measure = measureUnit;
    if (measure != null &&
        measure.unitName != unit.unitName &&
        measure.conversionFactorToBase > 0) {
      final inMeasure = unit.conversionFactorToBase /
          measure.conversionFactorToBase;
      parts.add('${_num(inMeasure)} ${measure.unitName}');
    }

    return parts.join(' = ');
  }

  /// Hasil kalkulator: jumlah [selectedUnit] yang perlu dibeli untuk
  /// [calculatorInput] satuan ukur, **termasuk cadangan 5%**, dibulatkan ke
  /// atas karena barang dijual per satuan utuh.
  int? get calculatorResult {
    final measure = measureUnit;
    final unit = selectedUnit;
    if (measure == null || unit == null || calculatorInput <= 0) return null;
    if (unit.conversionFactorToBase <= 0) return null;

    final baseNeeded =
        calculatorInput * measure.conversionFactorToBase * (1 + wasteAllowance);
    return (baseNeeded / unit.conversionFactorToBase).ceil();
  }

  static String _num(double v) =>
      v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(2);
}
