// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartLine {
  CartItemModel get item;
  OfferModel? get offer;
  SkuBriefModel? get sku;

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartLineCopyWith<CartLine> get copyWith =>
      _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartLine &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            (identical(other.sku, sku) || other.sku == sku));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, offer, sku);

  @override
  String toString() {
    return 'CartLine(item: $item, offer: $offer, sku: $sku)';
  }
}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res> {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) =
      _$CartLineCopyWithImpl;
  @useResult
  $Res call({CartItemModel item, OfferModel? offer, SkuBriefModel? sku});

  $CartItemModelCopyWith<$Res> get item;
  $OfferModelCopyWith<$Res>? get offer;
  $SkuBriefModelCopyWith<$Res>? get sku;
}

/// @nodoc
class _$CartLineCopyWithImpl<$Res> implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? offer = freezed,
    Object? sku = freezed,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItemModel,
      offer: freezed == offer
          ? _self.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as SkuBriefModel?,
    ));
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemModelCopyWith<$Res> get item {
    return $CartItemModelCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
      return _then(_self.copyWith(offer: value));
    });
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuBriefModelCopyWith<$Res>? get sku {
    if (_self.sku == null) {
      return null;
    }

    return $SkuBriefModelCopyWith<$Res>(_self.sku!, (value) {
      return _then(_self.copyWith(sku: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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
    TResult Function(_CartLine value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartLine() when $default != null:
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
    TResult Function(_CartLine value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartLine():
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
    TResult? Function(_CartLine value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartLine() when $default != null:
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
    TResult Function(CartItemModel item, OfferModel? offer, SkuBriefModel? sku)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartLine() when $default != null:
        return $default(_that.item, _that.offer, _that.sku);
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
    TResult Function(CartItemModel item, OfferModel? offer, SkuBriefModel? sku)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartLine():
        return $default(_that.item, _that.offer, _that.sku);
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
            CartItemModel item, OfferModel? offer, SkuBriefModel? sku)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartLine() when $default != null:
        return $default(_that.item, _that.offer, _that.sku);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartLine extends CartLine {
  const _CartLine({required this.item, this.offer, this.sku}) : super._();

  @override
  final CartItemModel item;
  @override
  final OfferModel? offer;
  @override
  final SkuBriefModel? sku;

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartLineCopyWith<_CartLine> get copyWith =>
      __$CartLineCopyWithImpl<_CartLine>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartLine &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            (identical(other.sku, sku) || other.sku == sku));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, offer, sku);

  @override
  String toString() {
    return 'CartLine(item: $item, offer: $offer, sku: $sku)';
  }
}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res>
    implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) =
      __$CartLineCopyWithImpl;
  @override
  @useResult
  $Res call({CartItemModel item, OfferModel? offer, SkuBriefModel? sku});

  @override
  $CartItemModelCopyWith<$Res> get item;
  @override
  $OfferModelCopyWith<$Res>? get offer;
  @override
  $SkuBriefModelCopyWith<$Res>? get sku;
}

/// @nodoc
class __$CartLineCopyWithImpl<$Res> implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? offer = freezed,
    Object? sku = freezed,
  }) {
    return _then(_CartLine(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItemModel,
      offer: freezed == offer
          ? _self.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as SkuBriefModel?,
    ));
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemModelCopyWith<$Res> get item {
    return $CartItemModelCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
      return _then(_self.copyWith(offer: value));
    });
  }

  /// Create a copy of CartLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuBriefModelCopyWith<$Res>? get sku {
    if (_self.sku == null) {
      return null;
    }

    return $SkuBriefModelCopyWith<$Res>(_self.sku!, (value) {
      return _then(_self.copyWith(sku: value));
    });
  }
}

/// @nodoc
mixin _$CartSellerGroup {
  int get sellerId;
  String? get sellerName;
  List<CartLine> get lines;

  /// Create a copy of CartSellerGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartSellerGroupCopyWith<CartSellerGroup> get copyWith =>
      _$CartSellerGroupCopyWithImpl<CartSellerGroup>(
          this as CartSellerGroup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartSellerGroup &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            const DeepCollectionEquality().equals(other.lines, lines));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sellerId, sellerName,
      const DeepCollectionEquality().hash(lines));

  @override
  String toString() {
    return 'CartSellerGroup(sellerId: $sellerId, sellerName: $sellerName, lines: $lines)';
  }
}

/// @nodoc
abstract mixin class $CartSellerGroupCopyWith<$Res> {
  factory $CartSellerGroupCopyWith(
          CartSellerGroup value, $Res Function(CartSellerGroup) _then) =
      _$CartSellerGroupCopyWithImpl;
  @useResult
  $Res call({int sellerId, String? sellerName, List<CartLine> lines});
}

/// @nodoc
class _$CartSellerGroupCopyWithImpl<$Res>
    implements $CartSellerGroupCopyWith<$Res> {
  _$CartSellerGroupCopyWithImpl(this._self, this._then);

  final CartSellerGroup _self;
  final $Res Function(CartSellerGroup) _then;

  /// Create a copy of CartSellerGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? sellerName = freezed,
    Object? lines = null,
  }) {
    return _then(_self.copyWith(
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      sellerName: freezed == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      lines: null == lines
          ? _self.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<CartLine>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartSellerGroup].
extension CartSellerGroupPatterns on CartSellerGroup {
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
    TResult Function(_CartSellerGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup() when $default != null:
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
    TResult Function(_CartSellerGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup():
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
    TResult? Function(_CartSellerGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup() when $default != null:
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
    TResult Function(int sellerId, String? sellerName, List<CartLine> lines)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup() when $default != null:
        return $default(_that.sellerId, _that.sellerName, _that.lines);
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
    TResult Function(int sellerId, String? sellerName, List<CartLine> lines)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup():
        return $default(_that.sellerId, _that.sellerName, _that.lines);
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
    TResult? Function(int sellerId, String? sellerName, List<CartLine> lines)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartSellerGroup() when $default != null:
        return $default(_that.sellerId, _that.sellerName, _that.lines);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartSellerGroup extends CartSellerGroup {
  const _CartSellerGroup(
      {required this.sellerId,
      this.sellerName,
      final List<CartLine> lines = const <CartLine>[]})
      : _lines = lines,
        super._();

  @override
  final int sellerId;
  @override
  final String? sellerName;
  final List<CartLine> _lines;
  @override
  @JsonKey()
  List<CartLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  /// Create a copy of CartSellerGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartSellerGroupCopyWith<_CartSellerGroup> get copyWith =>
      __$CartSellerGroupCopyWithImpl<_CartSellerGroup>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartSellerGroup &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sellerId, sellerName,
      const DeepCollectionEquality().hash(_lines));

  @override
  String toString() {
    return 'CartSellerGroup(sellerId: $sellerId, sellerName: $sellerName, lines: $lines)';
  }
}

/// @nodoc
abstract mixin class _$CartSellerGroupCopyWith<$Res>
    implements $CartSellerGroupCopyWith<$Res> {
  factory _$CartSellerGroupCopyWith(
          _CartSellerGroup value, $Res Function(_CartSellerGroup) _then) =
      __$CartSellerGroupCopyWithImpl;
  @override
  @useResult
  $Res call({int sellerId, String? sellerName, List<CartLine> lines});
}

/// @nodoc
class __$CartSellerGroupCopyWithImpl<$Res>
    implements _$CartSellerGroupCopyWith<$Res> {
  __$CartSellerGroupCopyWithImpl(this._self, this._then);

  final _CartSellerGroup _self;
  final $Res Function(_CartSellerGroup) _then;

  /// Create a copy of CartSellerGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sellerId = null,
    Object? sellerName = freezed,
    Object? lines = null,
  }) {
    return _then(_CartSellerGroup(
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      sellerName: freezed == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      lines: null == lines
          ? _self._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<CartLine>,
    ));
  }
}

/// @nodoc
mixin _$CartState {
  bool get isLoading;
  DataError? get error;
  List<CartSellerGroup> get groups;

  /// Baris yang sedang diproses (hapus / ubah qty), supaya tombolnya bisa
  /// dimatikan tanpa memblokir seluruh layar.
  Set<int> get busyLineIds;
  bool get isClearing;
  String? get message;

  /// Voucher yang menempel di keranjang.
  List<CartVoucherModel> get vouchers;

  /// Pratinjau potongan per kode, dari `POST /cart/voucher`.
  ///
  /// Disimpan terpisah dari [vouchers] karena `GET /cart/view` **tidak**
  /// mengirim angka ini — memuat ulang keranjang akan menghapusnya kalau
  /// digabung. Angkanya juga bukan jaminan: server menghitung ulang saat
  /// checkout.
  Map<String, int> get discountPreviews;
  bool get isVoucherBusy;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartStateCopyWith<CartState> get copyWith =>
      _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            const DeepCollectionEquality()
                .equals(other.busyLineIds, busyLineIds) &&
            (identical(other.isClearing, isClearing) ||
                other.isClearing == isClearing) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.vouchers, vouchers) &&
            const DeepCollectionEquality()
                .equals(other.discountPreviews, discountPreviews) &&
            (identical(other.isVoucherBusy, isVoucherBusy) ||
                other.isVoucherBusy == isVoucherBusy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(groups),
      const DeepCollectionEquality().hash(busyLineIds),
      isClearing,
      message,
      const DeepCollectionEquality().hash(vouchers),
      const DeepCollectionEquality().hash(discountPreviews),
      isVoucherBusy);

  @override
  String toString() {
    return 'CartState(isLoading: $isLoading, error: $error, groups: $groups, busyLineIds: $busyLineIds, isClearing: $isClearing, message: $message, vouchers: $vouchers, discountPreviews: $discountPreviews, isVoucherBusy: $isVoucherBusy)';
  }
}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) =
      _$CartStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      List<CartSellerGroup> groups,
      Set<int> busyLineIds,
      bool isClearing,
      String? message,
      List<CartVoucherModel> vouchers,
      Map<String, int> discountPreviews,
      bool isVoucherBusy});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? groups = null,
    Object? busyLineIds = null,
    Object? isClearing = null,
    Object? message = freezed,
    Object? vouchers = null,
    Object? discountPreviews = null,
    Object? isVoucherBusy = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<CartSellerGroup>,
      busyLineIds: null == busyLineIds
          ? _self.busyLineIds
          : busyLineIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isClearing: null == isClearing
          ? _self.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      vouchers: null == vouchers
          ? _self.vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<CartVoucherModel>,
      discountPreviews: null == discountPreviews
          ? _self.discountPreviews
          : discountPreviews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isVoucherBusy: null == isVoucherBusy
          ? _self.isVoucherBusy
          : isVoucherBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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
    TResult Function(_CartState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
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
    TResult Function(_CartState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState():
        return $default(_that);
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
    TResult? Function(_CartState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
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
            bool isLoading,
            DataError? error,
            List<CartSellerGroup> groups,
            Set<int> busyLineIds,
            bool isClearing,
            String? message,
            List<CartVoucherModel> vouchers,
            Map<String, int> discountPreviews,
            bool isVoucherBusy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.groups,
            _that.busyLineIds,
            _that.isClearing,
            _that.message,
            _that.vouchers,
            _that.discountPreviews,
            _that.isVoucherBusy);
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
            bool isLoading,
            DataError? error,
            List<CartSellerGroup> groups,
            Set<int> busyLineIds,
            bool isClearing,
            String? message,
            List<CartVoucherModel> vouchers,
            Map<String, int> discountPreviews,
            bool isVoucherBusy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState():
        return $default(
            _that.isLoading,
            _that.error,
            _that.groups,
            _that.busyLineIds,
            _that.isClearing,
            _that.message,
            _that.vouchers,
            _that.discountPreviews,
            _that.isVoucherBusy);
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
            bool isLoading,
            DataError? error,
            List<CartSellerGroup> groups,
            Set<int> busyLineIds,
            bool isClearing,
            String? message,
            List<CartVoucherModel> vouchers,
            Map<String, int> discountPreviews,
            bool isVoucherBusy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.groups,
            _that.busyLineIds,
            _that.isClearing,
            _that.message,
            _that.vouchers,
            _that.discountPreviews,
            _that.isVoucherBusy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartState extends CartState {
  const _CartState(
      {this.isLoading = true,
      this.error,
      final List<CartSellerGroup> groups = const <CartSellerGroup>[],
      final Set<int> busyLineIds = const <int>{},
      this.isClearing = false,
      this.message,
      final List<CartVoucherModel> vouchers = const <CartVoucherModel>[],
      final Map<String, int> discountPreviews = const <String, int>{},
      this.isVoucherBusy = false})
      : _groups = groups,
        _busyLineIds = busyLineIds,
        _vouchers = vouchers,
        _discountPreviews = discountPreviews,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DataError? error;
  final List<CartSellerGroup> _groups;
  @override
  @JsonKey()
  List<CartSellerGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  /// Baris yang sedang diproses (hapus / ubah qty), supaya tombolnya bisa
  /// dimatikan tanpa memblokir seluruh layar.
  final Set<int> _busyLineIds;

  /// Baris yang sedang diproses (hapus / ubah qty), supaya tombolnya bisa
  /// dimatikan tanpa memblokir seluruh layar.
  @override
  @JsonKey()
  Set<int> get busyLineIds {
    if (_busyLineIds is EqualUnmodifiableSetView) return _busyLineIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_busyLineIds);
  }

  @override
  @JsonKey()
  final bool isClearing;
  @override
  final String? message;

  /// Voucher yang menempel di keranjang.
  final List<CartVoucherModel> _vouchers;

  /// Voucher yang menempel di keranjang.
  @override
  @JsonKey()
  List<CartVoucherModel> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  /// Pratinjau potongan per kode, dari `POST /cart/voucher`.
  ///
  /// Disimpan terpisah dari [vouchers] karena `GET /cart/view` **tidak**
  /// mengirim angka ini — memuat ulang keranjang akan menghapusnya kalau
  /// digabung. Angkanya juga bukan jaminan: server menghitung ulang saat
  /// checkout.
  final Map<String, int> _discountPreviews;

  /// Pratinjau potongan per kode, dari `POST /cart/voucher`.
  ///
  /// Disimpan terpisah dari [vouchers] karena `GET /cart/view` **tidak**
  /// mengirim angka ini — memuat ulang keranjang akan menghapusnya kalau
  /// digabung. Angkanya juga bukan jaminan: server menghitung ulang saat
  /// checkout.
  @override
  @JsonKey()
  Map<String, int> get discountPreviews {
    if (_discountPreviews is EqualUnmodifiableMapView) return _discountPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_discountPreviews);
  }

  @override
  @JsonKey()
  final bool isVoucherBusy;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartStateCopyWith<_CartState> get copyWith =>
      __$CartStateCopyWithImpl<_CartState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._busyLineIds, _busyLineIds) &&
            (identical(other.isClearing, isClearing) ||
                other.isClearing == isClearing) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers) &&
            const DeepCollectionEquality()
                .equals(other._discountPreviews, _discountPreviews) &&
            (identical(other.isVoucherBusy, isVoucherBusy) ||
                other.isVoucherBusy == isVoucherBusy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_busyLineIds),
      isClearing,
      message,
      const DeepCollectionEquality().hash(_vouchers),
      const DeepCollectionEquality().hash(_discountPreviews),
      isVoucherBusy);

  @override
  String toString() {
    return 'CartState(isLoading: $isLoading, error: $error, groups: $groups, busyLineIds: $busyLineIds, isClearing: $isClearing, message: $message, vouchers: $vouchers, discountPreviews: $discountPreviews, isVoucherBusy: $isVoucherBusy)';
  }
}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(
          _CartState value, $Res Function(_CartState) _then) =
      __$CartStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      List<CartSellerGroup> groups,
      Set<int> busyLineIds,
      bool isClearing,
      String? message,
      List<CartVoucherModel> vouchers,
      Map<String, int> discountPreviews,
      bool isVoucherBusy});
}

/// @nodoc
class __$CartStateCopyWithImpl<$Res> implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? groups = null,
    Object? busyLineIds = null,
    Object? isClearing = null,
    Object? message = freezed,
    Object? vouchers = null,
    Object? discountPreviews = null,
    Object? isVoucherBusy = null,
  }) {
    return _then(_CartState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      groups: null == groups
          ? _self._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<CartSellerGroup>,
      busyLineIds: null == busyLineIds
          ? _self._busyLineIds
          : busyLineIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      isClearing: null == isClearing
          ? _self.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      vouchers: null == vouchers
          ? _self._vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<CartVoucherModel>,
      discountPreviews: null == discountPreviews
          ? _self._discountPreviews
          : discountPreviews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isVoucherBusy: null == isVoucherBusy
          ? _self.isVoucherBusy
          : isVoucherBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
