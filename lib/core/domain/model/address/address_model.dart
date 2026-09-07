import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

/// Alamat pengiriman member.
///
/// `owner_type` **diturunkan dari token** — client tidak bisa mengaku sebagai
/// pemilik lain, dan tidak perlu mengirimnya. Nilainya `MEMBER` di v2.2
/// (dokumen API menyebut `USER`; yang benar adalah apa yang dikirim server).
@freezed
abstract class AddressModel with _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
    @IntJson() required int id,
    @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
    @StringOrNullJson() String? label,
    @StringJson() @JsonKey(name: 'recipient_name') required String recipientName,
    @StringJson() required String phone,
    @StringJson() required String province,
    @StringJson() required String city,
    @StringOrNullJson() String? district,
    @StringJson() @JsonKey(name: 'full_address') required String fullAddress,

    /// Koordinat **wajib** saat membuat alamat: server memakainya untuk
    /// menentukan zona ongkir (aturan USR-09). Dikirim balik sebagai string
    /// desimal (`"-6.2383000"`).
    @DoubleOrNullJson() double? lat,
    @DoubleOrNullJson() double? lng,

    @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
    @BoolJson() @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @ServerDateTimeJson() @JsonKey(name: 'created_date') DateTime? createdDate,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  /// Alamat tanpa koordinat tidak bisa dipakai checkout — server tidak bisa
  /// menghitung zona ongkirnya.
  bool get hasCoordinates => lat != null && lng != null;

  String get displayLabel {
    final l = label?.trim();
    return (l == null || l.isEmpty) ? recipientName : l;
  }

  /// Satu baris ringkas untuk kartu pilihan alamat.
  String get shortAddress => [
        fullAddress,
        if (district != null && district!.isNotEmpty) district,
        city,
        province,
      ].join(', ');
}
