import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/util/json_converters.dart';

part 'voucher_models.freezed.dart';
part 'voucher_models.g.dart';

/// Hasil `POST /vouchers/validate` — **pratinjau, tidak mengikat**.
///
/// Diskon final tetap dihitung server saat checkout. Nilai di sini hanya untuk
/// ditampilkan sebelum user menekan bayar.
///
/// `POST /vouchers/apply` **tidak boleh dipanggil dari aplikasi**: endpoint itu
/// tanpa autentikasi dan menerima `discount_amount` dari client tanpa
/// dihitung ulang.
@freezed
abstract class VoucherValidationModel with _$VoucherValidationModel {
  const factory VoucherValidationModel({
    @IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
    @StringOrNullJson() String? code,

    /// `PLATFORM` atau `SELLER`. Maksimal satu dari masing-masing per
    /// sub-order — kalau dilanggar server membalas `FUNDED_BY_COLLISION`.
    @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,

    @IntJson() @JsonKey(name: 'discount_amount') @Default(0)
    int discountAmount,
  }) = _VoucherValidationModel;

  factory VoucherValidationModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherValidationModelFromJson(json);
}
