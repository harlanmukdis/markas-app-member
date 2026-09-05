// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: const IntJson().fromJson(json['id']),
      phone: const StringJson().fromJson(json['phone']),
      email: const StringOrNullJson().fromJson(json['email']),
      fullName: const StringOrNullJson().fromJson(json['full_name']),
      role: const StringJson().fromJson(json['role']),
      buyerSegment: const StringOrNullJson().fromJson(json['buyer_segment']),
      npwp: const StringOrNullJson().fromJson(json['npwp']),
      nibSiupNo: const StringOrNullJson().fromJson(json['nib_siup_no']),
      b2bVerifiedAt:
          const ServerDateTimeJson().fromJson(json['b2b_verified_at']),
      sellerId: const IntOrNullJson().fromJson(json['seller_id']),
      status: const StringJson().fromJson(json['status']),
      createdAt: const ServerDateTimeJson().fromJson(json['created_at']),
      updatedAt: const ServerDateTimeJson().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'phone': const StringJson().toJson(instance.phone),
      'email': const StringOrNullJson().toJson(instance.email),
      'full_name': const StringOrNullJson().toJson(instance.fullName),
      'role': const StringJson().toJson(instance.role),
      'buyer_segment': const StringOrNullJson().toJson(instance.buyerSegment),
      'npwp': const StringOrNullJson().toJson(instance.npwp),
      'nib_siup_no': const StringOrNullJson().toJson(instance.nibSiupNo),
      'b2b_verified_at':
          const ServerDateTimeJson().toJson(instance.b2bVerifiedAt),
      'seller_id': const IntOrNullJson().toJson(instance.sellerId),
      'status': const StringJson().toJson(instance.status),
      'created_at': const ServerDateTimeJson().toJson(instance.createdAt),
      'updated_at': const ServerDateTimeJson().toJson(instance.updatedAt),
    };
