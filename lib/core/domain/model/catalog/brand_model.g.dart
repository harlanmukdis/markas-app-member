// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
      id: const IntJson().fromJson(json['id']),
      name: const StringJson().fromJson(json['name']),
      slug: const StringOrNullJson().fromJson(json['slug']),
      isCertified: json['is_certified'] == null
          ? false
          : const BoolJson().fromJson(json['is_certified']),
      logoUrl: const StringOrNullJson().fromJson(json['logo_url']),
      offerCount: json['offer_count'] == null
          ? 0
          : const IntJson().fromJson(json['offer_count']),
    );

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'name': const StringJson().toJson(instance.name),
      'slug': const StringOrNullJson().toJson(instance.slug),
      'is_certified': const BoolJson().toJson(instance.isCertified),
      'logo_url': const StringOrNullJson().toJson(instance.logoUrl),
      'offer_count': const IntJson().toJson(instance.offerCount),
    };

_OfferFacetsModel _$OfferFacetsModelFromJson(Map<String, dynamic> json) =>
    _OfferFacetsModel(
      priceMin: const IntOrNullJson().fromJson(json['price_min']),
      priceMax: const IntOrNullJson().fromJson(json['price_max']),
      ratingCounts: (json['rating_counts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const <String, int>{},
      brands: (json['brands'] as List<dynamic>?)
              ?.map((e) => FacetBrand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FacetBrand>[],
    );

Map<String, dynamic> _$OfferFacetsModelToJson(_OfferFacetsModel instance) =>
    <String, dynamic>{
      'price_min': const IntOrNullJson().toJson(instance.priceMin),
      'price_max': const IntOrNullJson().toJson(instance.priceMax),
      'rating_counts': instance.ratingCounts,
      'brands': instance.brands,
    };

_FacetBrand _$FacetBrandFromJson(Map<String, dynamic> json) => _FacetBrand(
      id: const IntJson().fromJson(json['id']),
      name: const StringJson().fromJson(json['name']),
      cnt: json['cnt'] == null ? 0 : const IntJson().fromJson(json['cnt']),
    );

Map<String, dynamic> _$FacetBrandToJson(_FacetBrand instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'name': const StringJson().toJson(instance.name),
      'cnt': const IntJson().toJson(instance.cnt),
    };
