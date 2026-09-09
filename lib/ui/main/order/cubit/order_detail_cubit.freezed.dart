// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailState {
  bool get isLoading;
  DataError? get error;
  String? get message;
  OrderModel? get order;
  PaymentModel? get payment;
  bool get isInitiatingPayment;
  bool get isCancelling;
  Set<int> get busyShipmentIds;

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderDetailStateCopyWith<OrderDetailState> get copyWith =>
      _$OrderDetailStateCopyWithImpl<OrderDetailState>(
          this as OrderDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.isInitiatingPayment, isInitiatingPayment) ||
                other.isInitiatingPayment == isInitiatingPayment) &&
            (identical(other.isCancelling, isCancelling) ||
                other.isCancelling == isCancelling) &&
            const DeepCollectionEquality()
                .equals(other.busyShipmentIds, busyShipmentIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      message,
      order,
      payment,
      isInitiatingPayment,
      isCancelling,
      const DeepCollectionEquality().hash(busyShipmentIds));

  @override
  String toString() {
    return 'OrderDetailState(isLoading: $isLoading, error: $error, message: $message, order: $order, payment: $payment, isInitiatingPayment: $isInitiatingPayment, isCancelling: $isCancelling, busyShipmentIds: $busyShipmentIds)';
  }
}

/// @nodoc
abstract mixin class $OrderDetailStateCopyWith<$Res> {
  factory $OrderDetailStateCopyWith(
          OrderDetailState value, $Res Function(OrderDetailState) _then) =
      _$OrderDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      String? message,
      OrderModel? order,
      PaymentModel? payment,
      bool isInitiatingPayment,
      bool isCancelling,
      Set<int> busyShipmentIds});

  $OrderModelCopyWith<$Res>? get order;
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class _$OrderDetailStateCopyWithImpl<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  _$OrderDetailStateCopyWithImpl(this._self, this._then);

  final OrderDetailState _self;
  final $Res Function(OrderDetailState) _then;

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? message = freezed,
    Object? order = freezed,
    Object? payment = freezed,
    Object? isInitiatingPayment = null,
    Object? isCancelling = null,
    Object? busyShipmentIds = null,
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
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
      isInitiatingPayment: null == isInitiatingPayment
          ? _self.isInitiatingPayment
          : isInitiatingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _self.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
      busyShipmentIds: null == busyShipmentIds
          ? _self.busyShipmentIds
          : busyShipmentIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get order {
    if (_self.order == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_self.order!, (value) {
      return _then(_self.copyWith(order: value));
    });
  }

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrderDetailState].
extension OrderDetailStatePatterns on OrderDetailState {
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
    TResult Function(_OrderDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState() when $default != null:
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
    TResult Function(_OrderDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState():
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
    TResult? Function(_OrderDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState() when $default != null:
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
            String? message,
            OrderModel? order,
            PaymentModel? payment,
            bool isInitiatingPayment,
            bool isCancelling,
            Set<int> busyShipmentIds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.message,
            _that.order,
            _that.payment,
            _that.isInitiatingPayment,
            _that.isCancelling,
            _that.busyShipmentIds);
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
            String? message,
            OrderModel? order,
            PaymentModel? payment,
            bool isInitiatingPayment,
            bool isCancelling,
            Set<int> busyShipmentIds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState():
        return $default(
            _that.isLoading,
            _that.error,
            _that.message,
            _that.order,
            _that.payment,
            _that.isInitiatingPayment,
            _that.isCancelling,
            _that.busyShipmentIds);
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
            String? message,
            OrderModel? order,
            PaymentModel? payment,
            bool isInitiatingPayment,
            bool isCancelling,
            Set<int> busyShipmentIds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderDetailState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.message,
            _that.order,
            _that.payment,
            _that.isInitiatingPayment,
            _that.isCancelling,
            _that.busyShipmentIds);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderDetailState extends OrderDetailState {
  const _OrderDetailState(
      {this.isLoading = true,
      this.error,
      this.message,
      this.order,
      this.payment,
      this.isInitiatingPayment = false,
      this.isCancelling = false,
      final Set<int> busyShipmentIds = const <int>{}})
      : _busyShipmentIds = busyShipmentIds,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DataError? error;
  @override
  final String? message;
  @override
  final OrderModel? order;
  @override
  final PaymentModel? payment;
  @override
  @JsonKey()
  final bool isInitiatingPayment;
  @override
  @JsonKey()
  final bool isCancelling;
  final Set<int> _busyShipmentIds;
  @override
  @JsonKey()
  Set<int> get busyShipmentIds {
    if (_busyShipmentIds is EqualUnmodifiableSetView) return _busyShipmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_busyShipmentIds);
  }

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderDetailStateCopyWith<_OrderDetailState> get copyWith =>
      __$OrderDetailStateCopyWithImpl<_OrderDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.isInitiatingPayment, isInitiatingPayment) ||
                other.isInitiatingPayment == isInitiatingPayment) &&
            (identical(other.isCancelling, isCancelling) ||
                other.isCancelling == isCancelling) &&
            const DeepCollectionEquality()
                .equals(other._busyShipmentIds, _busyShipmentIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      message,
      order,
      payment,
      isInitiatingPayment,
      isCancelling,
      const DeepCollectionEquality().hash(_busyShipmentIds));

  @override
  String toString() {
    return 'OrderDetailState(isLoading: $isLoading, error: $error, message: $message, order: $order, payment: $payment, isInitiatingPayment: $isInitiatingPayment, isCancelling: $isCancelling, busyShipmentIds: $busyShipmentIds)';
  }
}

/// @nodoc
abstract mixin class _$OrderDetailStateCopyWith<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  factory _$OrderDetailStateCopyWith(
          _OrderDetailState value, $Res Function(_OrderDetailState) _then) =
      __$OrderDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      String? message,
      OrderModel? order,
      PaymentModel? payment,
      bool isInitiatingPayment,
      bool isCancelling,
      Set<int> busyShipmentIds});

  @override
  $OrderModelCopyWith<$Res>? get order;
  @override
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class __$OrderDetailStateCopyWithImpl<$Res>
    implements _$OrderDetailStateCopyWith<$Res> {
  __$OrderDetailStateCopyWithImpl(this._self, this._then);

  final _OrderDetailState _self;
  final $Res Function(_OrderDetailState) _then;

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? message = freezed,
    Object? order = freezed,
    Object? payment = freezed,
    Object? isInitiatingPayment = null,
    Object? isCancelling = null,
    Object? busyShipmentIds = null,
  }) {
    return _then(_OrderDetailState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
      isInitiatingPayment: null == isInitiatingPayment
          ? _self.isInitiatingPayment
          : isInitiatingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _self.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
      busyShipmentIds: null == busyShipmentIds
          ? _self._busyShipmentIds
          : busyShipmentIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get order {
    if (_self.order == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_self.order!, (value) {
      return _then(_self.copyWith(order: value));
    });
  }

  /// Create a copy of OrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

// dart format on
