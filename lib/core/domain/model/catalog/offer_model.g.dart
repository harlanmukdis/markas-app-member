// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceTierModel _$PriceTierModelFromJson(Map<String, dynamic> json) =>
    _PriceTierModel(
      id: const IntJson().fromJson(json['id']),
      offerId: const IntOrNullJson().fromJson(json['offer_id']),
      segment: const StringJson().fromJson(json['segment']),
      minQty: json['min_qty'] == null
          ? 1
          : const DoubleJson().fromJson(json['min_qty']),
      price: const IntJson().fromJson(json['price']),
      strikethroughPrice:
          const IntOrNullJson().fromJson(json['strikethrough_price']),
      strikethroughSince:
          const ServerDateTimeJson().fromJson(json['strikethrough_since']),
    );

Map<String, dynamic> _$PriceTierModelToJson(_PriceTierModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'offer_id': const IntOrNullJson().toJson(instance.offerId),
      'segment': const StringJson().toJson(instance.segment),
      'min_qty': const DoubleJson().toJson(instance.minQty),
      'price': const IntJson().toJson(instance.price),
      'strikethrough_price':
          const IntOrNullJson().toJson(instance.strikethroughPrice),
      'strikethrough_since':
          const ServerDateTimeJson().toJson(instance.strikethroughSince),
    };

_OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => _OfferModel(
      id: const IntJson().fromJson(json['id']),
      sellerId: const IntJson().fromJson(json['seller_id']),
      skuId: const IntOrNullJson().fromJson(json['sku_id']),
      categoryId: const IntOrNullJson().fromJson(json['category_id']),
      isFreeform: json['is_freeform'] == null
          ? false
          : const BoolJson().fromJson(json['is_freeform']),
      isTemporaryListing: json['is_temporary_listing'] == null
          ? false
          : const BoolJson().fromJson(json['is_temporary_listing']),
      freeformName: const StringOrNullJson().fromJson(json['freeform_name']),
      freeformWeightKg:
          const DoubleOrNullJson().fromJson(json['freeform_weight_kg']),
      freeformLengthCm:
          const DoubleOrNullJson().fromJson(json['freeform_length_cm']),
      freeformWidthCm:
          const DoubleOrNullJson().fromJson(json['freeform_width_cm']),
      freeformHeightCm:
          const DoubleOrNullJson().fromJson(json['freeform_height_cm']),
      handlingClass: json['handling_class'] == null
          ? 'NORMAL'
          : const StringJson().fromJson(json['handling_class']),
      photos: json['photos_json'] == null
          ? const <PhotoModel>[]
          : const PhotosJsonConverter().fromJson(json['photos_json']),
      minOrderQty: json['min_order_qty'] == null
          ? 0
          : const DoubleJson().fromJson(json['min_order_qty']),
      status: json['status'] == null
          ? 'ACTIVE'
          : const StringJson().fromJson(json['status']),
      rejectReason: const StringOrNullJson().fromJson(json['reject_reason']),
      description: const StringOrNullJson().fromJson(json['description']),
      createdAt: const ServerDateTimeJson().fromJson(json['created_at']),
      updatedAt: const ServerDateTimeJson().fromJson(json['updated_at']),
      priceTiers: (json['price_tiers'] as List<dynamic>?)
              ?.map((e) => PriceTierModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PriceTierModel>[],
      sellerName: const StringOrNullJson().fromJson(json['seller_name']),
      sellerScore: const DoubleOrNullJson().fromJson(json['seller_score']),
      pkpStatus: const StringOrNullJson().fromJson(json['pkp_status']),
      ongkirMulaiDari:
          const IntOrNullJson().fromJson(json['ongkir_mulai_dari']),
      ongkirIsEstimate: json['ongkir_is_estimate'] == null
          ? true
          : const BoolJson().fromJson(json['ongkir_is_estimate']),
      availableStock:
          const DoubleOrNullJson().fromJson(json['available_stock']),
    );

Map<String, dynamic> _$OfferModelToJson(_OfferModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'seller_id': const IntJson().toJson(instance.sellerId),
      'sku_id': const IntOrNullJson().toJson(instance.skuId),
      'category_id': const IntOrNullJson().toJson(instance.categoryId),
      'is_freeform': const BoolJson().toJson(instance.isFreeform),
      'is_temporary_listing':
          const BoolJson().toJson(instance.isTemporaryListing),
      'freeform_name': const StringOrNullJson().toJson(instance.freeformName),
      'freeform_weight_kg':
          const DoubleOrNullJson().toJson(instance.freeformWeightKg),
      'freeform_length_cm':
          const DoubleOrNullJson().toJson(instance.freeformLengthCm),
      'freeform_width_cm':
          const DoubleOrNullJson().toJson(instance.freeformWidthCm),
      'freeform_height_cm':
          const DoubleOrNullJson().toJson(instance.freeformHeightCm),
      'handling_class': const StringJson().toJson(instance.handlingClass),
      'photos_json': const PhotosJsonConverter().toJson(instance.photos),
      'min_order_qty': const DoubleJson().toJson(instance.minOrderQty),
      'status': const StringJson().toJson(instance.status),
      'reject_reason': const StringOrNullJson().toJson(instance.rejectReason),
      'description': const StringOrNullJson().toJson(instance.description),
      'created_at': const ServerDateTimeJson().toJson(instance.createdAt),
      'updated_at': const ServerDateTimeJson().toJson(instance.updatedAt),
      'price_tiers': instance.priceTiers,
      'seller_name': const StringOrNullJson().toJson(instance.sellerName),
      'seller_score': const DoubleOrNullJson().toJson(instance.sellerScore),
      'pkp_status': const StringOrNullJson().toJson(instance.pkpStatus),
      'ongkir_mulai_dari':
          const IntOrNullJson().toJson(instance.ongkirMulaiDari),
      'ongkir_is_estimate': const BoolJson().toJson(instance.ongkirIsEstimate),
      'available_stock':
          const DoubleOrNullJson().toJson(instance.availableStock),
    };
