import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/domain/model/catalog/photo_model.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

/// Satu tingkat harga pada sebuah penawaran.
@freezed
abstract class PriceTierModel with _$PriceTierModel {
  const PriceTierModel._();

  const factory PriceTierModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,

    /// `RETAIL` atau `PROJECT`.
    @StringJson() required String segment,

    /// Kuantitas minimum agar tier ini berlaku. **Desimal** (`"1.0000"`).
    @DoubleJson() @JsonKey(name: 'min_qty') @Default(1) double minQty,

    /// Rupiah penuh. Dikirim `"65000.00"`, dibulatkan jadi int.
    @IntJson() required int price,

    @IntOrNullJson()
    @JsonKey(name: 'strikethrough_price')
    int? strikethroughPrice,

    @ServerDateTimeJson()
    @JsonKey(name: 'strikethrough_since')
    DateTime? strikethroughSince,
  }) = _PriceTierModel;

  factory PriceTierModel.fromJson(Map<String, dynamic> json) =>
      _$PriceTierModelFromJson(json);

  /// Harga grosir. **Hanya boleh dirender untuk `BUY_B`** — menampilkannya ke
  /// pembeli retail berarti membocorkan harga proyek (aturan PRD-06).
  bool get isProjectTier => segment == 'PROJECT';

  bool get hasDiscount =>
      strikethroughPrice != null && strikethroughPrice! > price;
}

/// Penawaran toko dari `GET /offers`, `GET /offers/{id}`, dan `GET /search`.
///
/// `/search` mengembalikan **superset** dari `/offers/{id}` — field offer yang
/// sama plus info toko dan ongkir. Karena itu satu model melayani keduanya,
/// dengan field khusus pencarian dibuat nullable. Tidak perlu model kembar
/// yang harus dijaga tetap sinkron.
@freezed
abstract class OfferModel with _$OfferModel {
  const OfferModel._();

  const factory OfferModel({
    @IntJson() required int id,
    @IntJson() @JsonKey(name: 'seller_id') required int sellerId,
    @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
    @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,

    /// Penawaran jalur `BEBAS` — barangnya tidak punya SKU master, jadi
    /// nama dan dimensinya ada di field `freeform_*` di bawah.
    @BoolJson() @JsonKey(name: 'is_freeform') @Default(false) bool isFreeform,
    @BoolJson()
    @JsonKey(name: 'is_temporary_listing')
    @Default(false)
    bool isTemporaryListing,
    @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
    @DoubleOrNullJson()
    @JsonKey(name: 'freeform_weight_kg')
    double? freeformWeightKg,
    @DoubleOrNullJson()
    @JsonKey(name: 'freeform_length_cm')
    double? freeformLengthCm,
    @DoubleOrNullJson()
    @JsonKey(name: 'freeform_width_cm')
    double? freeformWidthCm,
    @DoubleOrNullJson()
    @JsonKey(name: 'freeform_height_cm')
    double? freeformHeightCm,

    @StringJson() @JsonKey(name: 'handling_class') @Default('NORMAL')
    String handlingClass,

    /// Foto produk. Lihat [PhotosJsonConverter] — backend mengirim ini sebagai
    /// **String berisi JSON**, bukan array.
    @PhotosJsonConverter() @JsonKey(name: 'photos_json')
    @Default(<PhotoModel>[])
    List<PhotoModel> photos,

    /// Minimum order toko. **Desimal** — `5.0000` bisa berarti 5,5 m³.
    @DoubleJson() @JsonKey(name: 'min_order_qty') @Default(0)
    double minOrderQty,

    @StringJson() @Default('ACTIVE') String status,
    @StringOrNullJson() @JsonKey(name: 'reject_reason') String? rejectReason,
    @StringOrNullJson() String? description,

    @ServerDateTimeJson() @JsonKey(name: 'created_date')
    DateTime? createdDate,
    @ServerDateTimeJson() @JsonKey(name: 'modified_date')
    DateTime? modifiedDate,

    @JsonKey(name: 'price_tiers')
    @Default(<PriceTierModel>[])
    List<PriceTierModel> priceTiers,

    // --- Hanya terisi dari GET /search ---
    @StringOrNullJson() @JsonKey(name: 'seller_name') String? sellerName,
    @DoubleOrNullJson() @JsonKey(name: 'seller_score') double? sellerScore,

    /// `PKP` atau `NON_PKP`. Hanya toko PKP yang bisa menerbitkan faktur pajak.
    @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,

    /// Ongkir termurah sebagai **estimasi**, bukan harga final.
    @IntOrNullJson() @JsonKey(name: 'ongkir_mulai_dari') int? ongkirMulaiDari,

    @BoolJson()
    @JsonKey(name: 'ongkir_is_estimate')
    @Default(true)
    bool ongkirIsEstimate,

    @DoubleOrNullJson() @JsonKey(name: 'available_stock') double? availableStock,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  bool get isActive => status == 'ACTIVE';

  /// Nama yang layak ditampilkan. Untuk penawaran `BEBAS`, nama ada di
  /// `freeform_name` karena tidak ada SKU master yang bisa dirujuk.
  String? get displayName => isFreeform ? freeformName : null;

  String? get primaryPhotoUrl => photos.isEmpty ? null : photos.first.url;

  bool get isFragile => handlingClass == 'PECAH_BELAH';

  bool get isPkp => pkpStatus == 'PKP';

  /// Tier yang berlaku untuk [qty] pada [segment] — tier dengan `minQty`
  /// tertinggi yang masih ≤ qty.
  ///
  /// **Ini hanya untuk pratinjau di UI, bukan penentu harga.** Server
  /// menghitung ulang harga saat checkout (aturan CRT-02: harga tidak dikunci
  /// di keranjang), jadi angka dari sini tidak boleh diperlakukan sebagai
  /// jaminan.
  PriceTierModel? tierFor({required double qty, required String segment}) {
    PriceTierModel? best;
    for (final t in priceTiers) {
      if (t.segment != segment || t.minQty > qty) continue;
      if (best == null || t.minQty > best.minQty) best = t;
    }
    return best;
  }

  /// Tier yang boleh dilihat user ini.
  ///
  /// [isB2B] wajib diteruskan dari `TokenStore.isB2B`/`UserModel.isB2B`.
  /// Pembeli retail **tidak boleh** melihat tier `PROJECT`.
  List<PriceTierModel> visibleTiers({required bool isB2B}) =>
      isB2B ? priceTiers : priceTiers.where((t) => !t.isProjectTier).toList();

  /// Harga terendah yang boleh ditampilkan sebagai "mulai dari".
  int? lowestVisiblePrice({required bool isB2B}) {
    final tiers = visibleTiers(isB2B: isB2B);
    if (tiers.isEmpty) return null;
    return tiers.map((t) => t.price).reduce((a, b) => a < b ? a : b);
  }
}
