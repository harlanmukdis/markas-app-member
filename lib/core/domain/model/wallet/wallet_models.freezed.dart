// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletBalanceModel {
  @IntJson()
  int get balance;

  /// Create a copy of WalletBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WalletBalanceModelCopyWith<WalletBalanceModel> get copyWith =>
      _$WalletBalanceModelCopyWithImpl<WalletBalanceModel>(
          this as WalletBalanceModel, _$identity);

  /// Serializes this WalletBalanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletBalanceModel &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @override
  String toString() {
    return 'WalletBalanceModel(balance: $balance)';
  }
}

/// @nodoc
abstract mixin class $WalletBalanceModelCopyWith<$Res> {
  factory $WalletBalanceModelCopyWith(
          WalletBalanceModel value, $Res Function(WalletBalanceModel) _then) =
      _$WalletBalanceModelCopyWithImpl;
  @useResult
  $Res call({@IntJson() int balance});
}

/// @nodoc
class _$WalletBalanceModelCopyWithImpl<$Res>
    implements $WalletBalanceModelCopyWith<$Res> {
  _$WalletBalanceModelCopyWithImpl(this._self, this._then);

  final WalletBalanceModel _self;
  final $Res Function(WalletBalanceModel) _then;

  /// Create a copy of WalletBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_self.copyWith(
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [WalletBalanceModel].
extension WalletBalanceModelPatterns on WalletBalanceModel {
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
    TResult Function(_WalletBalanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel() when $default != null:
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
    TResult Function(_WalletBalanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel():
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
    TResult? Function(_WalletBalanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel() when $default != null:
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
    TResult Function(@IntJson() int balance)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel() when $default != null:
        return $default(_that.balance);
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
    TResult Function(@IntJson() int balance) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel():
        return $default(_that.balance);
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
    TResult? Function(@IntJson() int balance)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletBalanceModel() when $default != null:
        return $default(_that.balance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WalletBalanceModel implements WalletBalanceModel {
  const _WalletBalanceModel({@IntJson() this.balance = 0});
  factory _WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceModelFromJson(json);

  @override
  @JsonKey()
  @IntJson()
  final int balance;

  /// Create a copy of WalletBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WalletBalanceModelCopyWith<_WalletBalanceModel> get copyWith =>
      __$WalletBalanceModelCopyWithImpl<_WalletBalanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WalletBalanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletBalanceModel &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @override
  String toString() {
    return 'WalletBalanceModel(balance: $balance)';
  }
}

/// @nodoc
abstract mixin class _$WalletBalanceModelCopyWith<$Res>
    implements $WalletBalanceModelCopyWith<$Res> {
  factory _$WalletBalanceModelCopyWith(
          _WalletBalanceModel value, $Res Function(_WalletBalanceModel) _then) =
      __$WalletBalanceModelCopyWithImpl;
  @override
  @useResult
  $Res call({@IntJson() int balance});
}

/// @nodoc
class __$WalletBalanceModelCopyWithImpl<$Res>
    implements _$WalletBalanceModelCopyWith<$Res> {
  __$WalletBalanceModelCopyWithImpl(this._self, this._then);

  final _WalletBalanceModel _self;
  final $Res Function(_WalletBalanceModel) _then;

  /// Create a copy of WalletBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? balance = null,
  }) {
    return _then(_WalletBalanceModel(
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$WalletTopupModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'topup_no')
  String? get topupNo;
  @StringOrNullJson()
  String? get method;
  @IntJson()
  int get amount;
  @StringJson()
  String get status;
  @StringOrNullJson()
  @JsonKey(name: 'va_number')
  String? get vaNumber;
  @StringOrNullJson()
  @JsonKey(name: 'qris_payload')
  String? get qrisPayload;

  /// Terkena bug jam 5 jam yang sama seperti `payment_deadline`: satu
  /// top-up nyata tercatat `created_at 17:54` dengan `expires_at 12:54`
  /// keesokan harinya — 19 jam, bukan 24. Tampilkan absolut.
  @ServerDateTimeJson()
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @ServerDateTimeJson()
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at', readValue: _readTopupCreated)
  DateTime? get createdDate;

  /// Create a copy of WalletTopupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WalletTopupModelCopyWith<WalletTopupModel> get copyWith =>
      _$WalletTopupModelCopyWithImpl<WalletTopupModel>(
          this as WalletTopupModel, _$identity);

  /// Serializes this WalletTopupModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletTopupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topupNo, topupNo) || other.topupNo == topupNo) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber) &&
            (identical(other.qrisPayload, qrisPayload) ||
                other.qrisPayload == qrisPayload) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, topupNo, method, amount,
      status, vaNumber, qrisPayload, expiresAt, verifiedAt, createdDate);

  @override
  String toString() {
    return 'WalletTopupModel(id: $id, topupNo: $topupNo, method: $method, amount: $amount, status: $status, vaNumber: $vaNumber, qrisPayload: $qrisPayload, expiresAt: $expiresAt, verifiedAt: $verifiedAt, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $WalletTopupModelCopyWith<$Res> {
  factory $WalletTopupModelCopyWith(
          WalletTopupModel value, $Res Function(WalletTopupModel) _then) =
      _$WalletTopupModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
      @StringOrNullJson() String? method,
      @IntJson() int amount,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readTopupCreated)
      DateTime? createdDate});
}

/// @nodoc
class _$WalletTopupModelCopyWithImpl<$Res>
    implements $WalletTopupModelCopyWith<$Res> {
  _$WalletTopupModelCopyWithImpl(this._self, this._then);

  final WalletTopupModel _self;
  final $Res Function(WalletTopupModel) _then;

  /// Create a copy of WalletTopupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topupNo = freezed,
    Object? method = freezed,
    Object? amount = null,
    Object? status = null,
    Object? vaNumber = freezed,
    Object? qrisPayload = freezed,
    Object? expiresAt = freezed,
    Object? verifiedAt = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topupNo: freezed == topupNo
          ? _self.topupNo
          : topupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      vaNumber: freezed == vaNumber
          ? _self.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrisPayload: freezed == qrisPayload
          ? _self.qrisPayload
          : qrisPayload // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WalletTopupModel].
extension WalletTopupModelPatterns on WalletTopupModel {
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
    TResult Function(_WalletTopupModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel() when $default != null:
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
    TResult Function(_WalletTopupModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel():
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
    TResult? Function(_WalletTopupModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel() when $default != null:
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
            @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
            @StringOrNullJson() String? method,
            @IntJson() int amount,
            @StringJson() String status,
            @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
            @StringOrNullJson()
            @JsonKey(name: 'qris_payload')
            String? qrisPayload,
            @ServerDateTimeJson()
            @JsonKey(name: 'expires_at')
            DateTime? expiresAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'verified_at')
            DateTime? verifiedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at', readValue: _readTopupCreated)
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel() when $default != null:
        return $default(
            _that.id,
            _that.topupNo,
            _that.method,
            _that.amount,
            _that.status,
            _that.vaNumber,
            _that.qrisPayload,
            _that.expiresAt,
            _that.verifiedAt,
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
            @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
            @StringOrNullJson() String? method,
            @IntJson() int amount,
            @StringJson() String status,
            @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
            @StringOrNullJson()
            @JsonKey(name: 'qris_payload')
            String? qrisPayload,
            @ServerDateTimeJson()
            @JsonKey(name: 'expires_at')
            DateTime? expiresAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'verified_at')
            DateTime? verifiedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at', readValue: _readTopupCreated)
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel():
        return $default(
            _that.id,
            _that.topupNo,
            _that.method,
            _that.amount,
            _that.status,
            _that.vaNumber,
            _that.qrisPayload,
            _that.expiresAt,
            _that.verifiedAt,
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
            @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
            @StringOrNullJson() String? method,
            @IntJson() int amount,
            @StringJson() String status,
            @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
            @StringOrNullJson()
            @JsonKey(name: 'qris_payload')
            String? qrisPayload,
            @ServerDateTimeJson()
            @JsonKey(name: 'expires_at')
            DateTime? expiresAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'verified_at')
            DateTime? verifiedAt,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at', readValue: _readTopupCreated)
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletTopupModel() when $default != null:
        return $default(
            _that.id,
            _that.topupNo,
            _that.method,
            _that.amount,
            _that.status,
            _that.vaNumber,
            _that.qrisPayload,
            _that.expiresAt,
            _that.verifiedAt,
            _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WalletTopupModel extends WalletTopupModel {
  const _WalletTopupModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'topup_no') this.topupNo,
      @StringOrNullJson() this.method,
      @IntJson() this.amount = 0,
      @StringJson() this.status = '',
      @StringOrNullJson() @JsonKey(name: 'va_number') this.vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') this.qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') this.expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') this.verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readTopupCreated)
      this.createdDate})
      : super._();
  factory _WalletTopupModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTopupModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'topup_no')
  final String? topupNo;
  @override
  @StringOrNullJson()
  final String? method;
  @override
  @JsonKey()
  @IntJson()
  final int amount;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'va_number')
  final String? vaNumber;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'qris_payload')
  final String? qrisPayload;

  /// Terkena bug jam 5 jam yang sama seperti `payment_deadline`: satu
  /// top-up nyata tercatat `created_at 17:54` dengan `expires_at 12:54`
  /// keesokan harinya — 19 jam, bukan 24. Tampilkan absolut.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at', readValue: _readTopupCreated)
  final DateTime? createdDate;

  /// Create a copy of WalletTopupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WalletTopupModelCopyWith<_WalletTopupModel> get copyWith =>
      __$WalletTopupModelCopyWithImpl<_WalletTopupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WalletTopupModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletTopupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topupNo, topupNo) || other.topupNo == topupNo) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber) &&
            (identical(other.qrisPayload, qrisPayload) ||
                other.qrisPayload == qrisPayload) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, topupNo, method, amount,
      status, vaNumber, qrisPayload, expiresAt, verifiedAt, createdDate);

  @override
  String toString() {
    return 'WalletTopupModel(id: $id, topupNo: $topupNo, method: $method, amount: $amount, status: $status, vaNumber: $vaNumber, qrisPayload: $qrisPayload, expiresAt: $expiresAt, verifiedAt: $verifiedAt, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$WalletTopupModelCopyWith<$Res>
    implements $WalletTopupModelCopyWith<$Res> {
  factory _$WalletTopupModelCopyWith(
          _WalletTopupModel value, $Res Function(_WalletTopupModel) _then) =
      __$WalletTopupModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'topup_no') String? topupNo,
      @StringOrNullJson() String? method,
      @IntJson() int amount,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readTopupCreated)
      DateTime? createdDate});
}

/// @nodoc
class __$WalletTopupModelCopyWithImpl<$Res>
    implements _$WalletTopupModelCopyWith<$Res> {
  __$WalletTopupModelCopyWithImpl(this._self, this._then);

  final _WalletTopupModel _self;
  final $Res Function(_WalletTopupModel) _then;

  /// Create a copy of WalletTopupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? topupNo = freezed,
    Object? method = freezed,
    Object? amount = null,
    Object? status = null,
    Object? vaNumber = freezed,
    Object? qrisPayload = freezed,
    Object? expiresAt = freezed,
    Object? verifiedAt = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_WalletTopupModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topupNo: freezed == topupNo
          ? _self.topupNo
          : topupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      vaNumber: freezed == vaNumber
          ? _self.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrisPayload: freezed == qrisPayload
          ? _self.qrisPayload
          : qrisPayload // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$WalletEntryModel {
  @IntJson()
  int get id;
  @StringJson()
  @JsonKey(name: 'entry_type')
  String get entryType;

  /// Sudah bertanda: pengeluaran datang negatif (`"-1339000.00"`). Jangan
  /// dibalik sendiri di UI — cukup tampilkan apa adanya.
  @DoubleJson()
  double get amount;
  @StringOrNullJson()
  @JsonKey(name: 'ref_type')
  String? get refType;
  @IntOrNullJson()
  @JsonKey(name: 'ref_id')
  int? get refId;
  @StringOrNullJson()
  String? get note;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of WalletEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WalletEntryModelCopyWith<WalletEntryModel> get copyWith =>
      _$WalletEntryModelCopyWithImpl<WalletEntryModel>(
          this as WalletEntryModel, _$identity);

  /// Serializes this WalletEntryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletEntryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.refType, refType) || other.refType == refType) &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, entryType, amount, refType, refId, note, createdDate);

  @override
  String toString() {
    return 'WalletEntryModel(id: $id, entryType: $entryType, amount: $amount, refType: $refType, refId: $refId, note: $note, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $WalletEntryModelCopyWith<$Res> {
  factory $WalletEntryModelCopyWith(
          WalletEntryModel value, $Res Function(WalletEntryModel) _then) =
      _$WalletEntryModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() @JsonKey(name: 'entry_type') String entryType,
      @DoubleJson() double amount,
      @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
      @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
      @StringOrNullJson() String? note,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$WalletEntryModelCopyWithImpl<$Res>
    implements $WalletEntryModelCopyWith<$Res> {
  _$WalletEntryModelCopyWithImpl(this._self, this._then);

  final WalletEntryModel _self;
  final $Res Function(WalletEntryModel) _then;

  /// Create a copy of WalletEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entryType = null,
    Object? amount = null,
    Object? refType = freezed,
    Object? refId = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      entryType: null == entryType
          ? _self.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      refType: freezed == refType
          ? _self.refType
          : refType // ignore: cast_nullable_to_non_nullable
              as String?,
      refId: freezed == refId
          ? _self.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WalletEntryModel].
extension WalletEntryModelPatterns on WalletEntryModel {
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
    TResult Function(_WalletEntryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel() when $default != null:
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
    TResult Function(_WalletEntryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel():
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
    TResult? Function(_WalletEntryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel() when $default != null:
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
            @StringJson() @JsonKey(name: 'entry_type') String entryType,
            @DoubleJson() double amount,
            @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
            @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
            @StringOrNullJson() String? note,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel() when $default != null:
        return $default(_that.id, _that.entryType, _that.amount, _that.refType,
            _that.refId, _that.note, _that.createdDate);
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
            @StringJson() @JsonKey(name: 'entry_type') String entryType,
            @DoubleJson() double amount,
            @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
            @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
            @StringOrNullJson() String? note,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel():
        return $default(_that.id, _that.entryType, _that.amount, _that.refType,
            _that.refId, _that.note, _that.createdDate);
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
            @StringJson() @JsonKey(name: 'entry_type') String entryType,
            @DoubleJson() double amount,
            @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
            @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
            @StringOrNullJson() String? note,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletEntryModel() when $default != null:
        return $default(_that.id, _that.entryType, _that.amount, _that.refType,
            _that.refId, _that.note, _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WalletEntryModel extends WalletEntryModel {
  const _WalletEntryModel(
      {@IntJson() required this.id,
      @StringJson() @JsonKey(name: 'entry_type') this.entryType = '',
      @DoubleJson() this.amount = 0,
      @StringOrNullJson() @JsonKey(name: 'ref_type') this.refType,
      @IntOrNullJson() @JsonKey(name: 'ref_id') this.refId,
      @StringOrNullJson() this.note,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : super._();
  factory _WalletEntryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletEntryModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringJson()
  @JsonKey(name: 'entry_type')
  final String entryType;

  /// Sudah bertanda: pengeluaran datang negatif (`"-1339000.00"`). Jangan
  /// dibalik sendiri di UI — cukup tampilkan apa adanya.
  @override
  @JsonKey()
  @DoubleJson()
  final double amount;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'ref_type')
  final String? refType;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'ref_id')
  final int? refId;
  @override
  @StringOrNullJson()
  final String? note;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of WalletEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WalletEntryModelCopyWith<_WalletEntryModel> get copyWith =>
      __$WalletEntryModelCopyWithImpl<_WalletEntryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WalletEntryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletEntryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.refType, refType) || other.refType == refType) &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, entryType, amount, refType, refId, note, createdDate);

  @override
  String toString() {
    return 'WalletEntryModel(id: $id, entryType: $entryType, amount: $amount, refType: $refType, refId: $refId, note: $note, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$WalletEntryModelCopyWith<$Res>
    implements $WalletEntryModelCopyWith<$Res> {
  factory _$WalletEntryModelCopyWith(
          _WalletEntryModel value, $Res Function(_WalletEntryModel) _then) =
      __$WalletEntryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() @JsonKey(name: 'entry_type') String entryType,
      @DoubleJson() double amount,
      @StringOrNullJson() @JsonKey(name: 'ref_type') String? refType,
      @IntOrNullJson() @JsonKey(name: 'ref_id') int? refId,
      @StringOrNullJson() String? note,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$WalletEntryModelCopyWithImpl<$Res>
    implements _$WalletEntryModelCopyWith<$Res> {
  __$WalletEntryModelCopyWithImpl(this._self, this._then);

  final _WalletEntryModel _self;
  final $Res Function(_WalletEntryModel) _then;

  /// Create a copy of WalletEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? entryType = null,
    Object? amount = null,
    Object? refType = freezed,
    Object? refId = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_WalletEntryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      entryType: null == entryType
          ? _self.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      refType: freezed == refType
          ? _self.refType
          : refType // ignore: cast_nullable_to_non_nullable
              as String?,
      refId: freezed == refId
          ? _self.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
