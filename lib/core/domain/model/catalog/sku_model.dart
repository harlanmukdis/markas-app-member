import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'sku_model.freezed.dart';
part 'sku_model.g.dart';

/// Satuan jual untuk satu SKU.
///
/// Inilah bahan **pemilih satuan** dan **kalkulator kebutuhan** ("1 dus =
/// 25 pcs = 1,5 m²") yang jadi pembeda utama kategori bahan bangunan.
@freezed
abstract class SkuUnitModel with _$SkuUnitModel {
  const SkuUnitModel._();

  const factory SkuUnitModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
    @StringJson() @JsonKey(name: 'unit_name') required String unitName,

    /// Berapa satuan dasar per satu satuan ini. **Desimal**, dikirim sebagai
    /// string `"1.0000"` — bukan bilangan bulat.
    @DoubleJson()
    @JsonKey(name: 'conversion_factor_to_base')
    @Default(1)
    double conversionFactorToBase,

    @BoolJson()
    @JsonKey(name: 'is_default_sell_unit')
    @Default(false)
    bool isDefaultSellUnit,
  }) = _SkuUnitModel;

  factory SkuUnitModel.fromJson(Map<String, dynamic> json) =>
      _$SkuUnitModelFromJson(json);

  /// Mengubah qty dalam satuan ini ke satuan dasar SKU.
  double toBaseQty(double qty) => qty * conversionFactorToBase;
}

/// SKU master dari `GET /sku-master` dan `GET /sku-master/{id}`.
@freezed
abstract class SkuModel with _$SkuModel {
  const SkuModel._();

  const factory SkuModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
    @StringJson() required String name,
    @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
    @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,

    // Dimensi & berat semuanya DECIMAL di database, jadi double.
    @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
    @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
    @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
    @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
    @DoubleOrNullJson()
    @JsonKey(name: 'volumetric_divisor')
    double? volumetricDivisor,

    /// `NORMAL`, `PECAH_BELAH`, `BERBAHAYA`, atau `OVERSIZE`.
    /// Menentukan panjang jendela retur (2×24 jam vs 7 hari).
    @StringJson() @JsonKey(name: 'handling_class') @Default('NORMAL')
    String handlingClass,

    @BoolJson() @JsonKey(name: 'is_quote_first') @Default(false)
    bool isQuoteFirst,

    @StringJson() @Default('ACTIVE') String status,

    @IntOrNullJson() @JsonKey(name: 'merged_into_sku_id') int? mergedIntoSkuId,

    @Default(<SkuUnitModel>[]) List<SkuUnitModel> units,

    /// Longgar dengan sengaja — lihat catatan pada `CategoryModel.attributes`.
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> attributes,
  }) = _SkuModel;

  factory SkuModel.fromJson(Map<String, dynamic> json) =>
      _$SkuModelFromJson(json);

  /// Satuan yang harus dipilih lebih dulu di UI.
  SkuUnitModel? get defaultSellUnit {
    for (final u in units) {
      if (u.isDefaultSellUnit) return u;
    }
    return units.isEmpty ? null : units.first;
  }

  /// Barang pecah-belah — jendela returnya hanya 2×24 jam, jadi UI perlu
  /// menegaskan kewajiban foto bongkar saat serah terima.
  bool get isFragile => handlingClass == 'PECAH_BELAH';

  /// Harga harus diminta lewat RFQ dulu, tidak bisa langsung dibeli.
  bool get requiresQuote => isQuoteFirst;

  bool get isActive => status == 'ACTIVE';
}

/// Info SKU ringkas dari `GET /sku-master?ids=1,2,3` (backend v2.4).
///
/// Sengaja **model terpisah**, bukan [SkuModel] yang sebagian terisi: respons
/// bulk hanya membawa `{id, name, base_unit, weight_kg}` dan **tidak** membawa
/// `units[]`. Mengembalikannya sebagai [SkuModel] berarti `units` kosong,
/// yang tidak bisa dibedakan dari "SKU ini memang tanpa satuan majemuk" —
/// dan pemilih satuan akan hilang tanpa jejak.
///
/// Untuk `units[]` tetap pakai [SkuModel] lewat `GET /sku-master/{id}`.
@freezed
abstract class SkuBriefModel with _$SkuBriefModel {
  const factory SkuBriefModel({
    @IntJson() required int id,
    @StringJson() required String name,
    @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
    @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
  }) = _SkuBriefModel;

  factory SkuBriefModel.fromJson(Map<String, dynamic> json) =>
      _$SkuBriefModelFromJson(json);
}
