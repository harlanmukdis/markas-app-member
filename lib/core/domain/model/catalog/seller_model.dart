import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'seller_model.freezed.dart';
part 'seller_model.g.dart';

/// Toko dari `GET /sellers/directory` — hanya yang berstatus `VERIFIED`.
@freezed
abstract class SellerModel with _$SellerModel {
  const SellerModel._();

  const factory SellerModel({
    @IntJson() required int id,
    @StringJson() required String name,
    @StringOrNullJson() String? slug,
    @BoolJson()
    @JsonKey(name: 'is_official_store')
    @Default(false)
    bool isOfficialStore,

    /// `TOKO` atau `DISTRIBUTOR` — **murni pembeda tampilan**. Mekanika
    /// onboarding, katalog, dan ordernya identik.
    @StringOrNullJson() @JsonKey(name: 'seller_type') String? sellerType,

    @DoubleOrNullJson() double? score,
  }) = _SellerModel;

  factory SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);

  bool get isDistributor => sellerType == 'DISTRIBUTOR';
}

/// Statistik untuk badge "biasanya membalas dalam X menit" (CHT-03).
@freezed
abstract class SellerResponseRateModel with _$SellerResponseRateModel {
  const SellerResponseRateModel._();

  const factory SellerResponseRateModel({
    @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
    @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
    @DoubleOrNullJson()
    @JsonKey(name: 'avg_response_seconds')
    double? avgResponseSeconds,
    @DoubleOrNullJson()
    @JsonKey(name: 'avg_response_minutes')
    double? avgResponseMinutes,
    @StringOrNullJson() String? note,
  }) = _SellerResponseRateModel;

  factory SellerResponseRateModel.fromJson(Map<String, dynamic> json) =>
      _$SellerResponseRateModelFromJson(json);

  /// Belum cukup data untuk ditampilkan — badge sebaiknya disembunyikan
  /// daripada menampilkan angka yang menyesatkan.
  bool get hasEnoughData => (sampleSize ?? 0) > 0 && avgResponseMinutes != null;
}
