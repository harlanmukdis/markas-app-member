// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: const IntJson().fromJson(json['id']),
      subOrderId: const IntOrNullJson().fromJson(json['sub_order_id']),
      offerId: const IntOrNullJson().fromJson(json['offer_id']),
      itemName: const StringOrNullJson().fromJson(json['item_name_snapshot']),
      unitName: const StringOrNullJson().fromJson(json['unit_name_snapshot']),
      qty: json['qty'] == null ? 0 : const DoubleJson().fromJson(json['qty']),
      unitPrice: json['unit_price_snapshot'] == null
          ? 0
          : const IntJson().fromJson(json['unit_price_snapshot']),
      lineSubtotal: json['line_subtotal'] == null
          ? 0
          : const IntJson().fromJson(json['line_subtotal']),
      weightKg: const DoubleOrNullJson().fromJson(json['weight_kg_snapshot']),
      handlingClass:
          const StringOrNullJson().fromJson(json['handling_class_snapshot']),
      warehouseId: const IntOrNullJson().fromJson(json['warehouse_id']),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'sub_order_id': const IntOrNullJson().toJson(instance.subOrderId),
      'offer_id': const IntOrNullJson().toJson(instance.offerId),
      'item_name_snapshot': const StringOrNullJson().toJson(instance.itemName),
      'unit_name_snapshot': const StringOrNullJson().toJson(instance.unitName),
      'qty': const DoubleJson().toJson(instance.qty),
      'unit_price_snapshot': const IntJson().toJson(instance.unitPrice),
      'line_subtotal': const IntJson().toJson(instance.lineSubtotal),
      'weight_kg_snapshot': const DoubleOrNullJson().toJson(instance.weightKg),
      'handling_class_snapshot':
          const StringOrNullJson().toJson(instance.handlingClass),
      'warehouse_id': const IntOrNullJson().toJson(instance.warehouseId),
    };

_ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) =>
    _ShipmentModel(
      id: const IntJson().fromJson(json['id']),
      shipmentNo: const StringOrNullJson().fromJson(json['shipment_no']),
      subOrderId: const IntOrNullJson().fromJson(json['sub_order_id']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      shippingMethod:
          const StringOrNullJson().fromJson(json['shipping_method']),
      fleetTypeCode: const StringOrNullJson().fromJson(json['fleet_type_code']),
      shippingCost: json['shipping_cost'] == null
          ? 0
          : const IntJson().fromJson(json['shipping_cost']),
      suratJalanNo: const StringOrNullJson().fromJson(json['surat_jalan_no']),
      suratJalanIssuedAt:
          const ServerDateTimeJson().fromJson(json['surat_jalan_issued_at']),
      podPhotoUrl: const StringOrNullJson().fromJson(json['pod_photo_url']),
      podReceiverName:
          const StringOrNullJson().fromJson(json['pod_receiver_name']),
      podSignatureUrl:
          const StringOrNullJson().fromJson(json['pod_signature_url']),
      podUploadedAt:
          const ServerDateTimeJson().fromJson(json['pod_uploaded_at']),
      deliveryAttemptCount: json['delivery_attempt_count'] == null
          ? 0
          : const IntJson().fromJson(json['delivery_attempt_count']),
      handlingClass:
          const StringOrNullJson().fromJson(json['handling_class_snapshot']),
      deliveredAt: const ServerDateTimeJson().fromJson(json['delivered_at']),
      completedAt: const ServerDateTimeJson().fromJson(json['completed_at']),
      holdReleaseAt:
          const ServerDateTimeJson().fromJson(json['hold_release_at']),
    );

Map<String, dynamic> _$ShipmentModelToJson(_ShipmentModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'shipment_no': const StringOrNullJson().toJson(instance.shipmentNo),
      'sub_order_id': const IntOrNullJson().toJson(instance.subOrderId),
      'status': const StringJson().toJson(instance.status),
      'shipping_method':
          const StringOrNullJson().toJson(instance.shippingMethod),
      'fleet_type_code':
          const StringOrNullJson().toJson(instance.fleetTypeCode),
      'shipping_cost': const IntJson().toJson(instance.shippingCost),
      'surat_jalan_no': const StringOrNullJson().toJson(instance.suratJalanNo),
      'surat_jalan_issued_at':
          const ServerDateTimeJson().toJson(instance.suratJalanIssuedAt),
      'pod_photo_url': const StringOrNullJson().toJson(instance.podPhotoUrl),
      'pod_receiver_name':
          const StringOrNullJson().toJson(instance.podReceiverName),
      'pod_signature_url':
          const StringOrNullJson().toJson(instance.podSignatureUrl),
      'pod_uploaded_at':
          const ServerDateTimeJson().toJson(instance.podUploadedAt),
      'delivery_attempt_count':
          const IntJson().toJson(instance.deliveryAttemptCount),
      'handling_class_snapshot':
          const StringOrNullJson().toJson(instance.handlingClass),
      'delivered_at': const ServerDateTimeJson().toJson(instance.deliveredAt),
      'completed_at': const ServerDateTimeJson().toJson(instance.completedAt),
      'hold_release_at':
          const ServerDateTimeJson().toJson(instance.holdReleaseAt),
    };

_SubOrderModel _$SubOrderModelFromJson(Map<String, dynamic> json) =>
    _SubOrderModel(
      id: const IntJson().fromJson(json['id']),
      subOrderNo: const StringOrNullJson().fromJson(json['sub_order_no']),
      orderId: const IntOrNullJson().fromJson(json['order_id']),
      sellerId: const IntJson().fromJson(json['seller_id']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      sellerConfirmDeadline:
          const ServerDateTimeJson().fromJson(json['seller_confirm_deadline']),
      subtotal: json['subtotal'] == null
          ? 0
          : const IntJson().fromJson(json['subtotal']),
      shippingTotal: json['shipping_total'] == null
          ? 0
          : const IntJson().fromJson(json['shipping_total']),
      discountSeller: json['discount_seller'] == null
          ? 0
          : const IntJson().fromJson(json['discount_seller']),
      discountPlatform: json['discount_platform'] == null
          ? 0
          : const IntJson().fromJson(json['discount_platform']),
      taxTotal: json['tax_total'] == null
          ? 0
          : const IntJson().fromJson(json['tax_total']),
      total:
          json['total'] == null ? 0 : const IntJson().fromJson(json['total']),
      sellerPkpStatus:
          const StringOrNullJson().fromJson(json['seller_pkp_status_snapshot']),
      cancelReason: const StringOrNullJson().fromJson(json['cancel_reason']),
      hasCustomItem: json['has_custom_item'] == null
          ? false
          : const BoolJson().fromJson(json['has_custom_item']),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OrderItemModel>[],
      shipments: (json['shipments'] as List<dynamic>?)
              ?.map((e) => ShipmentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ShipmentModel>[],
    );

Map<String, dynamic> _$SubOrderModelToJson(_SubOrderModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'sub_order_no': const StringOrNullJson().toJson(instance.subOrderNo),
      'order_id': const IntOrNullJson().toJson(instance.orderId),
      'seller_id': const IntJson().toJson(instance.sellerId),
      'status': const StringJson().toJson(instance.status),
      'seller_confirm_deadline':
          const ServerDateTimeJson().toJson(instance.sellerConfirmDeadline),
      'subtotal': const IntJson().toJson(instance.subtotal),
      'shipping_total': const IntJson().toJson(instance.shippingTotal),
      'discount_seller': const IntJson().toJson(instance.discountSeller),
      'discount_platform': const IntJson().toJson(instance.discountPlatform),
      'tax_total': const IntJson().toJson(instance.taxTotal),
      'total': const IntJson().toJson(instance.total),
      'seller_pkp_status_snapshot':
          const StringOrNullJson().toJson(instance.sellerPkpStatus),
      'cancel_reason': const StringOrNullJson().toJson(instance.cancelReason),
      'has_custom_item': const BoolJson().toJson(instance.hasCustomItem),
      'items': instance.items,
      'shipments': instance.shipments,
    };

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
      id: const IntJson().fromJson(json['id']),
      orderNo: const StringOrNullJson().fromJson(json['order_no']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      buyerSegmentSnapshot:
          const StringOrNullJson().fromJson(json['buyer_segment_snapshot']),
      addressId: const IntOrNullJson().fromJson(json['address_id']),
      allOrNothing: json['all_or_nothing'] == null
          ? false
          : const BoolJson().fromJson(json['all_or_nothing']),
      subtotal: json['subtotal'] == null
          ? 0
          : const IntJson().fromJson(json['subtotal']),
      discountTotal: json['discount_total'] == null
          ? 0
          : const IntJson().fromJson(json['discount_total']),
      shippingTotal: json['shipping_total'] == null
          ? 0
          : const IntJson().fromJson(json['shipping_total']),
      taxTotal: json['tax_total'] == null
          ? 0
          : const IntJson().fromJson(json['tax_total']),
      serviceFee: json['service_fee'] == null
          ? 0
          : const IntJson().fromJson(json['service_fee']),
      grandTotal: json['grand_total'] == null
          ? 0
          : const IntJson().fromJson(json['grand_total']),
      stockConfirmDeadline:
          const ServerDateTimeJson().fromJson(json['stock_confirm_deadline']),
      paymentDeadline:
          const ServerDateTimeJson().fromJson(json['payment_deadline']),
      forcedBankTransfer: json['forced_bank_transfer'] == null
          ? false
          : const BoolJson().fromJson(json['forced_bank_transfer']),
      rfqContractId: const IntOrNullJson().fromJson(json['rfq_contract_id']),
      createdDate: const ServerDateTimeJson().fromJson(json['created_date']),
      subOrders: (json['sub_orders'] as List<dynamic>?)
              ?.map((e) => SubOrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SubOrderModel>[],
    );

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': const IntJson().toJson(instance.id),
      'order_no': const StringOrNullJson().toJson(instance.orderNo),
      'status': const StringJson().toJson(instance.status),
      'buyer_segment_snapshot':
          const StringOrNullJson().toJson(instance.buyerSegmentSnapshot),
      'address_id': const IntOrNullJson().toJson(instance.addressId),
      'all_or_nothing': const BoolJson().toJson(instance.allOrNothing),
      'subtotal': const IntJson().toJson(instance.subtotal),
      'discount_total': const IntJson().toJson(instance.discountTotal),
      'shipping_total': const IntJson().toJson(instance.shippingTotal),
      'tax_total': const IntJson().toJson(instance.taxTotal),
      'service_fee': const IntJson().toJson(instance.serviceFee),
      'grand_total': const IntJson().toJson(instance.grandTotal),
      'stock_confirm_deadline':
          const ServerDateTimeJson().toJson(instance.stockConfirmDeadline),
      'payment_deadline':
          const ServerDateTimeJson().toJson(instance.paymentDeadline),
      'forced_bank_transfer':
          const BoolJson().toJson(instance.forcedBankTransfer),
      'rfq_contract_id': const IntOrNullJson().toJson(instance.rfqContractId),
      'created_date': const ServerDateTimeJson().toJson(instance.createdDate),
      'sub_orders': instance.subOrders,
    };

_CheckoutResultModel _$CheckoutResultModelFromJson(Map<String, dynamic> json) =>
    _CheckoutResultModel(
      orderId: const IntJson().fromJson(json['order_id']),
      orderNo: const StringOrNullJson().fromJson(json['order_no']),
      status: json['status'] == null
          ? ''
          : const StringJson().fromJson(json['status']),
      subtotal: json['subtotal'] == null
          ? 0
          : const IntJson().fromJson(json['subtotal']),
      shippingTotal: json['shipping_total'] == null
          ? 0
          : const IntJson().fromJson(json['shipping_total']),
      discountTotal: json['discount_total'] == null
          ? 0
          : const IntJson().fromJson(json['discount_total']),
      grandTotal: json['grand_total'] == null
          ? 0
          : const IntJson().fromJson(json['grand_total']),
      forcedBankTransfer: json['forced_bank_transfer'] == null
          ? false
          : const BoolJson().fromJson(json['forced_bank_transfer']),
      subOrderIds: (json['sub_order_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
    );

Map<String, dynamic> _$CheckoutResultModelToJson(
        _CheckoutResultModel instance) =>
    <String, dynamic>{
      'order_id': const IntJson().toJson(instance.orderId),
      'order_no': const StringOrNullJson().toJson(instance.orderNo),
      'status': const StringJson().toJson(instance.status),
      'subtotal': const IntJson().toJson(instance.subtotal),
      'shipping_total': const IntJson().toJson(instance.shippingTotal),
      'discount_total': const IntJson().toJson(instance.discountTotal),
      'grand_total': const IntJson().toJson(instance.grandTotal),
      'forced_bank_transfer':
          const BoolJson().toJson(instance.forcedBankTransfer),
      'sub_order_ids': instance.subOrderIds,
    };
