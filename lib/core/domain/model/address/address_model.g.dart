// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: const IntJson().fromJson(json['id']),
      ownerType: const StringOrNullJson().fromJson(json['owner_type']),
      label: const StringOrNullJson().fromJson(json['label']),
      recipientName: const StringJson().fromJson(json['recipient_name']),
      phone: const StringJson().fromJson(json['phone']),
      province: const StringJson().fromJson(json['province']),
      city: const StringJson().fromJson(json['city']),
      district: const StringOrNullJson().fromJson(json['district']),
      fullAddress: const StringJson().fromJson(json['full_address']),
      lat: const DoubleOrNullJson().fromJson(json['lat']),
      lng: const DoubleOrNullJson().fromJson(json['lng']),
      zoneId: const IntOrNullJson().fromJson(json['zone_id']),
      isDefault: json['is_default'] == null
          ? false
          : const BoolJson().fromJson(json['is_default']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'owner_type': const StringOrNullJson().toJson(instance.ownerType),
      'label': const StringOrNullJson().toJson(instance.label),
      'recipient_name': const StringJson().toJson(instance.recipientName),
      'phone': const StringJson().toJson(instance.phone),
      'province': const StringJson().toJson(instance.province),
      'city': const StringJson().toJson(instance.city),
      'district': const StringOrNullJson().toJson(instance.district),
      'full_address': const StringJson().toJson(instance.fullAddress),
      'lat': const DoubleOrNullJson().toJson(instance.lat),
      'lng': const DoubleOrNullJson().toJson(instance.lng),
      'zone_id': const IntOrNullJson().toJson(instance.zoneId),
      'is_default': const BoolJson().toJson(instance.isDefault),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };
