// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZoneModel _$ZoneModelFromJson(Map<String, dynamic> json) => _ZoneModel(
      id: const IntJson().fromJson(json['id']),
      parentId: const IntOrNullJson().fromJson(json['parent_id']),
      level: const StringJson().fromJson(json['level']),
      name: const StringJson().fromJson(json['name']),
      code: const StringOrNullJson().fromJson(json['code']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$ZoneModelToJson(_ZoneModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'parent_id': const IntOrNullJson().toJson(instance.parentId),
      'level': const StringJson().toJson(instance.level),
      'name': const StringJson().toJson(instance.name),
      'code': const StringOrNullJson().toJson(instance.code),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };

_FleetTypeModel _$FleetTypeModelFromJson(Map<String, dynamic> json) =>
    _FleetTypeModel(
      code: const StringJson().fromJson(json['code']),
      name: const StringJson().fromJson(json['name']),
      capacityKgDesc:
          const StringOrNullJson().fromJson(json['capacity_kg_desc']),
    );

Map<String, dynamic> _$FleetTypeModelToJson(_FleetTypeModel instance) =>
    <String, dynamic>{
      'code': const StringJson().toJson(instance.code),
      'name': const StringJson().toJson(instance.name),
      'capacity_kg_desc':
          const StringOrNullJson().toJson(instance.capacityKgDesc),
    };

_ConfigParameterModel _$ConfigParameterModelFromJson(
        Map<String, dynamic> json) =>
    _ConfigParameterModel(
      id: const IntJson().fromJson(json['id']),
      paramGroup: const StringJson().fromJson(json['param_group']),
      paramKey: const StringJson().fromJson(json['param_key']),
      paramValue: const StringJson().fromJson(json['param_value']),
      valueType: const StringOrNullJson().fromJson(json['value_type']),
      effectiveFrom:
          const ServerDateTimeJson().fromJson(json['effective_from']),
      effectiveTo: const ServerDateTimeJson().fromJson(json['effective_to']),
      description: const StringOrNullJson().fromJson(json['description']),
    );

Map<String, dynamic> _$ConfigParameterModelToJson(
        _ConfigParameterModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'param_group': const StringJson().toJson(instance.paramGroup),
      'param_key': const StringJson().toJson(instance.paramKey),
      'param_value': const StringJson().toJson(instance.paramValue),
      'value_type': const StringOrNullJson().toJson(instance.valueType),
      'effective_from':
          const ServerDateTimeJson().toJson(instance.effectiveFrom),
      'effective_to': const ServerDateTimeJson().toJson(instance.effectiveTo),
      'description': const StringOrNullJson().toJson(instance.description),
    };
