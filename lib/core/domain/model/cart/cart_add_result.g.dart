// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_add_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartAddResult _$CartAddResultFromJson(Map<String, dynamic> json) =>
    _CartAddResult(
      cartId: const IntJson().fromJson(json['cart_id']),
      itemId: const IntJson().fromJson(json['item_id']),
    );

Map<String, dynamic> _$CartAddResultToJson(_CartAddResult instance) =>
    <String, dynamic>{
      'cart_id': const IntJson().toJson(instance.cartId),
      'item_id': const IntJson().toJson(instance.itemId),
    };
