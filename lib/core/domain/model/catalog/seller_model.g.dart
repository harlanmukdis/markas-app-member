// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerModel _$SellerModelFromJson(Map<String, dynamic> json) => _SellerModel(
      id: const IntJson().fromJson(json['id']),
      name: const StringJson().fromJson(json['name']),
      slug: const StringOrNullJson().fromJson(json['slug']),
      isOfficialStore: json['is_official_store'] == null
          ? false
          : const BoolJson().fromJson(json['is_official_store']),
      sellerType: const StringOrNullJson().fromJson(json['seller_type']),
      score: const DoubleOrNullJson().fromJson(json['score']),
    );

Map<String, dynamic> _$SellerModelToJson(_SellerModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'name': const StringJson().toJson(instance.name),
      'slug': const StringOrNullJson().toJson(instance.slug),
      'is_official_store': const BoolJson().toJson(instance.isOfficialStore),
      'seller_type': const StringOrNullJson().toJson(instance.sellerType),
      'score': const DoubleOrNullJson().toJson(instance.score),
    };

_SellerResponseRateModel _$SellerResponseRateModelFromJson(
        Map<String, dynamic> json) =>
    _SellerResponseRateModel(
      sellerId: const IntOrNullJson().fromJson(json['seller_id']),
      sampleSize: const IntOrNullJson().fromJson(json['sample_size']),
      avgResponseSeconds:
          const DoubleOrNullJson().fromJson(json['avg_response_seconds']),
      avgResponseMinutes:
          const DoubleOrNullJson().fromJson(json['avg_response_minutes']),
      note: const StringOrNullJson().fromJson(json['note']),
    );

Map<String, dynamic> _$SellerResponseRateModelToJson(
        _SellerResponseRateModel instance) =>
    <String, dynamic>{
      'seller_id': const IntOrNullJson().toJson(instance.sellerId),
      'sample_size': const IntOrNullJson().toJson(instance.sampleSize),
      'avg_response_seconds':
          const DoubleOrNullJson().toJson(instance.avgResponseSeconds),
      'avg_response_minutes':
          const DoubleOrNullJson().toJson(instance.avgResponseMinutes),
      'note': const StringOrNullJson().toJson(instance.note),
    };
