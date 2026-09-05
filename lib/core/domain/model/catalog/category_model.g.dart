// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: const IntJson().fromJson(json['id']),
      parentId: const IntOrNullJson().fromJson(json['parent_id']),
      name: const StringJson().fromJson(json['name']),
      slug: const StringOrNullJson().fromJson(json['slug']),
      level: const IntOrNullJson().fromJson(json['level']),
      jalur: const StringJson().fromJson(json['jalur']),
      isRisky: json['is_risky'] == null
          ? false
          : const BoolJson().fromJson(json['is_risky']),
      createdAt: const ServerDateTimeJson().fromJson(json['created_at']),
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const <Map<String, dynamic>>[],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CategoryModel>[],
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'parent_id': const IntOrNullJson().toJson(instance.parentId),
      'name': const StringJson().toJson(instance.name),
      'slug': const StringOrNullJson().toJson(instance.slug),
      'level': const IntOrNullJson().toJson(instance.level),
      'jalur': const StringJson().toJson(instance.jalur),
      'is_risky': const BoolJson().toJson(instance.isRisky),
      'created_at': const ServerDateTimeJson().toJson(instance.createdAt),
      'attributes': instance.attributes,
      'children': instance.children,
    };
