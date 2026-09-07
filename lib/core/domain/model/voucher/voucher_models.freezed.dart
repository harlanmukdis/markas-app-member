// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherValidationModel {
  @IntOrNullJson()
  @JsonKey(name: 'voucher_id')
  int? get voucherId;
  @StringOrNullJson()
  String? get code;

  /// `PLATFORM` atau `SELLER`. Maksimal satu dari masing-masing per
  /// sub-order — kalau dilanggar server membalas `FUNDED_BY_COLLISION`.
  @StringOrNullJson()
  @JsonKey(name: 'funded_by')
  String? get fundedBy;
  @IntJson()
  @JsonKey(name: 'discount_amount')
  int get discountAmount;

  /// Create a copy of VoucherValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VoucherValidationModelCopyWith<VoucherValidationModel> get copyWith =>
      _$VoucherValidationModelCopyWithImpl<VoucherValidationModel>(
          this as VoucherValidationModel, _$identity);

  /// Serializes this VoucherValidationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VoucherValidationModel &&
            (identical(other.voucherId, voucherId) ||
                other.voucherId == voucherId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fundedBy, fundedBy) ||
                other.fundedBy == fundedBy) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, voucherId, code, fundedBy, discountAmount);

  @override
  String toString() {
    return 'VoucherValidationModel(voucherId: $voucherId, code: $code, fundedBy: $fundedBy, discountAmount: $discountAmount)';
  }
}

/// @nodoc
abstract mixin class $VoucherValidationModelCopyWith<$Res> {
  factory $VoucherValidationModelCopyWith(VoucherValidationModel value,
          $Res Function(VoucherValidationModel) _then) =
      _$VoucherValidationModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
      @StringOrNullJson() String? code,
      @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
      @IntJson() @JsonKey(name: 'discount_amount') int discountAmount});
}

/// @nodoc
class _$VoucherValidationModelCopyWithImpl<$Res>
    implements $VoucherValidationModelCopyWith<$Res> {
  _$VoucherValidationModelCopyWithImpl(this._self, this._then);

  final VoucherValidationModel _self;
  final $Res Function(VoucherValidationModel) _then;

  /// Create a copy of VoucherValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? fundedBy = freezed,
    Object? discountAmount = null,
  }) {
    return _then(_self.copyWith(
      voucherId: freezed == voucherId
          ? _self.voucherId
          : voucherId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fundedBy: freezed == fundedBy
          ? _self.fundedBy
          : fundedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [VoucherValidationModel].
extension VoucherValidationModelPatterns on VoucherValidationModel {
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
    TResult Function(_VoucherValidationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel() when $default != null:
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
    TResult Function(_VoucherValidationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel():
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
    TResult? Function(_VoucherValidationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
            @StringOrNullJson() String? code,
            @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
            @IntJson() @JsonKey(name: 'discount_amount') int discountAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel() when $default != null:
        return $default(
            _that.voucherId, _that.code, _that.fundedBy, _that.discountAmount);
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
            @IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
            @StringOrNullJson() String? code,
            @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
            @IntJson() @JsonKey(name: 'discount_amount') int discountAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel():
        return $default(
            _that.voucherId, _that.code, _that.fundedBy, _that.discountAmount);
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
            @IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
            @StringOrNullJson() String? code,
            @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
            @IntJson() @JsonKey(name: 'discount_amount') int discountAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoucherValidationModel() when $default != null:
        return $default(
            _that.voucherId, _that.code, _that.fundedBy, _that.discountAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VoucherValidationModel implements VoucherValidationModel {
  const _VoucherValidationModel(
      {@IntOrNullJson() @JsonKey(name: 'voucher_id') this.voucherId,
      @StringOrNullJson() this.code,
      @StringOrNullJson() @JsonKey(name: 'funded_by') this.fundedBy,
      @IntJson() @JsonKey(name: 'discount_amount') this.discountAmount = 0});
  factory _VoucherValidationModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherValidationModelFromJson(json);

  @override
  @IntOrNullJson()
  @JsonKey(name: 'voucher_id')
  final int? voucherId;
  @override
  @StringOrNullJson()
  final String? code;

  /// `PLATFORM` atau `SELLER`. Maksimal satu dari masing-masing per
  /// sub-order — kalau dilanggar server membalas `FUNDED_BY_COLLISION`.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'funded_by')
  final String? fundedBy;
  @override
  @IntJson()
  @JsonKey(name: 'discount_amount')
  final int discountAmount;

  /// Create a copy of VoucherValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VoucherValidationModelCopyWith<_VoucherValidationModel> get copyWith =>
      __$VoucherValidationModelCopyWithImpl<_VoucherValidationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VoucherValidationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VoucherValidationModel &&
            (identical(other.voucherId, voucherId) ||
                other.voucherId == voucherId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fundedBy, fundedBy) ||
                other.fundedBy == fundedBy) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, voucherId, code, fundedBy, discountAmount);

  @override
  String toString() {
    return 'VoucherValidationModel(voucherId: $voucherId, code: $code, fundedBy: $fundedBy, discountAmount: $discountAmount)';
  }
}

/// @nodoc
abstract mixin class _$VoucherValidationModelCopyWith<$Res>
    implements $VoucherValidationModelCopyWith<$Res> {
  factory _$VoucherValidationModelCopyWith(_VoucherValidationModel value,
          $Res Function(_VoucherValidationModel) _then) =
      __$VoucherValidationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'voucher_id') int? voucherId,
      @StringOrNullJson() String? code,
      @StringOrNullJson() @JsonKey(name: 'funded_by') String? fundedBy,
      @IntJson() @JsonKey(name: 'discount_amount') int discountAmount});
}

/// @nodoc
class __$VoucherValidationModelCopyWithImpl<$Res>
    implements _$VoucherValidationModelCopyWith<$Res> {
  __$VoucherValidationModelCopyWithImpl(this._self, this._then);

  final _VoucherValidationModel _self;
  final $Res Function(_VoucherValidationModel) _then;

  /// Create a copy of VoucherValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? fundedBy = freezed,
    Object? discountAmount = null,
  }) {
    return _then(_VoucherValidationModel(
      voucherId: freezed == voucherId
          ? _self.voucherId
          : voucherId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fundedBy: freezed == fundedBy
          ? _self.fundedBy
          : fundedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
