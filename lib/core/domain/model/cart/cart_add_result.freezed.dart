// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_add_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartAddResult {
  @IntJson()
  @JsonKey(name: 'cart_id')
  int get cartId;
  @IntJson()
  @JsonKey(name: 'item_id')
  int get itemId;

  /// Create a copy of CartAddResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartAddResultCopyWith<CartAddResult> get copyWith =>
      _$CartAddResultCopyWithImpl<CartAddResult>(
          this as CartAddResult, _$identity);

  /// Serializes this CartAddResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartAddResult &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartId, itemId);

  @override
  String toString() {
    return 'CartAddResult(cartId: $cartId, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $CartAddResultCopyWith<$Res> {
  factory $CartAddResultCopyWith(
          CartAddResult value, $Res Function(CartAddResult) _then) =
      _$CartAddResultCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'cart_id') int cartId,
      @IntJson() @JsonKey(name: 'item_id') int itemId});
}

/// @nodoc
class _$CartAddResultCopyWithImpl<$Res>
    implements $CartAddResultCopyWith<$Res> {
  _$CartAddResultCopyWithImpl(this._self, this._then);

  final CartAddResult _self;
  final $Res Function(CartAddResult) _then;

  /// Create a copy of CartAddResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? itemId = null,
  }) {
    return _then(_self.copyWith(
      cartId: null == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartAddResult].
extension CartAddResultPatterns on CartAddResult {
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
    TResult Function(_CartAddResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartAddResult() when $default != null:
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
    TResult Function(_CartAddResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartAddResult():
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
    TResult? Function(_CartAddResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartAddResult() when $default != null:
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
    TResult Function(@IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'item_id') int itemId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartAddResult() when $default != null:
        return $default(_that.cartId, _that.itemId);
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
    TResult Function(@IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'item_id') int itemId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartAddResult():
        return $default(_that.cartId, _that.itemId);
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
    TResult? Function(@IntJson() @JsonKey(name: 'cart_id') int cartId,
            @IntJson() @JsonKey(name: 'item_id') int itemId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartAddResult() when $default != null:
        return $default(_that.cartId, _that.itemId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CartAddResult implements CartAddResult {
  const _CartAddResult(
      {@IntJson() @JsonKey(name: 'cart_id') required this.cartId,
      @IntJson() @JsonKey(name: 'item_id') required this.itemId});
  factory _CartAddResult.fromJson(Map<String, dynamic> json) =>
      _$CartAddResultFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'cart_id')
  final int cartId;
  @override
  @IntJson()
  @JsonKey(name: 'item_id')
  final int itemId;

  /// Create a copy of CartAddResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartAddResultCopyWith<_CartAddResult> get copyWith =>
      __$CartAddResultCopyWithImpl<_CartAddResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartAddResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartAddResult &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartId, itemId);

  @override
  String toString() {
    return 'CartAddResult(cartId: $cartId, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class _$CartAddResultCopyWith<$Res>
    implements $CartAddResultCopyWith<$Res> {
  factory _$CartAddResultCopyWith(
          _CartAddResult value, $Res Function(_CartAddResult) _then) =
      __$CartAddResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'cart_id') int cartId,
      @IntJson() @JsonKey(name: 'item_id') int itemId});
}

/// @nodoc
class __$CartAddResultCopyWithImpl<$Res>
    implements _$CartAddResultCopyWith<$Res> {
  __$CartAddResultCopyWithImpl(this._self, this._then);

  final _CartAddResult _self;
  final $Res Function(_CartAddResult) _then;

  /// Create a copy of CartAddResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cartId = null,
    Object? itemId = null,
  }) {
    return _then(_CartAddResult(
      cartId: null == cartId
          ? _self.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
