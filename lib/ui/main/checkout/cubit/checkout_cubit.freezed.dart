// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutState {
  bool get isLoadingAddresses;
  List<AddressModel> get addresses;
  int? get selectedAddressId;
  bool get allOrNothing;
  bool get isSubmitting;
  bool get isSavingAddress;

  /// Hasil checkout yang berhasil — dipakai layar untuk memutuskan tujuan
  /// berikutnya.
  CheckoutResultModel? get result;
  DataError? get error;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      _$CheckoutStateCopyWithImpl<CheckoutState>(
          this as CheckoutState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutState &&
            (identical(other.isLoadingAddresses, isLoadingAddresses) ||
                other.isLoadingAddresses == isLoadingAddresses) &&
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            (identical(other.selectedAddressId, selectedAddressId) ||
                other.selectedAddressId == selectedAddressId) &&
            (identical(other.allOrNothing, allOrNothing) ||
                other.allOrNothing == allOrNothing) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSavingAddress, isSavingAddress) ||
                other.isSavingAddress == isSavingAddress) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingAddresses,
      const DeepCollectionEquality().hash(addresses),
      selectedAddressId,
      allOrNothing,
      isSubmitting,
      isSavingAddress,
      result,
      error);

  @override
  String toString() {
    return 'CheckoutState(isLoadingAddresses: $isLoadingAddresses, addresses: $addresses, selectedAddressId: $selectedAddressId, allOrNothing: $allOrNothing, isSubmitting: $isSubmitting, isSavingAddress: $isSavingAddress, result: $result, error: $error)';
  }
}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) _then) =
      _$CheckoutStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoadingAddresses,
      List<AddressModel> addresses,
      int? selectedAddressId,
      bool allOrNothing,
      bool isSubmitting,
      bool isSavingAddress,
      CheckoutResultModel? result,
      DataError? error});

  $CheckoutResultModelCopyWith<$Res>? get result;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingAddresses = null,
    Object? addresses = null,
    Object? selectedAddressId = freezed,
    Object? allOrNothing = null,
    Object? isSubmitting = null,
    Object? isSavingAddress = null,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      isLoadingAddresses: null == isLoadingAddresses
          ? _self.isLoadingAddresses
          : isLoadingAddresses // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: null == addresses
          ? _self.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      selectedAddressId: freezed == selectedAddressId
          ? _self.selectedAddressId
          : selectedAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      allOrNothing: null == allOrNothing
          ? _self.allOrNothing
          : allOrNothing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAddress: null == isSavingAddress
          ? _self.isSavingAddress
          : isSavingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as CheckoutResultModel?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
    ));
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutResultModelCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $CheckoutResultModelCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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
    TResult Function(_CheckoutState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
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
    TResult Function(_CheckoutState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState():
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
    TResult? Function(_CheckoutState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
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
            bool isLoadingAddresses,
            List<AddressModel> addresses,
            int? selectedAddressId,
            bool allOrNothing,
            bool isSubmitting,
            bool isSavingAddress,
            CheckoutResultModel? result,
            DataError? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(
            _that.isLoadingAddresses,
            _that.addresses,
            _that.selectedAddressId,
            _that.allOrNothing,
            _that.isSubmitting,
            _that.isSavingAddress,
            _that.result,
            _that.error);
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
            bool isLoadingAddresses,
            List<AddressModel> addresses,
            int? selectedAddressId,
            bool allOrNothing,
            bool isSubmitting,
            bool isSavingAddress,
            CheckoutResultModel? result,
            DataError? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState():
        return $default(
            _that.isLoadingAddresses,
            _that.addresses,
            _that.selectedAddressId,
            _that.allOrNothing,
            _that.isSubmitting,
            _that.isSavingAddress,
            _that.result,
            _that.error);
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
            bool isLoadingAddresses,
            List<AddressModel> addresses,
            int? selectedAddressId,
            bool allOrNothing,
            bool isSubmitting,
            bool isSavingAddress,
            CheckoutResultModel? result,
            DataError? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutState() when $default != null:
        return $default(
            _that.isLoadingAddresses,
            _that.addresses,
            _that.selectedAddressId,
            _that.allOrNothing,
            _that.isSubmitting,
            _that.isSavingAddress,
            _that.result,
            _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckoutState extends CheckoutState {
  const _CheckoutState(
      {this.isLoadingAddresses = false,
      final List<AddressModel> addresses = const <AddressModel>[],
      this.selectedAddressId,
      this.allOrNothing = false,
      this.isSubmitting = false,
      this.isSavingAddress = false,
      this.result,
      this.error})
      : _addresses = addresses,
        super._();

  @override
  @JsonKey()
  final bool isLoadingAddresses;
  final List<AddressModel> _addresses;
  @override
  @JsonKey()
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final int? selectedAddressId;
  @override
  @JsonKey()
  final bool allOrNothing;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSavingAddress;

  /// Hasil checkout yang berhasil — dipakai layar untuk memutuskan tujuan
  /// berikutnya.
  @override
  final CheckoutResultModel? result;
  @override
  final DataError? error;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutStateCopyWith<_CheckoutState> get copyWith =>
      __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutState &&
            (identical(other.isLoadingAddresses, isLoadingAddresses) ||
                other.isLoadingAddresses == isLoadingAddresses) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.selectedAddressId, selectedAddressId) ||
                other.selectedAddressId == selectedAddressId) &&
            (identical(other.allOrNothing, allOrNothing) ||
                other.allOrNothing == allOrNothing) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSavingAddress, isSavingAddress) ||
                other.isSavingAddress == isSavingAddress) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingAddresses,
      const DeepCollectionEquality().hash(_addresses),
      selectedAddressId,
      allOrNothing,
      isSubmitting,
      isSavingAddress,
      result,
      error);

  @override
  String toString() {
    return 'CheckoutState(isLoadingAddresses: $isLoadingAddresses, addresses: $addresses, selectedAddressId: $selectedAddressId, allOrNothing: $allOrNothing, isSubmitting: $isSubmitting, isSavingAddress: $isSavingAddress, result: $result, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(
          _CheckoutState value, $Res Function(_CheckoutState) _then) =
      __$CheckoutStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoadingAddresses,
      List<AddressModel> addresses,
      int? selectedAddressId,
      bool allOrNothing,
      bool isSubmitting,
      bool isSavingAddress,
      CheckoutResultModel? result,
      DataError? error});

  @override
  $CheckoutResultModelCopyWith<$Res>? get result;
}

/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoadingAddresses = null,
    Object? addresses = null,
    Object? selectedAddressId = freezed,
    Object? allOrNothing = null,
    Object? isSubmitting = null,
    Object? isSavingAddress = null,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_CheckoutState(
      isLoadingAddresses: null == isLoadingAddresses
          ? _self.isLoadingAddresses
          : isLoadingAddresses // ignore: cast_nullable_to_non_nullable
              as bool,
      addresses: null == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      selectedAddressId: freezed == selectedAddressId
          ? _self.selectedAddressId
          : selectedAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      allOrNothing: null == allOrNothing
          ? _self.allOrNothing
          : allOrNothing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAddress: null == isSavingAddress
          ? _self.isSavingAddress
          : isSavingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as CheckoutResultModel?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
    ));
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutResultModelCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $CheckoutResultModelCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

// dart format on
