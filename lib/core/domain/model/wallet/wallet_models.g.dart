// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletBalanceModel _$WalletBalanceModelFromJson(Map<String, dynamic> json) =>
    _WalletBalanceModel(
      balance: json['balance'] == null
          ? 0
          : const IntJson().fromJson(json['balance']),
    );

Map<String, dynamic> _$WalletBalanceModelToJson(_WalletBalanceModel instance) =>
    <String, dynamic>{
      'balance': const IntJson().toJson(instance.balance),
    };

_WalletTopupModel _$WalletTopupModelFromJson(Map<String, dynamic> json) =>
    _WalletTopupModel(
      id: const IntJson().fromJson(json['id']),
      topupNo: const StringOrNullJson().fromJson(json['topup_no']),
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
          .fromJson(_readTopupCreated(json, 'created_at')),
    );

Map<String, dynamic> _$WalletTopupModelToJson(_WalletTopupModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'topup_no': const StringOrNullJson().toJson(instance.topupNo),
      'method': const StringOrNullJson().toJson(instance.method),
      'amount': const IntJson().toJson(instance.amount),
      'status': const StringJson().toJson(instance.status),
      'va_number': const StringOrNullJson().toJson(instance.vaNumber),
      'qris_payload': const StringOrNullJson().toJson(instance.qrisPayload),
      'expires_at': const ServerDateTimeJson().toJson(instance.expiresAt),
      'verified_at': const ServerDateTimeJson().toJson(instance.verifiedAt),
      'created_at': const ServerDateTimeJson().toJson(instance.createdDate),
    };

_WalletEntryModel _$WalletEntryModelFromJson(Map<String, dynamic> json) =>
    _WalletEntryModel(
      id: const IntJson().fromJson(json['id']),
      entryType: json['entry_type'] == null
          ? ''
          : const StringJson().fromJson(json['entry_type']),
      amount: json['amount'] == null
          ? 0
          : const DoubleJson().fromJson(json['amount']),
      refType: const StringOrNullJson().fromJson(json['ref_type']),
      refId: const IntOrNullJson().fromJson(json['ref_id']),
      note: const StringOrNullJson().fromJson(json['note']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$WalletEntryModelToJson(_WalletEntryModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'entry_type': const StringJson().toJson(instance.entryType),
      'amount': const DoubleJson().toJson(instance.amount),
      'ref_type': const StringOrNullJson().toJson(instance.refType),
      'ref_id': const IntOrNullJson().toJson(instance.refId),
      'note': const StringOrNullJson().toJson(instance.note),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };
