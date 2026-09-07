// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishlistItemModel _$WishlistItemModelFromJson(Map<String, dynamic> json) =>
    _WishlistItemModel(
      id: const IntJson().fromJson(json['id']),
      offerId: const IntJson().fromJson(json['offer_id']),
      skuId: const IntOrNullJson().fromJson(json['sku_id']),
      displayName: const StringOrNullJson().fromJson(json['display_name']),
      displayPrice: const IntOrNullJson().fromJson(json['display_price']),
      freeformName: const StringOrNullJson().fromJson(json['freeform_name']),
      photos: json['photos_json'] == null
          ? const <PhotoModel>[]
          : const PhotosJsonConverter().fromJson(json['photos_json']),
      minOrderQty: json['min_order_qty'] == null
          ? 0
          : const DoubleJson().fromJson(json['min_order_qty']),
      offerStatus: const StringOrNullJson().fromJson(json['offer_status']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$WishlistItemModelToJson(_WishlistItemModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'offer_id': const IntJson().toJson(instance.offerId),
      'sku_id': const IntOrNullJson().toJson(instance.skuId),
      'display_name': const StringOrNullJson().toJson(instance.displayName),
      'display_price': const IntOrNullJson().toJson(instance.displayPrice),
      'freeform_name': const StringOrNullJson().toJson(instance.freeformName),
      'photos_json': const PhotosJsonConverter().toJson(instance.photos),
      'min_order_qty': const DoubleJson().toJson(instance.minOrderQty),
      'offer_status': const StringOrNullJson().toJson(instance.offerStatus),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };
