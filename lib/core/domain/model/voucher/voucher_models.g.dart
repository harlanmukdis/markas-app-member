// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherValidationModel _$VoucherValidationModelFromJson(
        Map<String, dynamic> json) =>
    _VoucherValidationModel(
      voucherId: const IntOrNullJson().fromJson(json['voucher_id']),
      code: const StringOrNullJson().fromJson(json['code']),
      fundedBy: const StringOrNullJson().fromJson(json['funded_by']),
      discountAmount: json['discount_amount'] == null
          ? 0
          : const IntJson().fromJson(json['discount_amount']),
    );

Map<String, dynamic> _$VoucherValidationModelToJson(
        _VoucherValidationModel instance) =>
    <String, dynamic>{
      'voucher_id': const IntOrNullJson().toJson(instance.voucherId),
      'code': const StringOrNullJson().toJson(instance.code),
      'funded_by': const StringOrNullJson().toJson(instance.fundedBy),
      'discount_amount': const IntJson().toJson(instance.discountAmount),
    };

_CartVoucherModel _$CartVoucherModelFromJson(Map<String, dynamic> json) =>
    _CartVoucherModel(
      id: const IntJson().fromJson(json['id']),
      voucherId: const IntOrNullJson().fromJson(json['voucher_id']),
      sellerId: const IntOrNullJson().fromJson(json['seller_id']),
      code:
          json['code'] == null ? '' : const StringJson().fromJson(json['code']),
      fundedBy: const StringOrNullJson().fromJson(json['funded_by']),
      discountType: const StringOrNullJson().fromJson(json['discount_type']),
      discountValue: json['discount_value'] == null
          ? 0
          : const DoubleJson().fromJson(json['discount_value']),
      maxDiscountAmount:
          const IntOrNullJson().fromJson(json['max_discount_amount']),
      minSpend: const IntOrNullJson().fromJson(json['min_spend']),
      discountAmountPreview:
          const IntOrNullJson().fromJson(json['discount_amount_preview']),
    );

Map<String, dynamic> _$CartVoucherModelToJson(_CartVoucherModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'voucher_id': const IntOrNullJson().toJson(instance.voucherId),
      'seller_id': const IntOrNullJson().toJson(instance.sellerId),
      'code': const StringJson().toJson(instance.code),
      'funded_by': const StringOrNullJson().toJson(instance.fundedBy),
      'discount_type': const StringOrNullJson().toJson(instance.discountType),
      'discount_value': const DoubleJson().toJson(instance.discountValue),
      'max_discount_amount':
          const IntOrNullJson().toJson(instance.maxDiscountAmount),
      'min_spend': const IntOrNullJson().toJson(instance.minSpend),
      'discount_amount_preview':
          const IntOrNullJson().toJson(instance.discountAmountPreview),
    };
