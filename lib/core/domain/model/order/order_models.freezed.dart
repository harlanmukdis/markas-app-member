// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'sub_order_id')
  int? get subOrderId;
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  int? get offerId;
  @StringOrNullJson()
  @JsonKey(name: 'item_name_snapshot')
  String? get itemName;

  /// **Selalu berisi `"unit"`** di backend saat ini: resolusi satuan jual
  /// belum jalan di checkout. Untuk menampilkan satuan asli (sak/dus/m²),
  /// ambil dari `GET /sku-master/{id}` → `units[]`.
  @StringOrNullJson()
  @JsonKey(name: 'unit_name_snapshot')
  String? get unitName;
  @DoubleJson()
  double get qty;
  @IntJson()
  @JsonKey(name: 'unit_price_snapshot')
  int get unitPrice;
  @IntJson()
  @JsonKey(name: 'line_subtotal')
  int get lineSubtotal;
  @DoubleOrNullJson()
  @JsonKey(name: 'weight_kg_snapshot')
  double? get weightKg;
  @StringOrNullJson()
  @JsonKey(name: 'handling_class_snapshot')
  String? get handlingClass;
  @IntOrNullJson()
  @JsonKey(name: 'warehouse_id')
  int? get warehouseId;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      _$OrderItemModelCopyWithImpl<OrderItemModel>(
          this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subOrderId, subOrderId) ||
                other.subOrderId == subOrderId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.lineSubtotal, lineSubtotal) ||
                other.lineSubtotal == lineSubtotal) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subOrderId,
      offerId,
      itemName,
      unitName,
      qty,
      unitPrice,
      lineSubtotal,
      weightKg,
      handlingClass,
      warehouseId);

  @override
  String toString() {
    return 'OrderItemModel(id: $id, subOrderId: $subOrderId, offerId: $offerId, itemName: $itemName, unitName: $unitName, qty: $qty, unitPrice: $unitPrice, lineSubtotal: $lineSubtotal, weightKg: $weightKg, handlingClass: $handlingClass, warehouseId: $warehouseId)';
  }
}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) _then) =
      _$OrderItemModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @StringOrNullJson() @JsonKey(name: 'item_name_snapshot') String? itemName,
      @StringOrNullJson() @JsonKey(name: 'unit_name_snapshot') String? unitName,
      @DoubleJson() double qty,
      @IntJson() @JsonKey(name: 'unit_price_snapshot') int unitPrice,
      @IntJson() @JsonKey(name: 'line_subtotal') int lineSubtotal,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg_snapshot') double? weightKg,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      String? handlingClass,
      @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subOrderId = freezed,
    Object? offerId = freezed,
    Object? itemName = freezed,
    Object? unitName = freezed,
    Object? qty = null,
    Object? unitPrice = null,
    Object? lineSubtotal = null,
    Object? weightKg = freezed,
    Object? handlingClass = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subOrderId: freezed == subOrderId
          ? _self.subOrderId
          : subOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      offerId: freezed == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemName: freezed == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      lineSubtotal: null == lineSubtotal
          ? _self.lineSubtotal
          : lineSubtotal // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: freezed == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _self.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringOrNullJson()
            @JsonKey(name: 'item_name_snapshot')
            String? itemName,
            @StringOrNullJson()
            @JsonKey(name: 'unit_name_snapshot')
            String? unitName,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'unit_price_snapshot') int unitPrice,
            @IntJson() @JsonKey(name: 'line_subtotal') int lineSubtotal,
            @DoubleOrNullJson()
            @JsonKey(name: 'weight_kg_snapshot')
            double? weightKg,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(
            _that.id,
            _that.subOrderId,
            _that.offerId,
            _that.itemName,
            _that.unitName,
            _that.qty,
            _that.unitPrice,
            _that.lineSubtotal,
            _that.weightKg,
            _that.handlingClass,
            _that.warehouseId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringOrNullJson()
            @JsonKey(name: 'item_name_snapshot')
            String? itemName,
            @StringOrNullJson()
            @JsonKey(name: 'unit_name_snapshot')
            String? unitName,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'unit_price_snapshot') int unitPrice,
            @IntJson() @JsonKey(name: 'line_subtotal') int lineSubtotal,
            @DoubleOrNullJson()
            @JsonKey(name: 'weight_kg_snapshot')
            double? weightKg,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
        return $default(
            _that.id,
            _that.subOrderId,
            _that.offerId,
            _that.itemName,
            _that.unitName,
            _that.qty,
            _that.unitPrice,
            _that.lineSubtotal,
            _that.weightKg,
            _that.handlingClass,
            _that.warehouseId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @IntJson() int id,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringOrNullJson()
            @JsonKey(name: 'item_name_snapshot')
            String? itemName,
            @StringOrNullJson()
            @JsonKey(name: 'unit_name_snapshot')
            String? unitName,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'unit_price_snapshot') int unitPrice,
            @IntJson() @JsonKey(name: 'line_subtotal') int lineSubtotal,
            @DoubleOrNullJson()
            @JsonKey(name: 'weight_kg_snapshot')
            double? weightKg,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(
            _that.id,
            _that.subOrderId,
            _that.offerId,
            _that.itemName,
            _that.unitName,
            _that.qty,
            _that.unitPrice,
            _that.lineSubtotal,
            _that.weightKg,
            _that.handlingClass,
            _that.warehouseId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderItemModel extends OrderItemModel {
  const _OrderItemModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') this.subOrderId,
      @IntOrNullJson() @JsonKey(name: 'offer_id') this.offerId,
      @StringOrNullJson() @JsonKey(name: 'item_name_snapshot') this.itemName,
      @StringOrNullJson() @JsonKey(name: 'unit_name_snapshot') this.unitName,
      @DoubleJson() this.qty = 0,
      @IntJson() @JsonKey(name: 'unit_price_snapshot') this.unitPrice = 0,
      @IntJson() @JsonKey(name: 'line_subtotal') this.lineSubtotal = 0,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg_snapshot') this.weightKg,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      this.handlingClass,
      @IntOrNullJson() @JsonKey(name: 'warehouse_id') this.warehouseId})
      : super._();
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sub_order_id')
  final int? subOrderId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  final int? offerId;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'item_name_snapshot')
  final String? itemName;

  /// **Selalu berisi `"unit"`** di backend saat ini: resolusi satuan jual
  /// belum jalan di checkout. Untuk menampilkan satuan asli (sak/dus/m²),
  /// ambil dari `GET /sku-master/{id}` → `units[]`.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'unit_name_snapshot')
  final String? unitName;
  @override
  @JsonKey()
  @DoubleJson()
  final double qty;
  @override
  @IntJson()
  @JsonKey(name: 'unit_price_snapshot')
  final int unitPrice;
  @override
  @IntJson()
  @JsonKey(name: 'line_subtotal')
  final int lineSubtotal;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'weight_kg_snapshot')
  final double? weightKg;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'handling_class_snapshot')
  final String? handlingClass;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'warehouse_id')
  final int? warehouseId;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemModelCopyWith<_OrderItemModel> get copyWith =>
      __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subOrderId, subOrderId) ||
                other.subOrderId == subOrderId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.lineSubtotal, lineSubtotal) ||
                other.lineSubtotal == lineSubtotal) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subOrderId,
      offerId,
      itemName,
      unitName,
      qty,
      unitPrice,
      lineSubtotal,
      weightKg,
      handlingClass,
      warehouseId);

  @override
  String toString() {
    return 'OrderItemModel(id: $id, subOrderId: $subOrderId, offerId: $offerId, itemName: $itemName, unitName: $unitName, qty: $qty, unitPrice: $unitPrice, lineSubtotal: $lineSubtotal, weightKg: $weightKg, handlingClass: $handlingClass, warehouseId: $warehouseId)';
  }
}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(
          _OrderItemModel value, $Res Function(_OrderItemModel) _then) =
      __$OrderItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @StringOrNullJson() @JsonKey(name: 'item_name_snapshot') String? itemName,
      @StringOrNullJson() @JsonKey(name: 'unit_name_snapshot') String? unitName,
      @DoubleJson() double qty,
      @IntJson() @JsonKey(name: 'unit_price_snapshot') int unitPrice,
      @IntJson() @JsonKey(name: 'line_subtotal') int lineSubtotal,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg_snapshot') double? weightKg,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      String? handlingClass,
      @IntOrNullJson() @JsonKey(name: 'warehouse_id') int? warehouseId});
}

/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? subOrderId = freezed,
    Object? offerId = freezed,
    Object? itemName = freezed,
    Object? unitName = freezed,
    Object? qty = null,
    Object? unitPrice = null,
    Object? lineSubtotal = null,
    Object? weightKg = freezed,
    Object? handlingClass = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_OrderItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subOrderId: freezed == subOrderId
          ? _self.subOrderId
          : subOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      offerId: freezed == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemName: freezed == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      lineSubtotal: null == lineSubtotal
          ? _self.lineSubtotal
          : lineSubtotal // ignore: cast_nullable_to_non_nullable
              as int,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: freezed == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseId: freezed == warehouseId
          ? _self.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ShipmentModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'shipment_no')
  String? get shipmentNo;
  @IntOrNullJson()
  @JsonKey(name: 'sub_order_id')
  int? get subOrderId;
  @StringJson()
  String get status;
  @StringOrNullJson()
  @JsonKey(name: 'shipping_method')
  String? get shippingMethod;
  @StringOrNullJson()
  @JsonKey(name: 'fleet_type_code')
  String? get fleetTypeCode;
  @IntJson()
  @JsonKey(name: 'shipping_cost')
  int get shippingCost;
  @StringOrNullJson()
  @JsonKey(name: 'surat_jalan_no')
  String? get suratJalanNo;
  @ServerDateTimeJson()
  @JsonKey(name: 'surat_jalan_issued_at')
  DateTime?
      get suratJalanIssuedAt; // --- Bukti terima (POD) — layak ditampilkan ke pembeli ---
  @StringOrNullJson()
  @JsonKey(name: 'pod_photo_url')
  String? get podPhotoUrl;
  @StringOrNullJson()
  @JsonKey(name: 'pod_receiver_name')
  String? get podReceiverName;
  @StringOrNullJson()
  @JsonKey(name: 'pod_signature_url')
  String? get podSignatureUrl;
  @ServerDateTimeJson()
  @JsonKey(name: 'pod_uploaded_at')
  DateTime? get podUploadedAt;
  @IntJson()
  @JsonKey(name: 'delivery_attempt_count')
  int get deliveryAttemptCount;
  @StringOrNullJson()
  @JsonKey(name: 'handling_class_snapshot')
  String? get handlingClass;

  /// Titik mulai jendela retur **dan** hitungan auto-complete H+3.
  @ServerDateTimeJson()
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @ServerDateTimeJson()
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;

  /// Kapan dana cair ke toko — informasional bagi pembeli.
  @ServerDateTimeJson()
  @JsonKey(name: 'hold_release_at')
  DateTime? get holdReleaseAt;

  /// Create a copy of ShipmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShipmentModelCopyWith<ShipmentModel> get copyWith =>
      _$ShipmentModelCopyWithImpl<ShipmentModel>(
          this as ShipmentModel, _$identity);

  /// Serializes this ShipmentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShipmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.subOrderId, subOrderId) ||
                other.subOrderId == subOrderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.fleetTypeCode, fleetTypeCode) ||
                other.fleetTypeCode == fleetTypeCode) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.suratJalanNo, suratJalanNo) ||
                other.suratJalanNo == suratJalanNo) &&
            (identical(other.suratJalanIssuedAt, suratJalanIssuedAt) ||
                other.suratJalanIssuedAt == suratJalanIssuedAt) &&
            (identical(other.podPhotoUrl, podPhotoUrl) ||
                other.podPhotoUrl == podPhotoUrl) &&
            (identical(other.podReceiverName, podReceiverName) ||
                other.podReceiverName == podReceiverName) &&
            (identical(other.podSignatureUrl, podSignatureUrl) ||
                other.podSignatureUrl == podSignatureUrl) &&
            (identical(other.podUploadedAt, podUploadedAt) ||
                other.podUploadedAt == podUploadedAt) &&
            (identical(other.deliveryAttemptCount, deliveryAttemptCount) ||
                other.deliveryAttemptCount == deliveryAttemptCount) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.holdReleaseAt, holdReleaseAt) ||
                other.holdReleaseAt == holdReleaseAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shipmentNo,
      subOrderId,
      status,
      shippingMethod,
      fleetTypeCode,
      shippingCost,
      suratJalanNo,
      suratJalanIssuedAt,
      podPhotoUrl,
      podReceiverName,
      podSignatureUrl,
      podUploadedAt,
      deliveryAttemptCount,
      handlingClass,
      deliveredAt,
      completedAt,
      holdReleaseAt);

  @override
  String toString() {
    return 'ShipmentModel(id: $id, shipmentNo: $shipmentNo, subOrderId: $subOrderId, status: $status, shippingMethod: $shippingMethod, fleetTypeCode: $fleetTypeCode, shippingCost: $shippingCost, suratJalanNo: $suratJalanNo, suratJalanIssuedAt: $suratJalanIssuedAt, podPhotoUrl: $podPhotoUrl, podReceiverName: $podReceiverName, podSignatureUrl: $podSignatureUrl, podUploadedAt: $podUploadedAt, deliveryAttemptCount: $deliveryAttemptCount, handlingClass: $handlingClass, deliveredAt: $deliveredAt, completedAt: $completedAt, holdReleaseAt: $holdReleaseAt)';
  }
}

/// @nodoc
abstract mixin class $ShipmentModelCopyWith<$Res> {
  factory $ShipmentModelCopyWith(
          ShipmentModel value, $Res Function(ShipmentModel) _then) =
      _$ShipmentModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'shipment_no') String? shipmentNo,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
      @StringJson() String status,
      @StringOrNullJson()
      @JsonKey(name: 'shipping_method')
      String? shippingMethod,
      @StringOrNullJson()
      @JsonKey(name: 'fleet_type_code')
      String? fleetTypeCode,
      @IntJson() @JsonKey(name: 'shipping_cost') int shippingCost,
      @StringOrNullJson() @JsonKey(name: 'surat_jalan_no') String? suratJalanNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'surat_jalan_issued_at')
      DateTime? suratJalanIssuedAt,
      @StringOrNullJson() @JsonKey(name: 'pod_photo_url') String? podPhotoUrl,
      @StringOrNullJson()
      @JsonKey(name: 'pod_receiver_name')
      String? podReceiverName,
      @StringOrNullJson()
      @JsonKey(name: 'pod_signature_url')
      String? podSignatureUrl,
      @ServerDateTimeJson()
      @JsonKey(name: 'pod_uploaded_at')
      DateTime? podUploadedAt,
      @IntJson()
      @JsonKey(name: 'delivery_attempt_count')
      int deliveryAttemptCount,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      String? handlingClass,
      @ServerDateTimeJson()
      @JsonKey(name: 'delivered_at')
      DateTime? deliveredAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'completed_at')
      DateTime? completedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'hold_release_at')
      DateTime? holdReleaseAt});
}

/// @nodoc
class _$ShipmentModelCopyWithImpl<$Res>
    implements $ShipmentModelCopyWith<$Res> {
  _$ShipmentModelCopyWithImpl(this._self, this._then);

  final ShipmentModel _self;
  final $Res Function(ShipmentModel) _then;

  /// Create a copy of ShipmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shipmentNo = freezed,
    Object? subOrderId = freezed,
    Object? status = null,
    Object? shippingMethod = freezed,
    Object? fleetTypeCode = freezed,
    Object? shippingCost = null,
    Object? suratJalanNo = freezed,
    Object? suratJalanIssuedAt = freezed,
    Object? podPhotoUrl = freezed,
    Object? podReceiverName = freezed,
    Object? podSignatureUrl = freezed,
    Object? podUploadedAt = freezed,
    Object? deliveryAttemptCount = null,
    Object? handlingClass = freezed,
    Object? deliveredAt = freezed,
    Object? completedAt = freezed,
    Object? holdReleaseAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shipmentNo: freezed == shipmentNo
          ? _self.shipmentNo
          : shipmentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      subOrderId: freezed == subOrderId
          ? _self.subOrderId
          : subOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethod: freezed == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      fleetTypeCode: freezed == fleetTypeCode
          ? _self.fleetTypeCode
          : fleetTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
      suratJalanNo: freezed == suratJalanNo
          ? _self.suratJalanNo
          : suratJalanNo // ignore: cast_nullable_to_non_nullable
              as String?,
      suratJalanIssuedAt: freezed == suratJalanIssuedAt
          ? _self.suratJalanIssuedAt
          : suratJalanIssuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      podPhotoUrl: freezed == podPhotoUrl
          ? _self.podPhotoUrl
          : podPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      podReceiverName: freezed == podReceiverName
          ? _self.podReceiverName
          : podReceiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      podSignatureUrl: freezed == podSignatureUrl
          ? _self.podSignatureUrl
          : podSignatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      podUploadedAt: freezed == podUploadedAt
          ? _self.podUploadedAt
          : podUploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAttemptCount: null == deliveryAttemptCount
          ? _self.deliveryAttemptCount
          : deliveryAttemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      handlingClass: freezed == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      holdReleaseAt: freezed == holdReleaseAt
          ? _self.holdReleaseAt
          : holdReleaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShipmentModel].
extension ShipmentModelPatterns on ShipmentModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShipmentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShipmentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShipmentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'shipment_no')
            String? shipmentNo,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'shipping_method')
            String? shippingMethod,
            @StringOrNullJson()
            @JsonKey(name: 'fleet_type_code')
            String? fleetTypeCode,
            @IntJson() @JsonKey(name: 'shipping_cost') int shippingCost,
            @StringOrNullJson()
            @JsonKey(name: 'surat_jalan_no')
            String? suratJalanNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'surat_jalan_issued_at')
            DateTime? suratJalanIssuedAt,
            @StringOrNullJson()
            @JsonKey(name: 'pod_photo_url')
            String? podPhotoUrl,
            @StringOrNullJson()
            @JsonKey(name: 'pod_receiver_name')
            String? podReceiverName,
            @StringOrNullJson()
            @JsonKey(name: 'pod_signature_url')
            String? podSignatureUrl,
            @ServerDateTimeJson()
            @JsonKey(name: 'pod_uploaded_at')
            DateTime? podUploadedAt,
            @IntJson()
            @JsonKey(name: 'delivery_attempt_count')
            int deliveryAttemptCount,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @ServerDateTimeJson()
            @JsonKey(name: 'delivered_at')
            DateTime? deliveredAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'completed_at')
            DateTime? completedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'hold_release_at')
            DateTime? holdReleaseAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel() when $default != null:
        return $default(
            _that.id,
            _that.shipmentNo,
            _that.subOrderId,
            _that.status,
            _that.shippingMethod,
            _that.fleetTypeCode,
            _that.shippingCost,
            _that.suratJalanNo,
            _that.suratJalanIssuedAt,
            _that.podPhotoUrl,
            _that.podReceiverName,
            _that.podSignatureUrl,
            _that.podUploadedAt,
            _that.deliveryAttemptCount,
            _that.handlingClass,
            _that.deliveredAt,
            _that.completedAt,
            _that.holdReleaseAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'shipment_no')
            String? shipmentNo,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'shipping_method')
            String? shippingMethod,
            @StringOrNullJson()
            @JsonKey(name: 'fleet_type_code')
            String? fleetTypeCode,
            @IntJson() @JsonKey(name: 'shipping_cost') int shippingCost,
            @StringOrNullJson()
            @JsonKey(name: 'surat_jalan_no')
            String? suratJalanNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'surat_jalan_issued_at')
            DateTime? suratJalanIssuedAt,
            @StringOrNullJson()
            @JsonKey(name: 'pod_photo_url')
            String? podPhotoUrl,
            @StringOrNullJson()
            @JsonKey(name: 'pod_receiver_name')
            String? podReceiverName,
            @StringOrNullJson()
            @JsonKey(name: 'pod_signature_url')
            String? podSignatureUrl,
            @ServerDateTimeJson()
            @JsonKey(name: 'pod_uploaded_at')
            DateTime? podUploadedAt,
            @IntJson()
            @JsonKey(name: 'delivery_attempt_count')
            int deliveryAttemptCount,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @ServerDateTimeJson()
            @JsonKey(name: 'delivered_at')
            DateTime? deliveredAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'completed_at')
            DateTime? completedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'hold_release_at')
            DateTime? holdReleaseAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel():
        return $default(
            _that.id,
            _that.shipmentNo,
            _that.subOrderId,
            _that.status,
            _that.shippingMethod,
            _that.fleetTypeCode,
            _that.shippingCost,
            _that.suratJalanNo,
            _that.suratJalanIssuedAt,
            _that.podPhotoUrl,
            _that.podReceiverName,
            _that.podSignatureUrl,
            _that.podUploadedAt,
            _that.deliveryAttemptCount,
            _that.handlingClass,
            _that.deliveredAt,
            _that.completedAt,
            _that.holdReleaseAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'shipment_no')
            String? shipmentNo,
            @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'shipping_method')
            String? shippingMethod,
            @StringOrNullJson()
            @JsonKey(name: 'fleet_type_code')
            String? fleetTypeCode,
            @IntJson() @JsonKey(name: 'shipping_cost') int shippingCost,
            @StringOrNullJson()
            @JsonKey(name: 'surat_jalan_no')
            String? suratJalanNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'surat_jalan_issued_at')
            DateTime? suratJalanIssuedAt,
            @StringOrNullJson()
            @JsonKey(name: 'pod_photo_url')
            String? podPhotoUrl,
            @StringOrNullJson()
            @JsonKey(name: 'pod_receiver_name')
            String? podReceiverName,
            @StringOrNullJson()
            @JsonKey(name: 'pod_signature_url')
            String? podSignatureUrl,
            @ServerDateTimeJson()
            @JsonKey(name: 'pod_uploaded_at')
            DateTime? podUploadedAt,
            @IntJson()
            @JsonKey(name: 'delivery_attempt_count')
            int deliveryAttemptCount,
            @StringOrNullJson()
            @JsonKey(name: 'handling_class_snapshot')
            String? handlingClass,
            @ServerDateTimeJson()
            @JsonKey(name: 'delivered_at')
            DateTime? deliveredAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'completed_at')
            DateTime? completedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'hold_release_at')
            DateTime? holdReleaseAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentModel() when $default != null:
        return $default(
            _that.id,
            _that.shipmentNo,
            _that.subOrderId,
            _that.status,
            _that.shippingMethod,
            _that.fleetTypeCode,
            _that.shippingCost,
            _that.suratJalanNo,
            _that.suratJalanIssuedAt,
            _that.podPhotoUrl,
            _that.podReceiverName,
            _that.podSignatureUrl,
            _that.podUploadedAt,
            _that.deliveryAttemptCount,
            _that.handlingClass,
            _that.deliveredAt,
            _that.completedAt,
            _that.holdReleaseAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ShipmentModel extends ShipmentModel {
  const _ShipmentModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'shipment_no') this.shipmentNo,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') this.subOrderId,
      @StringJson() this.status = '',
      @StringOrNullJson() @JsonKey(name: 'shipping_method') this.shippingMethod,
      @StringOrNullJson() @JsonKey(name: 'fleet_type_code') this.fleetTypeCode,
      @IntJson() @JsonKey(name: 'shipping_cost') this.shippingCost = 0,
      @StringOrNullJson() @JsonKey(name: 'surat_jalan_no') this.suratJalanNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'surat_jalan_issued_at')
      this.suratJalanIssuedAt,
      @StringOrNullJson() @JsonKey(name: 'pod_photo_url') this.podPhotoUrl,
      @StringOrNullJson()
      @JsonKey(name: 'pod_receiver_name')
      this.podReceiverName,
      @StringOrNullJson()
      @JsonKey(name: 'pod_signature_url')
      this.podSignatureUrl,
      @ServerDateTimeJson()
      @JsonKey(name: 'pod_uploaded_at')
      this.podUploadedAt,
      @IntJson()
      @JsonKey(name: 'delivery_attempt_count')
      this.deliveryAttemptCount = 0,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      this.handlingClass,
      @ServerDateTimeJson() @JsonKey(name: 'delivered_at') this.deliveredAt,
      @ServerDateTimeJson() @JsonKey(name: 'completed_at') this.completedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'hold_release_at')
      this.holdReleaseAt})
      : super._();
  factory _ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'shipment_no')
  final String? shipmentNo;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sub_order_id')
  final int? subOrderId;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'shipping_method')
  final String? shippingMethod;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'fleet_type_code')
  final String? fleetTypeCode;
  @override
  @IntJson()
  @JsonKey(name: 'shipping_cost')
  final int shippingCost;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'surat_jalan_no')
  final String? suratJalanNo;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'surat_jalan_issued_at')
  final DateTime? suratJalanIssuedAt;
// --- Bukti terima (POD) — layak ditampilkan ke pembeli ---
  @override
  @StringOrNullJson()
  @JsonKey(name: 'pod_photo_url')
  final String? podPhotoUrl;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'pod_receiver_name')
  final String? podReceiverName;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'pod_signature_url')
  final String? podSignatureUrl;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'pod_uploaded_at')
  final DateTime? podUploadedAt;
  @override
  @IntJson()
  @JsonKey(name: 'delivery_attempt_count')
  final int deliveryAttemptCount;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'handling_class_snapshot')
  final String? handlingClass;

  /// Titik mulai jendela retur **dan** hitungan auto-complete H+3.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;

  /// Kapan dana cair ke toko — informasional bagi pembeli.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'hold_release_at')
  final DateTime? holdReleaseAt;

  /// Create a copy of ShipmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShipmentModelCopyWith<_ShipmentModel> get copyWith =>
      __$ShipmentModelCopyWithImpl<_ShipmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShipmentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShipmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentNo, shipmentNo) ||
                other.shipmentNo == shipmentNo) &&
            (identical(other.subOrderId, subOrderId) ||
                other.subOrderId == subOrderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.fleetTypeCode, fleetTypeCode) ||
                other.fleetTypeCode == fleetTypeCode) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.suratJalanNo, suratJalanNo) ||
                other.suratJalanNo == suratJalanNo) &&
            (identical(other.suratJalanIssuedAt, suratJalanIssuedAt) ||
                other.suratJalanIssuedAt == suratJalanIssuedAt) &&
            (identical(other.podPhotoUrl, podPhotoUrl) ||
                other.podPhotoUrl == podPhotoUrl) &&
            (identical(other.podReceiverName, podReceiverName) ||
                other.podReceiverName == podReceiverName) &&
            (identical(other.podSignatureUrl, podSignatureUrl) ||
                other.podSignatureUrl == podSignatureUrl) &&
            (identical(other.podUploadedAt, podUploadedAt) ||
                other.podUploadedAt == podUploadedAt) &&
            (identical(other.deliveryAttemptCount, deliveryAttemptCount) ||
                other.deliveryAttemptCount == deliveryAttemptCount) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.holdReleaseAt, holdReleaseAt) ||
                other.holdReleaseAt == holdReleaseAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shipmentNo,
      subOrderId,
      status,
      shippingMethod,
      fleetTypeCode,
      shippingCost,
      suratJalanNo,
      suratJalanIssuedAt,
      podPhotoUrl,
      podReceiverName,
      podSignatureUrl,
      podUploadedAt,
      deliveryAttemptCount,
      handlingClass,
      deliveredAt,
      completedAt,
      holdReleaseAt);

  @override
  String toString() {
    return 'ShipmentModel(id: $id, shipmentNo: $shipmentNo, subOrderId: $subOrderId, status: $status, shippingMethod: $shippingMethod, fleetTypeCode: $fleetTypeCode, shippingCost: $shippingCost, suratJalanNo: $suratJalanNo, suratJalanIssuedAt: $suratJalanIssuedAt, podPhotoUrl: $podPhotoUrl, podReceiverName: $podReceiverName, podSignatureUrl: $podSignatureUrl, podUploadedAt: $podUploadedAt, deliveryAttemptCount: $deliveryAttemptCount, handlingClass: $handlingClass, deliveredAt: $deliveredAt, completedAt: $completedAt, holdReleaseAt: $holdReleaseAt)';
  }
}

/// @nodoc
abstract mixin class _$ShipmentModelCopyWith<$Res>
    implements $ShipmentModelCopyWith<$Res> {
  factory _$ShipmentModelCopyWith(
          _ShipmentModel value, $Res Function(_ShipmentModel) _then) =
      __$ShipmentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'shipment_no') String? shipmentNo,
      @IntOrNullJson() @JsonKey(name: 'sub_order_id') int? subOrderId,
      @StringJson() String status,
      @StringOrNullJson()
      @JsonKey(name: 'shipping_method')
      String? shippingMethod,
      @StringOrNullJson()
      @JsonKey(name: 'fleet_type_code')
      String? fleetTypeCode,
      @IntJson() @JsonKey(name: 'shipping_cost') int shippingCost,
      @StringOrNullJson() @JsonKey(name: 'surat_jalan_no') String? suratJalanNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'surat_jalan_issued_at')
      DateTime? suratJalanIssuedAt,
      @StringOrNullJson() @JsonKey(name: 'pod_photo_url') String? podPhotoUrl,
      @StringOrNullJson()
      @JsonKey(name: 'pod_receiver_name')
      String? podReceiverName,
      @StringOrNullJson()
      @JsonKey(name: 'pod_signature_url')
      String? podSignatureUrl,
      @ServerDateTimeJson()
      @JsonKey(name: 'pod_uploaded_at')
      DateTime? podUploadedAt,
      @IntJson()
      @JsonKey(name: 'delivery_attempt_count')
      int deliveryAttemptCount,
      @StringOrNullJson()
      @JsonKey(name: 'handling_class_snapshot')
      String? handlingClass,
      @ServerDateTimeJson()
      @JsonKey(name: 'delivered_at')
      DateTime? deliveredAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'completed_at')
      DateTime? completedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'hold_release_at')
      DateTime? holdReleaseAt});
}

/// @nodoc
class __$ShipmentModelCopyWithImpl<$Res>
    implements _$ShipmentModelCopyWith<$Res> {
  __$ShipmentModelCopyWithImpl(this._self, this._then);

  final _ShipmentModel _self;
  final $Res Function(_ShipmentModel) _then;

  /// Create a copy of ShipmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? shipmentNo = freezed,
    Object? subOrderId = freezed,
    Object? status = null,
    Object? shippingMethod = freezed,
    Object? fleetTypeCode = freezed,
    Object? shippingCost = null,
    Object? suratJalanNo = freezed,
    Object? suratJalanIssuedAt = freezed,
    Object? podPhotoUrl = freezed,
    Object? podReceiverName = freezed,
    Object? podSignatureUrl = freezed,
    Object? podUploadedAt = freezed,
    Object? deliveryAttemptCount = null,
    Object? handlingClass = freezed,
    Object? deliveredAt = freezed,
    Object? completedAt = freezed,
    Object? holdReleaseAt = freezed,
  }) {
    return _then(_ShipmentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shipmentNo: freezed == shipmentNo
          ? _self.shipmentNo
          : shipmentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      subOrderId: freezed == subOrderId
          ? _self.subOrderId
          : subOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethod: freezed == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      fleetTypeCode: freezed == fleetTypeCode
          ? _self.fleetTypeCode
          : fleetTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
      suratJalanNo: freezed == suratJalanNo
          ? _self.suratJalanNo
          : suratJalanNo // ignore: cast_nullable_to_non_nullable
              as String?,
      suratJalanIssuedAt: freezed == suratJalanIssuedAt
          ? _self.suratJalanIssuedAt
          : suratJalanIssuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      podPhotoUrl: freezed == podPhotoUrl
          ? _self.podPhotoUrl
          : podPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      podReceiverName: freezed == podReceiverName
          ? _self.podReceiverName
          : podReceiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      podSignatureUrl: freezed == podSignatureUrl
          ? _self.podSignatureUrl
          : podSignatureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      podUploadedAt: freezed == podUploadedAt
          ? _self.podUploadedAt
          : podUploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryAttemptCount: null == deliveryAttemptCount
          ? _self.deliveryAttemptCount
          : deliveryAttemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      handlingClass: freezed == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      holdReleaseAt: freezed == holdReleaseAt
          ? _self.holdReleaseAt
          : holdReleaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$SubOrderModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'sub_order_no')
  String? get subOrderNo;
  @IntOrNullJson()
  @JsonKey(name: 'order_id')
  int? get orderId;
  @IntJson()
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @StringJson()
  String get status;

  /// Batas toko mengonfirmasi (1×24 jam kerja). Lewat itu order auto-batal
  /// dan pembeli direfund penuh.
  @ServerDateTimeJson()
  @JsonKey(name: 'seller_confirm_deadline')
  DateTime? get sellerConfirmDeadline;
  @IntJson()
  int get subtotal;
  @IntJson()
  @JsonKey(name: 'shipping_total')
  int get shippingTotal;
  @IntJson()
  @JsonKey(name: 'discount_seller')
  int get discountSeller;
  @IntJson()
  @JsonKey(name: 'discount_platform')
  int get discountPlatform;
  @IntJson()
  @JsonKey(name: 'tax_total')
  int get taxTotal;
  @IntJson()
  int get total;
  @StringOrNullJson()
  @JsonKey(name: 'seller_pkp_status_snapshot')
  String? get sellerPkpStatus;
  @StringOrNullJson()
  @JsonKey(name: 'cancel_reason')
  String? get cancelReason;

  /// Barang custom **tidak bisa dibatalkan** setelah diproses (ORD-11) —
  /// wajib diberitahukan sebelum pembeli membayar, bukan di S&K.
  @BoolJson()
  @JsonKey(name: 'has_custom_item')
  bool get hasCustomItem;
  List<OrderItemModel> get items;
  List<ShipmentModel> get shipments;

  /// Create a copy of SubOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubOrderModelCopyWith<SubOrderModel> get copyWith =>
      _$SubOrderModelCopyWithImpl<SubOrderModel>(
          this as SubOrderModel, _$identity);

  /// Serializes this SubOrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubOrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subOrderNo, subOrderNo) ||
                other.subOrderNo == subOrderNo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sellerConfirmDeadline, sellerConfirmDeadline) ||
                other.sellerConfirmDeadline == sellerConfirmDeadline) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingTotal, shippingTotal) ||
                other.shippingTotal == shippingTotal) &&
            (identical(other.discountSeller, discountSeller) ||
                other.discountSeller == discountSeller) &&
            (identical(other.discountPlatform, discountPlatform) ||
                other.discountPlatform == discountPlatform) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.sellerPkpStatus, sellerPkpStatus) ||
                other.sellerPkpStatus == sellerPkpStatus) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.hasCustomItem, hasCustomItem) ||
                other.hasCustomItem == hasCustomItem) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.shipments, shipments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subOrderNo,
      orderId,
      sellerId,
      status,
      sellerConfirmDeadline,
      subtotal,
      shippingTotal,
      discountSeller,
      discountPlatform,
      taxTotal,
      total,
      sellerPkpStatus,
      cancelReason,
      hasCustomItem,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(shipments));

  @override
  String toString() {
    return 'SubOrderModel(id: $id, subOrderNo: $subOrderNo, orderId: $orderId, sellerId: $sellerId, status: $status, sellerConfirmDeadline: $sellerConfirmDeadline, subtotal: $subtotal, shippingTotal: $shippingTotal, discountSeller: $discountSeller, discountPlatform: $discountPlatform, taxTotal: $taxTotal, total: $total, sellerPkpStatus: $sellerPkpStatus, cancelReason: $cancelReason, hasCustomItem: $hasCustomItem, items: $items, shipments: $shipments)';
  }
}

/// @nodoc
abstract mixin class $SubOrderModelCopyWith<$Res> {
  factory $SubOrderModelCopyWith(
          SubOrderModel value, $Res Function(SubOrderModel) _then) =
      _$SubOrderModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'sub_order_no') String? subOrderNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @StringJson() String status,
      @ServerDateTimeJson()
      @JsonKey(name: 'seller_confirm_deadline')
      DateTime? sellerConfirmDeadline,
      @IntJson() int subtotal,
      @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
      @IntJson() @JsonKey(name: 'discount_seller') int discountSeller,
      @IntJson() @JsonKey(name: 'discount_platform') int discountPlatform,
      @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
      @IntJson() int total,
      @StringOrNullJson()
      @JsonKey(name: 'seller_pkp_status_snapshot')
      String? sellerPkpStatus,
      @StringOrNullJson() @JsonKey(name: 'cancel_reason') String? cancelReason,
      @BoolJson() @JsonKey(name: 'has_custom_item') bool hasCustomItem,
      List<OrderItemModel> items,
      List<ShipmentModel> shipments});
}

/// @nodoc
class _$SubOrderModelCopyWithImpl<$Res>
    implements $SubOrderModelCopyWith<$Res> {
  _$SubOrderModelCopyWithImpl(this._self, this._then);

  final SubOrderModel _self;
  final $Res Function(SubOrderModel) _then;

  /// Create a copy of SubOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subOrderNo = freezed,
    Object? orderId = freezed,
    Object? sellerId = null,
    Object? status = null,
    Object? sellerConfirmDeadline = freezed,
    Object? subtotal = null,
    Object? shippingTotal = null,
    Object? discountSeller = null,
    Object? discountPlatform = null,
    Object? taxTotal = null,
    Object? total = null,
    Object? sellerPkpStatus = freezed,
    Object? cancelReason = freezed,
    Object? hasCustomItem = null,
    Object? items = null,
    Object? shipments = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subOrderNo: freezed == subOrderNo
          ? _self.subOrderNo
          : subOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerConfirmDeadline: freezed == sellerConfirmDeadline
          ? _self.sellerConfirmDeadline
          : sellerConfirmDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      shippingTotal: null == shippingTotal
          ? _self.shippingTotal
          : shippingTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountSeller: null == discountSeller
          ? _self.discountSeller
          : discountSeller // ignore: cast_nullable_to_non_nullable
              as int,
      discountPlatform: null == discountPlatform
          ? _self.discountPlatform
          : discountPlatform // ignore: cast_nullable_to_non_nullable
              as int,
      taxTotal: null == taxTotal
          ? _self.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      sellerPkpStatus: freezed == sellerPkpStatus
          ? _self.sellerPkpStatus
          : sellerPkpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _self.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCustomItem: null == hasCustomItem
          ? _self.hasCustomItem
          : hasCustomItem // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      shipments: null == shipments
          ? _self.shipments
          : shipments // ignore: cast_nullable_to_non_nullable
              as List<ShipmentModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubOrderModel].
extension SubOrderModelPatterns on SubOrderModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'sub_order_no')
            String? subOrderNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'seller_confirm_deadline')
            DateTime? sellerConfirmDeadline,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'discount_seller') int discountSeller,
            @IntJson() @JsonKey(name: 'discount_platform') int discountPlatform,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() int total,
            @StringOrNullJson()
            @JsonKey(name: 'seller_pkp_status_snapshot')
            String? sellerPkpStatus,
            @StringOrNullJson()
            @JsonKey(name: 'cancel_reason')
            String? cancelReason,
            @BoolJson() @JsonKey(name: 'has_custom_item') bool hasCustomItem,
            List<OrderItemModel> items,
            List<ShipmentModel> shipments)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.subOrderNo,
            _that.orderId,
            _that.sellerId,
            _that.status,
            _that.sellerConfirmDeadline,
            _that.subtotal,
            _that.shippingTotal,
            _that.discountSeller,
            _that.discountPlatform,
            _that.taxTotal,
            _that.total,
            _that.sellerPkpStatus,
            _that.cancelReason,
            _that.hasCustomItem,
            _that.items,
            _that.shipments);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'sub_order_no')
            String? subOrderNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'seller_confirm_deadline')
            DateTime? sellerConfirmDeadline,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'discount_seller') int discountSeller,
            @IntJson() @JsonKey(name: 'discount_platform') int discountPlatform,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() int total,
            @StringOrNullJson()
            @JsonKey(name: 'seller_pkp_status_snapshot')
            String? sellerPkpStatus,
            @StringOrNullJson()
            @JsonKey(name: 'cancel_reason')
            String? cancelReason,
            @BoolJson() @JsonKey(name: 'has_custom_item') bool hasCustomItem,
            List<OrderItemModel> items,
            List<ShipmentModel> shipments)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel():
        return $default(
            _that.id,
            _that.subOrderNo,
            _that.orderId,
            _that.sellerId,
            _that.status,
            _that.sellerConfirmDeadline,
            _that.subtotal,
            _that.shippingTotal,
            _that.discountSeller,
            _that.discountPlatform,
            _that.taxTotal,
            _that.total,
            _that.sellerPkpStatus,
            _that.cancelReason,
            _that.hasCustomItem,
            _that.items,
            _that.shipments);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @IntJson() int id,
            @StringOrNullJson()
            @JsonKey(name: 'sub_order_no')
            String? subOrderNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'seller_confirm_deadline')
            DateTime? sellerConfirmDeadline,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'discount_seller') int discountSeller,
            @IntJson() @JsonKey(name: 'discount_platform') int discountPlatform,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() int total,
            @StringOrNullJson()
            @JsonKey(name: 'seller_pkp_status_snapshot')
            String? sellerPkpStatus,
            @StringOrNullJson()
            @JsonKey(name: 'cancel_reason')
            String? cancelReason,
            @BoolJson() @JsonKey(name: 'has_custom_item') bool hasCustomItem,
            List<OrderItemModel> items,
            List<ShipmentModel> shipments)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubOrderModel() when $default != null:
        return $default(
            _that.id,
            _that.subOrderNo,
            _that.orderId,
            _that.sellerId,
            _that.status,
            _that.sellerConfirmDeadline,
            _that.subtotal,
            _that.shippingTotal,
            _that.discountSeller,
            _that.discountPlatform,
            _that.taxTotal,
            _that.total,
            _that.sellerPkpStatus,
            _that.cancelReason,
            _that.hasCustomItem,
            _that.items,
            _that.shipments);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubOrderModel extends SubOrderModel {
  const _SubOrderModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'sub_order_no') this.subOrderNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') this.orderId,
      @IntJson() @JsonKey(name: 'seller_id') required this.sellerId,
      @StringJson() this.status = '',
      @ServerDateTimeJson()
      @JsonKey(name: 'seller_confirm_deadline')
      this.sellerConfirmDeadline,
      @IntJson() this.subtotal = 0,
      @IntJson() @JsonKey(name: 'shipping_total') this.shippingTotal = 0,
      @IntJson() @JsonKey(name: 'discount_seller') this.discountSeller = 0,
      @IntJson() @JsonKey(name: 'discount_platform') this.discountPlatform = 0,
      @IntJson() @JsonKey(name: 'tax_total') this.taxTotal = 0,
      @IntJson() this.total = 0,
      @StringOrNullJson()
      @JsonKey(name: 'seller_pkp_status_snapshot')
      this.sellerPkpStatus,
      @StringOrNullJson() @JsonKey(name: 'cancel_reason') this.cancelReason,
      @BoolJson() @JsonKey(name: 'has_custom_item') this.hasCustomItem = false,
      final List<OrderItemModel> items = const <OrderItemModel>[],
      final List<ShipmentModel> shipments = const <ShipmentModel>[]})
      : _items = items,
        _shipments = shipments,
        super._();
  factory _SubOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SubOrderModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'sub_order_no')
  final String? subOrderNo;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @IntJson()
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @JsonKey()
  @StringJson()
  final String status;

  /// Batas toko mengonfirmasi (1×24 jam kerja). Lewat itu order auto-batal
  /// dan pembeli direfund penuh.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'seller_confirm_deadline')
  final DateTime? sellerConfirmDeadline;
  @override
  @JsonKey()
  @IntJson()
  final int subtotal;
  @override
  @IntJson()
  @JsonKey(name: 'shipping_total')
  final int shippingTotal;
  @override
  @IntJson()
  @JsonKey(name: 'discount_seller')
  final int discountSeller;
  @override
  @IntJson()
  @JsonKey(name: 'discount_platform')
  final int discountPlatform;
  @override
  @IntJson()
  @JsonKey(name: 'tax_total')
  final int taxTotal;
  @override
  @JsonKey()
  @IntJson()
  final int total;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'seller_pkp_status_snapshot')
  final String? sellerPkpStatus;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'cancel_reason')
  final String? cancelReason;

  /// Barang custom **tidak bisa dibatalkan** setelah diproses (ORD-11) —
  /// wajib diberitahukan sebelum pembeli membayar, bukan di S&K.
  @override
  @BoolJson()
  @JsonKey(name: 'has_custom_item')
  final bool hasCustomItem;
  final List<OrderItemModel> _items;
  @override
  @JsonKey()
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<ShipmentModel> _shipments;
  @override
  @JsonKey()
  List<ShipmentModel> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  /// Create a copy of SubOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubOrderModelCopyWith<_SubOrderModel> get copyWith =>
      __$SubOrderModelCopyWithImpl<_SubOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubOrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubOrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subOrderNo, subOrderNo) ||
                other.subOrderNo == subOrderNo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sellerConfirmDeadline, sellerConfirmDeadline) ||
                other.sellerConfirmDeadline == sellerConfirmDeadline) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingTotal, shippingTotal) ||
                other.shippingTotal == shippingTotal) &&
            (identical(other.discountSeller, discountSeller) ||
                other.discountSeller == discountSeller) &&
            (identical(other.discountPlatform, discountPlatform) ||
                other.discountPlatform == discountPlatform) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.sellerPkpStatus, sellerPkpStatus) ||
                other.sellerPkpStatus == sellerPkpStatus) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.hasCustomItem, hasCustomItem) ||
                other.hasCustomItem == hasCustomItem) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._shipments, _shipments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subOrderNo,
      orderId,
      sellerId,
      status,
      sellerConfirmDeadline,
      subtotal,
      shippingTotal,
      discountSeller,
      discountPlatform,
      taxTotal,
      total,
      sellerPkpStatus,
      cancelReason,
      hasCustomItem,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_shipments));

  @override
  String toString() {
    return 'SubOrderModel(id: $id, subOrderNo: $subOrderNo, orderId: $orderId, sellerId: $sellerId, status: $status, sellerConfirmDeadline: $sellerConfirmDeadline, subtotal: $subtotal, shippingTotal: $shippingTotal, discountSeller: $discountSeller, discountPlatform: $discountPlatform, taxTotal: $taxTotal, total: $total, sellerPkpStatus: $sellerPkpStatus, cancelReason: $cancelReason, hasCustomItem: $hasCustomItem, items: $items, shipments: $shipments)';
  }
}

/// @nodoc
abstract mixin class _$SubOrderModelCopyWith<$Res>
    implements $SubOrderModelCopyWith<$Res> {
  factory _$SubOrderModelCopyWith(
          _SubOrderModel value, $Res Function(_SubOrderModel) _then) =
      __$SubOrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'sub_order_no') String? subOrderNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @StringJson() String status,
      @ServerDateTimeJson()
      @JsonKey(name: 'seller_confirm_deadline')
      DateTime? sellerConfirmDeadline,
      @IntJson() int subtotal,
      @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
      @IntJson() @JsonKey(name: 'discount_seller') int discountSeller,
      @IntJson() @JsonKey(name: 'discount_platform') int discountPlatform,
      @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
      @IntJson() int total,
      @StringOrNullJson()
      @JsonKey(name: 'seller_pkp_status_snapshot')
      String? sellerPkpStatus,
      @StringOrNullJson() @JsonKey(name: 'cancel_reason') String? cancelReason,
      @BoolJson() @JsonKey(name: 'has_custom_item') bool hasCustomItem,
      List<OrderItemModel> items,
      List<ShipmentModel> shipments});
}

/// @nodoc
class __$SubOrderModelCopyWithImpl<$Res>
    implements _$SubOrderModelCopyWith<$Res> {
  __$SubOrderModelCopyWithImpl(this._self, this._then);

  final _SubOrderModel _self;
  final $Res Function(_SubOrderModel) _then;

  /// Create a copy of SubOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? subOrderNo = freezed,
    Object? orderId = freezed,
    Object? sellerId = null,
    Object? status = null,
    Object? sellerConfirmDeadline = freezed,
    Object? subtotal = null,
    Object? shippingTotal = null,
    Object? discountSeller = null,
    Object? discountPlatform = null,
    Object? taxTotal = null,
    Object? total = null,
    Object? sellerPkpStatus = freezed,
    Object? cancelReason = freezed,
    Object? hasCustomItem = null,
    Object? items = null,
    Object? shipments = null,
  }) {
    return _then(_SubOrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subOrderNo: freezed == subOrderNo
          ? _self.subOrderNo
          : subOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sellerConfirmDeadline: freezed == sellerConfirmDeadline
          ? _self.sellerConfirmDeadline
          : sellerConfirmDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      shippingTotal: null == shippingTotal
          ? _self.shippingTotal
          : shippingTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountSeller: null == discountSeller
          ? _self.discountSeller
          : discountSeller // ignore: cast_nullable_to_non_nullable
              as int,
      discountPlatform: null == discountPlatform
          ? _self.discountPlatform
          : discountPlatform // ignore: cast_nullable_to_non_nullable
              as int,
      taxTotal: null == taxTotal
          ? _self.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      sellerPkpStatus: freezed == sellerPkpStatus
          ? _self.sellerPkpStatus
          : sellerPkpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _self.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCustomItem: null == hasCustomItem
          ? _self.hasCustomItem
          : hasCustomItem // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      shipments: null == shipments
          ? _self._shipments
          : shipments // ignore: cast_nullable_to_non_nullable
              as List<ShipmentModel>,
    ));
  }
}

/// @nodoc
mixin _$OrderModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'order_no')
  String? get orderNo;
  @StringJson()
  String get status;
  @StringOrNullJson()
  @JsonKey(name: 'buyer_segment_snapshot')
  String? get buyerSegmentSnapshot;
  @IntOrNullJson()
  @JsonKey(name: 'address_id')
  int? get addressId;
  @BoolJson()
  @JsonKey(name: 'all_or_nothing')
  bool
      get allOrNothing; // Semua nominal rupiah penuh, sudah dibulatkan server. Aplikasi hanya
// memformat — tidak pernah menjumlahkan (aturan §10.4 spec).
  @IntJson()
  int get subtotal;
  @IntJson()
  @JsonKey(name: 'discount_total')
  int get discountTotal;
  @IntJson()
  @JsonKey(name: 'shipping_total')
  int get shippingTotal;
  @IntJson()
  @JsonKey(name: 'tax_total')
  int get taxTotal;
  @IntJson()
  @JsonKey(name: 'service_fee')
  int get serviceFee;
  @IntJson()
  @JsonKey(name: 'grand_total')
  int get grandTotal;

  /// Batas toko mengonfirmasi ketersediaan, untuk order di atas ambang.
  @ServerDateTimeJson()
  @JsonKey(name: 'stock_confirm_deadline')
  DateTime? get stockConfirmDeadline;

  /// Batas bayar. **Nilai ini terkena bug jam 5 jam di backend v2.2** —
  /// tampilkan absolut, jangan hitung mundur presisi.
  @ServerDateTimeJson()
  @JsonKey(name: 'payment_deadline')
  DateTime? get paymentDeadline;

  /// Order di atas ambang: metode **dipaksa** transfer bank. Sembunyikan
  /// opsi VA/QRIS/e-wallet/kartu.
  @BoolJson()
  @JsonKey(name: 'forced_bank_transfer')
  bool get forcedBankTransfer;
  @IntOrNullJson()
  @JsonKey(name: 'rfq_contract_id')
  int? get rfqContractId;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;
  List<SubOrderModel> get subOrders;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buyerSegmentSnapshot, buyerSegmentSnapshot) ||
                other.buyerSegmentSnapshot == buyerSegmentSnapshot) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.allOrNothing, allOrNothing) ||
                other.allOrNothing == allOrNothing) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            (identical(other.shippingTotal, shippingTotal) ||
                other.shippingTotal == shippingTotal) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal) &&
            (identical(other.serviceFee, serviceFee) ||
                other.serviceFee == serviceFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.stockConfirmDeadline, stockConfirmDeadline) ||
                other.stockConfirmDeadline == stockConfirmDeadline) &&
            (identical(other.paymentDeadline, paymentDeadline) ||
                other.paymentDeadline == paymentDeadline) &&
            (identical(other.forcedBankTransfer, forcedBankTransfer) ||
                other.forcedBankTransfer == forcedBankTransfer) &&
            (identical(other.rfqContractId, rfqContractId) ||
                other.rfqContractId == rfqContractId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality().equals(other.subOrders, subOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNo,
      status,
      buyerSegmentSnapshot,
      addressId,
      allOrNothing,
      subtotal,
      discountTotal,
      shippingTotal,
      taxTotal,
      serviceFee,
      grandTotal,
      stockConfirmDeadline,
      paymentDeadline,
      forcedBankTransfer,
      rfqContractId,
      createdDate,
      const DeepCollectionEquality().hash(subOrders));

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNo: $orderNo, status: $status, buyerSegmentSnapshot: $buyerSegmentSnapshot, addressId: $addressId, allOrNothing: $allOrNothing, subtotal: $subtotal, discountTotal: $discountTotal, shippingTotal: $shippingTotal, taxTotal: $taxTotal, serviceFee: $serviceFee, grandTotal: $grandTotal, stockConfirmDeadline: $stockConfirmDeadline, paymentDeadline: $paymentDeadline, forcedBankTransfer: $forcedBankTransfer, rfqContractId: $rfqContractId, createdDate: $createdDate, subOrders: $subOrders)';
  }
}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
      @StringJson() String status,
      @StringOrNullJson()
      @JsonKey(name: 'buyer_segment_snapshot')
      String? buyerSegmentSnapshot,
      @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,
      @BoolJson() @JsonKey(name: 'all_or_nothing') bool allOrNothing,
      @IntJson() int subtotal,
      @IntJson() @JsonKey(name: 'discount_total') int discountTotal,
      @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
      @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
      @IntJson() @JsonKey(name: 'service_fee') int serviceFee,
      @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
      @ServerDateTimeJson()
      @JsonKey(name: 'stock_confirm_deadline')
      DateTime? stockConfirmDeadline,
      @ServerDateTimeJson()
      @JsonKey(name: 'payment_deadline')
      DateTime? paymentDeadline,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      bool forcedBankTransfer,
      @IntOrNullJson() @JsonKey(name: 'rfq_contract_id') int? rfqContractId,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      List<SubOrderModel> subOrders});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNo = freezed,
    Object? status = null,
    Object? buyerSegmentSnapshot = freezed,
    Object? addressId = freezed,
    Object? allOrNothing = null,
    Object? subtotal = null,
    Object? discountTotal = null,
    Object? shippingTotal = null,
    Object? taxTotal = null,
    Object? serviceFee = null,
    Object? grandTotal = null,
    Object? stockConfirmDeadline = freezed,
    Object? paymentDeadline = freezed,
    Object? forcedBankTransfer = null,
    Object? rfqContractId = freezed,
    Object? createdDate = freezed,
    Object? subOrders = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderNo: freezed == orderNo
          ? _self.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      buyerSegmentSnapshot: freezed == buyerSegmentSnapshot
          ? _self.buyerSegmentSnapshot
          : buyerSegmentSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: freezed == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      allOrNothing: null == allOrNothing
          ? _self.allOrNothing
          : allOrNothing // ignore: cast_nullable_to_non_nullable
              as bool,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _self.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      shippingTotal: null == shippingTotal
          ? _self.shippingTotal
          : shippingTotal // ignore: cast_nullable_to_non_nullable
              as int,
      taxTotal: null == taxTotal
          ? _self.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      serviceFee: null == serviceFee
          ? _self.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      stockConfirmDeadline: freezed == stockConfirmDeadline
          ? _self.stockConfirmDeadline
          : stockConfirmDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentDeadline: freezed == paymentDeadline
          ? _self.paymentDeadline
          : paymentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      forcedBankTransfer: null == forcedBankTransfer
          ? _self.forcedBankTransfer
          : forcedBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      rfqContractId: freezed == rfqContractId
          ? _self.rfqContractId
          : rfqContractId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subOrders: null == subOrders
          ? _self.subOrders
          : subOrders // ignore: cast_nullable_to_non_nullable
              as List<SubOrderModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment_snapshot')
            String? buyerSegmentSnapshot,
            @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,
            @BoolJson() @JsonKey(name: 'all_or_nothing') bool allOrNothing,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'discount_total') int discountTotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() @JsonKey(name: 'service_fee') int serviceFee,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @ServerDateTimeJson()
            @JsonKey(name: 'stock_confirm_deadline')
            DateTime? stockConfirmDeadline,
            @ServerDateTimeJson()
            @JsonKey(name: 'payment_deadline')
            DateTime? paymentDeadline,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @IntOrNullJson()
            @JsonKey(name: 'rfq_contract_id')
            int? rfqContractId,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            List<SubOrderModel> subOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNo,
            _that.status,
            _that.buyerSegmentSnapshot,
            _that.addressId,
            _that.allOrNothing,
            _that.subtotal,
            _that.discountTotal,
            _that.shippingTotal,
            _that.taxTotal,
            _that.serviceFee,
            _that.grandTotal,
            _that.stockConfirmDeadline,
            _that.paymentDeadline,
            _that.forcedBankTransfer,
            _that.rfqContractId,
            _that.createdDate,
            _that.subOrders);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @IntJson() int id,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment_snapshot')
            String? buyerSegmentSnapshot,
            @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,
            @BoolJson() @JsonKey(name: 'all_or_nothing') bool allOrNothing,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'discount_total') int discountTotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() @JsonKey(name: 'service_fee') int serviceFee,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @ServerDateTimeJson()
            @JsonKey(name: 'stock_confirm_deadline')
            DateTime? stockConfirmDeadline,
            @ServerDateTimeJson()
            @JsonKey(name: 'payment_deadline')
            DateTime? paymentDeadline,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @IntOrNullJson()
            @JsonKey(name: 'rfq_contract_id')
            int? rfqContractId,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            List<SubOrderModel> subOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(
            _that.id,
            _that.orderNo,
            _that.status,
            _that.buyerSegmentSnapshot,
            _that.addressId,
            _that.allOrNothing,
            _that.subtotal,
            _that.discountTotal,
            _that.shippingTotal,
            _that.taxTotal,
            _that.serviceFee,
            _that.grandTotal,
            _that.stockConfirmDeadline,
            _that.paymentDeadline,
            _that.forcedBankTransfer,
            _that.rfqContractId,
            _that.createdDate,
            _that.subOrders);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @IntJson() int id,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment_snapshot')
            String? buyerSegmentSnapshot,
            @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,
            @BoolJson() @JsonKey(name: 'all_or_nothing') bool allOrNothing,
            @IntJson() int subtotal,
            @IntJson() @JsonKey(name: 'discount_total') int discountTotal,
            @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
            @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
            @IntJson() @JsonKey(name: 'service_fee') int serviceFee,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @ServerDateTimeJson()
            @JsonKey(name: 'stock_confirm_deadline')
            DateTime? stockConfirmDeadline,
            @ServerDateTimeJson()
            @JsonKey(name: 'payment_deadline')
            DateTime? paymentDeadline,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @IntOrNullJson()
            @JsonKey(name: 'rfq_contract_id')
            int? rfqContractId,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            List<SubOrderModel> subOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.id,
            _that.orderNo,
            _that.status,
            _that.buyerSegmentSnapshot,
            _that.addressId,
            _that.allOrNothing,
            _that.subtotal,
            _that.discountTotal,
            _that.shippingTotal,
            _that.taxTotal,
            _that.serviceFee,
            _that.grandTotal,
            _that.stockConfirmDeadline,
            _that.paymentDeadline,
            _that.forcedBankTransfer,
            _that.rfqContractId,
            _that.createdDate,
            _that.subOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrderModel extends OrderModel {
  const _OrderModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'order_no') this.orderNo,
      @StringJson() this.status = '',
      @StringOrNullJson()
      @JsonKey(name: 'buyer_segment_snapshot')
      this.buyerSegmentSnapshot,
      @IntOrNullJson() @JsonKey(name: 'address_id') this.addressId,
      @BoolJson() @JsonKey(name: 'all_or_nothing') this.allOrNothing = false,
      @IntJson() this.subtotal = 0,
      @IntJson() @JsonKey(name: 'discount_total') this.discountTotal = 0,
      @IntJson() @JsonKey(name: 'shipping_total') this.shippingTotal = 0,
      @IntJson() @JsonKey(name: 'tax_total') this.taxTotal = 0,
      @IntJson() @JsonKey(name: 'service_fee') this.serviceFee = 0,
      @IntJson() @JsonKey(name: 'grand_total') this.grandTotal = 0,
      @ServerDateTimeJson()
      @JsonKey(name: 'stock_confirm_deadline')
      this.stockConfirmDeadline,
      @ServerDateTimeJson()
      @JsonKey(name: 'payment_deadline')
      this.paymentDeadline,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      this.forcedBankTransfer = false,
      @IntOrNullJson() @JsonKey(name: 'rfq_contract_id') this.rfqContractId,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate,
      final List<SubOrderModel> subOrders = const <SubOrderModel>[]})
      : _subOrders = subOrders,
        super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'order_no')
  final String? orderNo;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'buyer_segment_snapshot')
  final String? buyerSegmentSnapshot;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'address_id')
  final int? addressId;
  @override
  @BoolJson()
  @JsonKey(name: 'all_or_nothing')
  final bool allOrNothing;
// Semua nominal rupiah penuh, sudah dibulatkan server. Aplikasi hanya
// memformat — tidak pernah menjumlahkan (aturan §10.4 spec).
  @override
  @JsonKey()
  @IntJson()
  final int subtotal;
  @override
  @IntJson()
  @JsonKey(name: 'discount_total')
  final int discountTotal;
  @override
  @IntJson()
  @JsonKey(name: 'shipping_total')
  final int shippingTotal;
  @override
  @IntJson()
  @JsonKey(name: 'tax_total')
  final int taxTotal;
  @override
  @IntJson()
  @JsonKey(name: 'service_fee')
  final int serviceFee;
  @override
  @IntJson()
  @JsonKey(name: 'grand_total')
  final int grandTotal;

  /// Batas toko mengonfirmasi ketersediaan, untuk order di atas ambang.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'stock_confirm_deadline')
  final DateTime? stockConfirmDeadline;

  /// Batas bayar. **Nilai ini terkena bug jam 5 jam di backend v2.2** —
  /// tampilkan absolut, jangan hitung mundur presisi.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'payment_deadline')
  final DateTime? paymentDeadline;

  /// Order di atas ambang: metode **dipaksa** transfer bank. Sembunyikan
  /// opsi VA/QRIS/e-wallet/kartu.
  @override
  @BoolJson()
  @JsonKey(name: 'forced_bank_transfer')
  final bool forcedBankTransfer;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'rfq_contract_id')
  final int? rfqContractId;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;
  final List<SubOrderModel> _subOrders;
  @override
  @JsonKey()
  List<SubOrderModel> get subOrders {
    if (_subOrders is EqualUnmodifiableListView) return _subOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subOrders);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buyerSegmentSnapshot, buyerSegmentSnapshot) ||
                other.buyerSegmentSnapshot == buyerSegmentSnapshot) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.allOrNothing, allOrNothing) ||
                other.allOrNothing == allOrNothing) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            (identical(other.shippingTotal, shippingTotal) ||
                other.shippingTotal == shippingTotal) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal) &&
            (identical(other.serviceFee, serviceFee) ||
                other.serviceFee == serviceFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.stockConfirmDeadline, stockConfirmDeadline) ||
                other.stockConfirmDeadline == stockConfirmDeadline) &&
            (identical(other.paymentDeadline, paymentDeadline) ||
                other.paymentDeadline == paymentDeadline) &&
            (identical(other.forcedBankTransfer, forcedBankTransfer) ||
                other.forcedBankTransfer == forcedBankTransfer) &&
            (identical(other.rfqContractId, rfqContractId) ||
                other.rfqContractId == rfqContractId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality()
                .equals(other._subOrders, _subOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNo,
      status,
      buyerSegmentSnapshot,
      addressId,
      allOrNothing,
      subtotal,
      discountTotal,
      shippingTotal,
      taxTotal,
      serviceFee,
      grandTotal,
      stockConfirmDeadline,
      paymentDeadline,
      forcedBankTransfer,
      rfqContractId,
      createdDate,
      const DeepCollectionEquality().hash(_subOrders));

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNo: $orderNo, status: $status, buyerSegmentSnapshot: $buyerSegmentSnapshot, addressId: $addressId, allOrNothing: $allOrNothing, subtotal: $subtotal, discountTotal: $discountTotal, shippingTotal: $shippingTotal, taxTotal: $taxTotal, serviceFee: $serviceFee, grandTotal: $grandTotal, stockConfirmDeadline: $stockConfirmDeadline, paymentDeadline: $paymentDeadline, forcedBankTransfer: $forcedBankTransfer, rfqContractId: $rfqContractId, createdDate: $createdDate, subOrders: $subOrders)';
  }
}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
      @StringJson() String status,
      @StringOrNullJson()
      @JsonKey(name: 'buyer_segment_snapshot')
      String? buyerSegmentSnapshot,
      @IntOrNullJson() @JsonKey(name: 'address_id') int? addressId,
      @BoolJson() @JsonKey(name: 'all_or_nothing') bool allOrNothing,
      @IntJson() int subtotal,
      @IntJson() @JsonKey(name: 'discount_total') int discountTotal,
      @IntJson() @JsonKey(name: 'shipping_total') int shippingTotal,
      @IntJson() @JsonKey(name: 'tax_total') int taxTotal,
      @IntJson() @JsonKey(name: 'service_fee') int serviceFee,
      @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
      @ServerDateTimeJson()
      @JsonKey(name: 'stock_confirm_deadline')
      DateTime? stockConfirmDeadline,
      @ServerDateTimeJson()
      @JsonKey(name: 'payment_deadline')
      DateTime? paymentDeadline,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      bool forcedBankTransfer,
      @IntOrNullJson() @JsonKey(name: 'rfq_contract_id') int? rfqContractId,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      List<SubOrderModel> subOrders});
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderNo = freezed,
    Object? status = null,
    Object? buyerSegmentSnapshot = freezed,
    Object? addressId = freezed,
    Object? allOrNothing = null,
    Object? subtotal = null,
    Object? discountTotal = null,
    Object? shippingTotal = null,
    Object? taxTotal = null,
    Object? serviceFee = null,
    Object? grandTotal = null,
    Object? stockConfirmDeadline = freezed,
    Object? paymentDeadline = freezed,
    Object? forcedBankTransfer = null,
    Object? rfqContractId = freezed,
    Object? createdDate = freezed,
    Object? subOrders = null,
  }) {
    return _then(_OrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderNo: freezed == orderNo
          ? _self.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      buyerSegmentSnapshot: freezed == buyerSegmentSnapshot
          ? _self.buyerSegmentSnapshot
          : buyerSegmentSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: freezed == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      allOrNothing: null == allOrNothing
          ? _self.allOrNothing
          : allOrNothing // ignore: cast_nullable_to_non_nullable
              as bool,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountTotal: null == discountTotal
          ? _self.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int,
      shippingTotal: null == shippingTotal
          ? _self.shippingTotal
          : shippingTotal // ignore: cast_nullable_to_non_nullable
              as int,
      taxTotal: null == taxTotal
          ? _self.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as int,
      serviceFee: null == serviceFee
          ? _self.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      stockConfirmDeadline: freezed == stockConfirmDeadline
          ? _self.stockConfirmDeadline
          : stockConfirmDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentDeadline: freezed == paymentDeadline
          ? _self.paymentDeadline
          : paymentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      forcedBankTransfer: null == forcedBankTransfer
          ? _self.forcedBankTransfer
          : forcedBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      rfqContractId: freezed == rfqContractId
          ? _self.rfqContractId
          : rfqContractId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subOrders: null == subOrders
          ? _self._subOrders
          : subOrders // ignore: cast_nullable_to_non_nullable
              as List<SubOrderModel>,
    ));
  }
}

/// @nodoc
mixin _$CheckoutResultModel {
  @IntJson()
  @JsonKey(name: 'order_id')
  int get orderId;
  @StringOrNullJson()
  @JsonKey(name: 'order_no')
  String? get orderNo;
  @StringJson()
  String get status;
  @IntJson()
  @JsonKey(name: 'grand_total')
  int get grandTotal;
  @BoolJson()
  @JsonKey(name: 'forced_bank_transfer')
  bool get forcedBankTransfer;
  @JsonKey(name: 'sub_order_ids')
  List<int> get subOrderIds;

  /// Create a copy of CheckoutResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutResultModelCopyWith<CheckoutResultModel> get copyWith =>
      _$CheckoutResultModelCopyWithImpl<CheckoutResultModel>(
          this as CheckoutResultModel, _$identity);

  /// Serializes this CheckoutResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutResultModel &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.forcedBankTransfer, forcedBankTransfer) ||
                other.forcedBankTransfer == forcedBankTransfer) &&
            const DeepCollectionEquality()
                .equals(other.subOrderIds, subOrderIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderNo,
      status,
      grandTotal,
      forcedBankTransfer,
      const DeepCollectionEquality().hash(subOrderIds));

  @override
  String toString() {
    return 'CheckoutResultModel(orderId: $orderId, orderNo: $orderNo, status: $status, grandTotal: $grandTotal, forcedBankTransfer: $forcedBankTransfer, subOrderIds: $subOrderIds)';
  }
}

/// @nodoc
abstract mixin class $CheckoutResultModelCopyWith<$Res> {
  factory $CheckoutResultModelCopyWith(
          CheckoutResultModel value, $Res Function(CheckoutResultModel) _then) =
      _$CheckoutResultModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'order_id') int orderId,
      @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
      @StringJson() String status,
      @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      bool forcedBankTransfer,
      @JsonKey(name: 'sub_order_ids') List<int> subOrderIds});
}

/// @nodoc
class _$CheckoutResultModelCopyWithImpl<$Res>
    implements $CheckoutResultModelCopyWith<$Res> {
  _$CheckoutResultModelCopyWithImpl(this._self, this._then);

  final CheckoutResultModel _self;
  final $Res Function(CheckoutResultModel) _then;

  /// Create a copy of CheckoutResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNo = freezed,
    Object? status = null,
    Object? grandTotal = null,
    Object? forcedBankTransfer = null,
    Object? subOrderIds = null,
  }) {
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderNo: freezed == orderNo
          ? _self.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      forcedBankTransfer: null == forcedBankTransfer
          ? _self.forcedBankTransfer
          : forcedBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      subOrderIds: null == subOrderIds
          ? _self.subOrderIds
          : subOrderIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CheckoutResultModel].
extension CheckoutResultModelPatterns on CheckoutResultModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckoutResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckoutResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckoutResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @IntJson() @JsonKey(name: 'order_id') int orderId,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @JsonKey(name: 'sub_order_ids') List<int> subOrderIds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel() when $default != null:
        return $default(_that.orderId, _that.orderNo, _that.status,
            _that.grandTotal, _that.forcedBankTransfer, _that.subOrderIds);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @IntJson() @JsonKey(name: 'order_id') int orderId,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @JsonKey(name: 'sub_order_ids') List<int> subOrderIds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel():
        return $default(_that.orderId, _that.orderNo, _that.status,
            _that.grandTotal, _that.forcedBankTransfer, _that.subOrderIds);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @IntJson() @JsonKey(name: 'order_id') int orderId,
            @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
            @StringJson() String status,
            @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
            @BoolJson()
            @JsonKey(name: 'forced_bank_transfer')
            bool forcedBankTransfer,
            @JsonKey(name: 'sub_order_ids') List<int> subOrderIds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutResultModel() when $default != null:
        return $default(_that.orderId, _that.orderNo, _that.status,
            _that.grandTotal, _that.forcedBankTransfer, _that.subOrderIds);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CheckoutResultModel extends CheckoutResultModel {
  const _CheckoutResultModel(
      {@IntJson() @JsonKey(name: 'order_id') required this.orderId,
      @StringOrNullJson() @JsonKey(name: 'order_no') this.orderNo,
      @StringJson() this.status = '',
      @IntJson() @JsonKey(name: 'grand_total') this.grandTotal = 0,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      this.forcedBankTransfer = false,
      @JsonKey(name: 'sub_order_ids')
      final List<int> subOrderIds = const <int>[]})
      : _subOrderIds = subOrderIds,
        super._();
  factory _CheckoutResultModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResultModelFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'order_id')
  final int orderId;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'order_no')
  final String? orderNo;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @IntJson()
  @JsonKey(name: 'grand_total')
  final int grandTotal;
  @override
  @BoolJson()
  @JsonKey(name: 'forced_bank_transfer')
  final bool forcedBankTransfer;
  final List<int> _subOrderIds;
  @override
  @JsonKey(name: 'sub_order_ids')
  List<int> get subOrderIds {
    if (_subOrderIds is EqualUnmodifiableListView) return _subOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subOrderIds);
  }

  /// Create a copy of CheckoutResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutResultModelCopyWith<_CheckoutResultModel> get copyWith =>
      __$CheckoutResultModelCopyWithImpl<_CheckoutResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckoutResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutResultModel &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.forcedBankTransfer, forcedBankTransfer) ||
                other.forcedBankTransfer == forcedBankTransfer) &&
            const DeepCollectionEquality()
                .equals(other._subOrderIds, _subOrderIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderNo,
      status,
      grandTotal,
      forcedBankTransfer,
      const DeepCollectionEquality().hash(_subOrderIds));

  @override
  String toString() {
    return 'CheckoutResultModel(orderId: $orderId, orderNo: $orderNo, status: $status, grandTotal: $grandTotal, forcedBankTransfer: $forcedBankTransfer, subOrderIds: $subOrderIds)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutResultModelCopyWith<$Res>
    implements $CheckoutResultModelCopyWith<$Res> {
  factory _$CheckoutResultModelCopyWith(_CheckoutResultModel value,
          $Res Function(_CheckoutResultModel) _then) =
      __$CheckoutResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'order_id') int orderId,
      @StringOrNullJson() @JsonKey(name: 'order_no') String? orderNo,
      @StringJson() String status,
      @IntJson() @JsonKey(name: 'grand_total') int grandTotal,
      @BoolJson()
      @JsonKey(name: 'forced_bank_transfer')
      bool forcedBankTransfer,
      @JsonKey(name: 'sub_order_ids') List<int> subOrderIds});
}

/// @nodoc
class __$CheckoutResultModelCopyWithImpl<$Res>
    implements _$CheckoutResultModelCopyWith<$Res> {
  __$CheckoutResultModelCopyWithImpl(this._self, this._then);

  final _CheckoutResultModel _self;
  final $Res Function(_CheckoutResultModel) _then;

  /// Create a copy of CheckoutResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? orderNo = freezed,
    Object? status = null,
    Object? grandTotal = null,
    Object? forcedBankTransfer = null,
    Object? subOrderIds = null,
  }) {
    return _then(_CheckoutResultModel(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderNo: freezed == orderNo
          ? _self.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      forcedBankTransfer: null == forcedBankTransfer
          ? _self.forcedBankTransfer
          : forcedBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool,
      subOrderIds: null == subOrderIds
          ? _self._subOrderIds
          : subOrderIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on
