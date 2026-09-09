// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderListState {
  bool get isLoading;
  DataError? get error;
  List<OrderModel> get orders;
  OrderTab get tab;

  /// Create a copy of OrderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderListStateCopyWith<OrderListState> get copyWith =>
      _$OrderListStateCopyWithImpl<OrderListState>(
          this as OrderListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.orders, orders) &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(orders), tab);

  @override
  String toString() {
    return 'OrderListState(isLoading: $isLoading, error: $error, orders: $orders, tab: $tab)';
  }
}

/// @nodoc
abstract mixin class $OrderListStateCopyWith<$Res> {
  factory $OrderListStateCopyWith(
          OrderListState value, $Res Function(OrderListState) _then) =
      _$OrderListStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      List<OrderModel> orders,
      OrderTab tab});
}

/// @nodoc
class _$OrderListStateCopyWithImpl<$Res>
    implements $OrderListStateCopyWith<$Res> {
  _$OrderListStateCopyWithImpl(this._self, this._then);

  final OrderListState _self;
  final $Res Function(OrderListState) _then;

  /// Create a copy of OrderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? orders = null,
    Object? tab = null,
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
      orders: null == orders
          ? _self.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      tab: null == tab
          ? _self.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as OrderTab,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderListState].
extension OrderListStatePatterns on OrderListState {
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
    TResult Function(_OrderListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderListState() when $default != null:
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
    TResult Function(_OrderListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderListState():
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
    TResult? Function(_OrderListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderListState() when $default != null:
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
    TResult Function(bool isLoading, DataError? error, List<OrderModel> orders,
            OrderTab tab)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderListState() when $default != null:
        return $default(_that.isLoading, _that.error, _that.orders, _that.tab);
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
    TResult Function(bool isLoading, DataError? error, List<OrderModel> orders,
            OrderTab tab)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderListState():
        return $default(_that.isLoading, _that.error, _that.orders, _that.tab);
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
    TResult? Function(bool isLoading, DataError? error, List<OrderModel> orders,
            OrderTab tab)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderListState() when $default != null:
        return $default(_that.isLoading, _that.error, _that.orders, _that.tab);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderListState extends OrderListState {
  const _OrderListState(
      {this.isLoading = true,
      this.error,
      final List<OrderModel> orders = const <OrderModel>[],
      this.tab = OrderTab.belumBayar})
      : _orders = orders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DataError? error;
  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final OrderTab tab;

  /// Create a copy of OrderListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderListStateCopyWith<_OrderListState> get copyWith =>
      __$OrderListStateCopyWithImpl<_OrderListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_orders), tab);

  @override
  String toString() {
    return 'OrderListState(isLoading: $isLoading, error: $error, orders: $orders, tab: $tab)';
  }
}

/// @nodoc
abstract mixin class _$OrderListStateCopyWith<$Res>
    implements $OrderListStateCopyWith<$Res> {
  factory _$OrderListStateCopyWith(
          _OrderListState value, $Res Function(_OrderListState) _then) =
      __$OrderListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      List<OrderModel> orders,
      OrderTab tab});
}

/// @nodoc
class __$OrderListStateCopyWithImpl<$Res>
    implements _$OrderListStateCopyWith<$Res> {
  __$OrderListStateCopyWithImpl(this._self, this._then);

  final _OrderListState _self;
  final $Res Function(_OrderListState) _then;

  /// Create a copy of OrderListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? orders = null,
    Object? tab = null,
  }) {
    return _then(_OrderListState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      orders: null == orders
          ? _self._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      tab: null == tab
          ? _self.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as OrderTab,
    ));
  }
}

// dart format on
