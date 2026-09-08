// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: const IntJson().fromJson(json['id']),
      paymentNo: const StringOrNullJson().fromJson(json['payment_no']),
      orderId: const IntOrNullJson().fromJson(json['order_id']),
      method: const StringOrNullJson().fromJson(json['method']),
      amount:
          json['amount'] == null ? 0 : const IntJson().fromJson(json['amount']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      vaNumber: const StringOrNullJson().fromJson(json['va_number']),
      qrisPayload: const StringOrNullJson().fromJson(json['qris_payload']),
      expiresAt: const ServerDateTimeJson().fromJson(json['expires_at']),
      verifiedAt: const ServerDateTimeJson().fromJson(json['verified_at']),
      createdDate: const ServerDateTimeJson()
          .fromJson(_readPaymentCreated(json, 'created_at')),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'payment_no': const StringOrNullJson().toJson(instance.paymentNo),
      'order_id': const IntOrNullJson().toJson(instance.orderId),
      'method': const StringOrNullJson().toJson(instance.method),
      'amount': const IntJson().toJson(instance.amount),
      'status': const StringJson().toJson(instance.status),
      'va_number': const StringOrNullJson().toJson(instance.vaNumber),
      'qris_payload': const StringOrNullJson().toJson(instance.qrisPayload),
      'expires_at': const ServerDateTimeJson().toJson(instance.expiresAt),
      'verified_at': const ServerDateTimeJson().toJson(instance.verifiedAt),
      'created_at': const ServerDateTimeJson().toJson(instance.createdDate),
    };
