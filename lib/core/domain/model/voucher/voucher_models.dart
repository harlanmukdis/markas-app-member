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

/// Voucher yang menempel pada keranjang.
///
/// Satu model untuk dua respons yang bentuknya beda sebagian:
/// * `POST /cart/voucher` mengembalikan [discountAmountPreview] tapi **tanpa**
///   `discount_type`/`min_spend`.
/// * `GET /cart/view` mengembalikan syarat vouchernya tapi **tanpa**
///   pratinjau potongan.
///
/// Karena itu hampir semua field nullable, dan UI harus menyiapkan keduanya:
/// setelah tempel ada angka potongan, setelah reload keranjang tinggal
/// syaratnya.
@freezed
abstract class CartVoucherModel with _$CartVoucherModel {
  const CartVoucherModel._();

  const factory CartVoucherModel({
    @IntJson() required int id,
    @IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
    @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
    @StringJson() @Default('') String code,
    @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
    @StringOrNullJson() @JsonKey(name: 'discount_type') String? discountType,
    @DoubleJson() @JsonKey(name: 'discount_value') @Default(0)
    double discountValue,
    @IntOrNullJson() @JsonKey(name: 'max_discount_amount')
    int? maxDiscountAmount,
    @IntOrNullJson() @JsonKey(name: 'min_spend') int? minSpend,

    /// Hanya dari `POST /cart/voucher`. **Pratinjau, bukan jaminan** — server
    /// menghitung ulang saat checkout.
    @IntOrNullJson() @JsonKey(name: 'discount_amount_preview')
    int? discountAmountPreview,
  }) = _CartVoucherModel;

  factory CartVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$CartVoucherModelFromJson(json);

  /// Voucher platform ditanggung Markas; voucher toko ditanggung penjual.
  /// Aturan PRM-03: maksimal satu dari masing-masing per sub-order.
  bool get isPlatform => fundedBy == 'PLATFORM';
}
