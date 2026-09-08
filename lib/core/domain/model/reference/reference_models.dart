import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'reference_models.freezed.dart';
part 'reference_models.g.dart';

/// Zona pengiriman dari `GET /zones`, hierarkis:
/// `PROVINCE` → `CITY` → `ZONE`.
///
/// `id`-nya dipakai sebagai `zone_id` pada alamat dan sebagai filter
/// pencarian — penawaran dari toko yang tidak melayani zona itu disembunyikan
/// (aturan CRT-11).
@freezed
abstract class ZoneModel with _$ZoneModel {
  const ZoneModel._();

  const factory ZoneModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,

    /// `PROVINCE`, `CITY`, atau `ZONE`.
    @StringJson() required String level,

    @StringJson() required String name,
    @StringOrNullJson() String? code,
    @ServerDateTimeJson() @JsonKey(name: 'created_date')
    DateTime? createdDate,
  }) = _ZoneModel;

  factory ZoneModel.fromJson(Map<String, dynamic> json) =>
      _$ZoneModelFromJson(json);

  bool get isProvince => level == 'PROVINCE';
  bool get isCity => level == 'CITY';
  bool get isZone => level == 'ZONE';
}

/// Jenis armada dari `GET /fleet-types`.
///
/// Perhatikan: **tidak ada `id`** — kuncinya `code`.
@freezed
abstract class FleetTypeModel with _$FleetTypeModel {
  const factory FleetTypeModel({
    @StringJson() required String code,
    @StringJson() required String name,

    /// Deskripsi kapasitas siap tampil, mis. `"± 5 ton"`.
    @StringOrNullJson()
    @JsonKey(name: 'capacity_kg_desc')
    String? capacityKgDesc,

    /// Kapasitas muatan, dipakai backend untuk memblokir pengiriman yang
    /// melebihi kapasitas (`FLEET_PAYLOAD_EXCEEDED`).
    ///
    /// **Jangan di-hardcode di aplikasi** — nilainya masih DRAFT dan bisa
    /// diubah owner. Ambil dari endpoint ini.
    @DoubleOrNullJson() @JsonKey(name: 'max_payload_kg') double? maxPayloadKg,

    /// Peringkat ukuran armada (1 = motor, 6 = tronton). Dipakai backend
    /// membandingkan dengan `access_type` alamat.
    @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank,
  }) = _FleetTypeModel;

  factory FleetTypeModel.fromJson(Map<String, dynamic> json) =>
      _$FleetTypeModelFromJson(json);
}

/// Parameter konfigurasi dari `GET /config/parameters?group=`.
///
/// Dipakai agar nilai seperti ambang order besar atau lama masa tahan **tidak
/// di-hardcode di app** — kalau admin mengubahnya, app ikut berubah tanpa
/// rilis baru.
@freezed
abstract class ConfigParameterModel with _$ConfigParameterModel {
  const ConfigParameterModel._();

  const factory ConfigParameterModel({
    @IntJson() required int id,
    @StringJson() @JsonKey(name: 'param_group') required String paramGroup,
    @StringJson() @JsonKey(name: 'param_key') required String paramKey,
    @StringJson() @JsonKey(name: 'param_value') required String paramValue,

    /// `DECIMAL`, `INT`, `STRING`, `BOOL`, … — menentukan cara membaca
    /// [paramValue].
    @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,

    @ServerDateTimeJson()
    @JsonKey(name: 'effective_from')
    DateTime? effectiveFrom,
    @ServerDateTimeJson() @JsonKey(name: 'effective_to') DateTime? effectiveTo,
    @StringOrNullJson() String? description,
  }) = _ConfigParameterModel;

  factory ConfigParameterModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigParameterModelFromJson(json);

  /// [paramValue] sebagai rupiah penuh. `"25000000"` → `25000000`.
  int get asInt => asIntOrNull(paramValue) ?? 0;

  double get asDouble => asDoubleOrNull(paramValue) ?? 0;

  bool get asBool => asBoolOrNull(paramValue) ?? false;
}

/// Grup parameter yang tersedia di `GET /config/parameters`.
abstract final class ConfigGroup {
  /// Ambang nilai order (mis. batas konfirmasi stok, konfirmasi dua orang).
  static const ambang = 'AMBANG';

  static const pencairan = 'PENCAIRAN';
  static const tokoBaru = 'TOKO_BARU';
  static const kontrak = 'KONTRAK';
  static const pajak = 'PAJAK';
  static const jasa = 'JASA';
}
