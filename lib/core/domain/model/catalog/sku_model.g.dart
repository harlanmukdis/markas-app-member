// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SkuUnitModel _$SkuUnitModelFromJson(Map<String, dynamic> json) =>
    _SkuUnitModel(
      id: const IntJson().fromJson(json['id']),
      skuId: const IntOrNullJson().fromJson(json['sku_id']),
      unitName: const StringJson().fromJson(json['unit_name']),
      conversionFactorToBase: json['conversion_factor_to_base'] == null
          ? 1
          : const DoubleJson().fromJson(json['conversion_factor_to_base']),
      isDefaultSellUnit: json['is_default_sell_unit'] == null
          ? false
          : const BoolJson().fromJson(json['is_default_sell_unit']),
    );

Map<String, dynamic> _$SkuUnitModelToJson(_SkuUnitModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'sku_id': const IntOrNullJson().toJson(instance.skuId),
      'unit_name': const StringJson().toJson(instance.unitName),
      'conversion_factor_to_base':
          const DoubleJson().toJson(instance.conversionFactorToBase),
      'is_default_sell_unit':
          const BoolJson().toJson(instance.isDefaultSellUnit),
    };

_SkuModel _$SkuModelFromJson(Map<String, dynamic> json) => _SkuModel(
      id: const IntJson().fromJson(json['id']),
      categoryId: const IntOrNullJson().fromJson(json['category_id']),
      name: const StringJson().fromJson(json['name']),
      brandId: const IntOrNullJson().fromJson(json['brand_id']),
      baseUnit: const StringOrNullJson().fromJson(json['base_unit']),
      weightKg: const DoubleOrNullJson().fromJson(json['weight_kg']),
      lengthCm: const DoubleOrNullJson().fromJson(json['length_cm']),
      widthCm: const DoubleOrNullJson().fromJson(json['width_cm']),
      heightCm: const DoubleOrNullJson().fromJson(json['height_cm']),
      volumetricDivisor:
          const DoubleOrNullJson().fromJson(json['volumetric_divisor']),
      handlingClass: json['handling_class'] == null
          ? 'NORMAL'
          : const StringJson().fromJson(json['handling_class']),
      isQuoteFirst: json['is_quote_first'] == null
          ? false
          : const BoolJson().fromJson(json['is_quote_first']),
      status: json['status'] == null
          ? 'ACTIVE'
          : const StringJson().fromJson(json['status']),
      mergedIntoSkuId:
          const IntOrNullJson().fromJson(json['merged_into_sku_id']),
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => SkuUnitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SkuUnitModel>[],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const <Map<String, dynamic>>[],
    );

Map<String, dynamic> _$SkuModelToJson(_SkuModel instance) => <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'category_id': const IntOrNullJson().toJson(instance.categoryId),
      'name': const StringJson().toJson(instance.name),
      'brand_id': const IntOrNullJson().toJson(instance.brandId),
      'base_unit': const StringOrNullJson().toJson(instance.baseUnit),
      'weight_kg': const DoubleOrNullJson().toJson(instance.weightKg),
      'length_cm': const DoubleOrNullJson().toJson(instance.lengthCm),
      'width_cm': const DoubleOrNullJson().toJson(instance.widthCm),
      'height_cm': const DoubleOrNullJson().toJson(instance.heightCm),
      'volumetric_divisor':
          const DoubleOrNullJson().toJson(instance.volumetricDivisor),
      'handling_class': const StringJson().toJson(instance.handlingClass),
      'is_quote_first': const BoolJson().toJson(instance.isQuoteFirst),
      'status': const StringJson().toJson(instance.status),
      'merged_into_sku_id':
          const IntOrNullJson().toJson(instance.mergedIntoSkuId),
      'units': instance.units,
      'attributes': instance.attributes,
    };

_SkuBriefModel _$SkuBriefModelFromJson(Map<String, dynamic> json) =>
    _SkuBriefModel(
      id: const IntJson().fromJson(json['id']),
      name: const StringJson().fromJson(json['name']),
      baseUnit: const StringOrNullJson().fromJson(json['base_unit']),
      weightKg: const DoubleOrNullJson().fromJson(json['weight_kg']),
    );

Map<String, dynamic> _$SkuBriefModelToJson(_SkuBriefModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'name': const StringJson().toJson(instance.name),
      'base_unit': const StringOrNullJson().toJson(instance.baseUnit),
      'weight_kg': const DoubleOrNullJson().toJson(instance.weightKg),
    };
