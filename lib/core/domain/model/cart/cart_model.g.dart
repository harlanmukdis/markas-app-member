// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      id: const IntJson().fromJson(json['id']),
      cartId: const IntJson().fromJson(json['cart_id']),
      offerId: const IntJson().fromJson(json['offer_id']),
      unitId: const IntOrNullJson().fromJson(json['unit_id']),
      qty: json['qty'] == null ? 0 : const DoubleJson().fromJson(json['qty']),
      sellerId: const IntJson().fromJson(json['seller_id']),
      offerStatus: const StringOrNullJson().fromJson(json['offer_status']),
      minOrderQty: json['min_order_qty'] == null
          ? 0
          : const DoubleJson().fromJson(json['min_order_qty']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'cart_id': const IntJson().toJson(instance.cartId),
      'offer_id': const IntJson().toJson(instance.offerId),
      'unit_id': const IntOrNullJson().toJson(instance.unitId),
      'qty': const DoubleJson().toJson(instance.qty),
      'seller_id': const IntJson().toJson(instance.sellerId),
      'offer_status': const StringOrNullJson().toJson(instance.offerStatus),
      'min_order_qty': const DoubleJson().toJson(instance.minOrderQty),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
    };

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
      cartId: const IntOrNullJson().fromJson(json['cart_id']),
      groupedBySeller: json['grouped_by_seller'] == null
          ? const <int, List<CartItemModel>>{}
          : const GroupedBySellerConverter()
              .fromJson(json['grouped_by_seller']),
      vouchers: (json['vouchers'] as List<dynamic>?)
              ?.map((e) => CartVoucherModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CartVoucherModel>[],
    );

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'cart_id': const IntOrNullJson().toJson(instance.cartId),
      'grouped_by_seller':
          const GroupedBySellerConverter().toJson(instance.groupedBySeller),
      'vouchers': instance.vouchers,
    };
