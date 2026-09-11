// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemModel {
  @IntJson()
  int get id;
  @IntJson()
  @JsonKey(name: 'cart_id')
  int get cartId;
  @IntJson()
  @JsonKey(name: 'offer_id')
  int get offerId;
  @IntOrNullJson()
  @JsonKey(name: 'unit_id')
  int? get unitId;

  /// Berdesimal (`"60.0000"`) — pasir per m³ dan cat per liter bisa pecahan.
  @DoubleJson()
  double get qty;
  @IntJson()
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @StringOrNullJson()
  @JsonKey(name: 'offer_status')
  String? get offerStatus;
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  double get minOrderQty;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      _$CartItemModelCopyWithImpl<CartItemModel>(
          this as CartItemModel, _$identity);

  /// Serializes this CartItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.offerStatus, offerStatus) ||
                other.offerStatus == offerStatus) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cartId, offerId, unitId, qty,
      sellerId, offerStatus, minOrderQty, createdDate);

  @override
  String toString() {
    return 'CartItemModel(id: $id, cartId: $cartId, offerId: $offerId, unitId: $unitId, qty: $qty, sellerId: $sellerId, offerStatus: $offerStatus, minOrderQty: $minOrderQty, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
          CartItemModel value, $Res Function(CartItemModel) _then) =
      _$CartItemModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'cart_id') int cartId,
      @IntJson() @JsonKey(name: 'offer_id') int offerId,
      @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,
      @DoubleJson() double qty,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._self, this._then);

  final CartItemModel _self;
  final $Res Function(CartItemModel) _then;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartId = null,
    Object? offerId = null,
    Object? unitId = freezed,
    Object? qty = null,
    Object? sellerId = null,
    Object? offerStatus = freezed,
    Object? minOrderQty = null,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cartId: null == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: freezed == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      offerStatus: freezed == offerStatus
          ? _self.offerStatus
          : offerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartItemModel].
extension CartItemModelPatterns on CartItemModel {
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
    TResult Function(_CartItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
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
    TResult Function(_CartItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel():
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
    TResult? Function(_CartItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
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
            @IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
        return $default(
            _that.id,
            _that.cartId,
            _that.offerId,
            _that.unitId,
            _that.qty,
            _that.sellerId,
            _that.offerStatus,
            _that.minOrderQty,
            _that.createdDate);
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
            @IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel():
        return $default(
            _that.id,
            _that.cartId,
            _that.offerId,
            _that.unitId,
            _that.qty,
            _that.sellerId,
            _that.offerStatus,
            _that.minOrderQty,
            _that.createdDate);
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
            @IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,
            @DoubleJson() double qty,
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
        return $default(
            _that.id,
            _that.cartId,
            _that.offerId,
            _that.unitId,
            _that.qty,
            _that.sellerId,
            _that.offerStatus,
            _that.minOrderQty,
            _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CartItemModel extends CartItemModel {
  const _CartItemModel(
      {@IntJson() required this.id,
      @IntJson() @JsonKey(name: 'cart_id') required this.cartId,
      @IntJson() @JsonKey(name: 'offer_id') required this.offerId,
      @IntOrNullJson() @JsonKey(name: 'unit_id') this.unitId,
      @DoubleJson() this.qty = 0,
      @IntJson() @JsonKey(name: 'seller_id') required this.sellerId,
      @StringOrNullJson() @JsonKey(name: 'offer_status') this.offerStatus,
      @DoubleJson() @JsonKey(name: 'min_order_qty') this.minOrderQty = 0,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : super._();
  factory _CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntJson()
  @JsonKey(name: 'cart_id')
  final int cartId;
  @override
  @IntJson()
  @JsonKey(name: 'offer_id')
  final int offerId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'unit_id')
  final int? unitId;

  /// Berdesimal (`"60.0000"`) — pasir per m³ dan cat per liter bisa pecahan.
  @override
  @JsonKey()
  @DoubleJson()
  final double qty;
  @override
  @IntJson()
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'offer_status')
  final String? offerStatus;
  @override
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  final double minOrderQty;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartItemModelCopyWith<_CartItemModel> get copyWith =>
      __$CartItemModelCopyWithImpl<_CartItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.offerStatus, offerStatus) ||
                other.offerStatus == offerStatus) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cartId, offerId, unitId, qty,
      sellerId, offerStatus, minOrderQty, createdDate);

  @override
  String toString() {
    return 'CartItemModel(id: $id, cartId: $cartId, offerId: $offerId, unitId: $unitId, qty: $qty, sellerId: $sellerId, offerStatus: $offerStatus, minOrderQty: $minOrderQty, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$CartItemModelCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$CartItemModelCopyWith(
          _CartItemModel value, $Res Function(_CartItemModel) _then) =
      __$CartItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'cart_id') int cartId,
      @IntJson() @JsonKey(name: 'offer_id') int offerId,
      @IntOrNullJson() @JsonKey(name: 'unit_id') int? unitId,
      @DoubleJson() double qty,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$CartItemModelCopyWithImpl<$Res>
    implements _$CartItemModelCopyWith<$Res> {
  __$CartItemModelCopyWithImpl(this._self, this._then);

  final _CartItemModel _self;
  final $Res Function(_CartItemModel) _then;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? cartId = null,
    Object? offerId = null,
    Object? unitId = freezed,
    Object? qty = null,
    Object? sellerId = null,
    Object? offerStatus = freezed,
    Object? minOrderQty = null,
    Object? createdDate = freezed,
  }) {
    return _then(_CartItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cartId: null == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: freezed == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      offerStatus: freezed == offerStatus
          ? _self.offerStatus
          : offerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$CartModel {
  @IntOrNullJson()
  @JsonKey(name: 'cart_id')
  int? get cartId;
  @GroupedBySellerConverter()
  @JsonKey(name: 'grouped_by_seller')
  Map<int, List<CartItemModel>> get groupedBySeller;

  /// Voucher yang sedang menempel. Di sini syaratnya lengkap tapi
  /// **tanpa** `discount_amount_preview` — angka potongan hanya dikirim
  /// oleh `POST /cart/voucher` saat dipasang.
  List<CartVoucherModel> get vouchers;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartModelCopyWith<CartModel> get copyWith =>
      _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartModel &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            const DeepCollectionEquality()
                .equals(other.groupedBySeller, groupedBySeller) &&
            const DeepCollectionEquality().equals(other.vouchers, vouchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartId,
      const DeepCollectionEquality().hash(groupedBySeller),
      const DeepCollectionEquality().hash(vouchers));

  @override
  String toString() {
    return 'CartModel(cartId: $cartId, groupedBySeller: $groupedBySeller, vouchers: $vouchers)';
  }
}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) =
      _$CartModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
      @GroupedBySellerConverter()
      @JsonKey(name: 'grouped_by_seller')
      Map<int, List<CartItemModel>> groupedBySeller,
      List<CartVoucherModel> vouchers});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res> implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
    Object? groupedBySeller = null,
    Object? vouchers = null,
  }) {
    return _then(_self.copyWith(
      cartId: freezed == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupedBySeller: null == groupedBySeller
          ? _self.groupedBySeller
          : groupedBySeller // ignore: cast_nullable_to_non_nullable
              as Map<int, List<CartItemModel>>,
      vouchers: null == vouchers
          ? _self.vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<CartVoucherModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartModel].
extension CartModelPatterns on CartModel {
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
    TResult Function(_CartModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
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
    TResult Function(_CartModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartModel():
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
    TResult? Function(_CartModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
            @GroupedBySellerConverter()
            @JsonKey(name: 'grouped_by_seller')
            Map<int, List<CartItemModel>> groupedBySeller,
            List<CartVoucherModel> vouchers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(_that.cartId, _that.groupedBySeller, _that.vouchers);
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
            @IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
            @GroupedBySellerConverter()
            @JsonKey(name: 'grouped_by_seller')
            Map<int, List<CartItemModel>> groupedBySeller,
            List<CartVoucherModel> vouchers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartModel():
        return $default(_that.cartId, _that.groupedBySeller, _that.vouchers);
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
            @IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
            @GroupedBySellerConverter()
            @JsonKey(name: 'grouped_by_seller')
            Map<int, List<CartItemModel>> groupedBySeller,
            List<CartVoucherModel> vouchers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(_that.cartId, _that.groupedBySeller, _that.vouchers);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CartModel extends CartModel {
  const _CartModel(
      {@IntOrNullJson() @JsonKey(name: 'cart_id') this.cartId,
      @GroupedBySellerConverter()
      @JsonKey(name: 'grouped_by_seller')
      final Map<int, List<CartItemModel>> groupedBySeller =
          const <int, List<CartItemModel>>{},
      final List<CartVoucherModel> vouchers = const <CartVoucherModel>[]})
      : _groupedBySeller = groupedBySeller,
        _vouchers = vouchers,
        super._();
  factory _CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  @override
  @IntOrNullJson()
  @JsonKey(name: 'cart_id')
  final int? cartId;
  final Map<int, List<CartItemModel>> _groupedBySeller;
  @override
  @GroupedBySellerConverter()
  @JsonKey(name: 'grouped_by_seller')
  Map<int, List<CartItemModel>> get groupedBySeller {
    if (_groupedBySeller is EqualUnmodifiableMapView) return _groupedBySeller;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groupedBySeller);
  }

  /// Voucher yang sedang menempel. Di sini syaratnya lengkap tapi
  /// **tanpa** `discount_amount_preview` — angka potongan hanya dikirim
  /// oleh `POST /cart/voucher` saat dipasang.
  final List<CartVoucherModel> _vouchers;

  /// Voucher yang sedang menempel. Di sini syaratnya lengkap tapi
  /// **tanpa** `discount_amount_preview` — angka potongan hanya dikirim
  /// oleh `POST /cart/voucher` saat dipasang.
  @override
  @JsonKey()
  List<CartVoucherModel> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartModelCopyWith<_CartModel> get copyWith =>
      __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModel &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            const DeepCollectionEquality()
                .equals(other._groupedBySeller, _groupedBySeller) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartId,
      const DeepCollectionEquality().hash(_groupedBySeller),
      const DeepCollectionEquality().hash(_vouchers));

  @override
  String toString() {
    return 'CartModel(cartId: $cartId, groupedBySeller: $groupedBySeller, vouchers: $vouchers)';
  }
}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(
          _CartModel value, $Res Function(_CartModel) _then) =
      __$CartModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'cart_id') int? cartId,
      @GroupedBySellerConverter()
      @JsonKey(name: 'grouped_by_seller')
      Map<int, List<CartItemModel>> groupedBySeller,
      List<CartVoucherModel> vouchers});
}

/// @nodoc
class __$CartModelCopyWithImpl<$Res> implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cartId = freezed,
    Object? groupedBySeller = null,
    Object? vouchers = null,
  }) {
    return _then(_CartModel(
      cartId: freezed == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupedBySeller: null == groupedBySeller
          ? _self._groupedBySeller
          : groupedBySeller // ignore: cast_nullable_to_non_nullable
              as Map<int, List<CartItemModel>>,
      vouchers: null == vouchers
          ? _self._vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<CartVoucherModel>,
    ));
  }
}

// dart format on
