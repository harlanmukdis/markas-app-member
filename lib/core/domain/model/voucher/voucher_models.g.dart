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
