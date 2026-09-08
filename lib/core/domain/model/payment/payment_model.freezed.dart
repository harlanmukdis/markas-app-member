// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'payment_no')
  String? get paymentNo;
  @IntOrNullJson()
  @JsonKey(name: 'order_id')
  int? get orderId;
  @StringOrNullJson()
  String? get method;
  @IntJson()
  int get amount;
  @StringJson()
  String get status;

  /// **Mock penuh** di backend saat ini: `va_number` dan `qris_payload`
  /// adalah string palsu, bukan instrumen pembayaran sungguhan. Alur bisa
  /// dites end-to-end, tapi jangan tampilkan ke user asli.
  @StringOrNullJson()
  @JsonKey(name: 'va_number')
  String? get vaNumber;
  @StringOrNullJson()
  @JsonKey(name: 'qris_payload')
  String? get qrisPayload;

  /// Batas bayar. Terkena bug jam 5 jam di backend v2.2 — tampilkan
  /// absolut, jangan hitung mundur presisi.
  @ServerDateTimeJson()
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @ServerDateTimeJson()
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;

  /// Perhatikan: endpoint pembayaran **masih mengirim `created_at`**, bukan
  /// `created_date` seperti endpoint lain — backend meng-alias kolomnya di
  /// `C_Payments.php`. Inkonsistensi ini juga berlaku untuk
  /// `/chat/messages`. Dibaca lewat [_readPaymentCreated] supaya benar
  /// untuk kedua ejaan, dan tetap benar kalau nanti diseragamkan.
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
  DateTime? get createdDate;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      _$PaymentModelCopyWithImpl<PaymentModel>(
          this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentNo,
      orderId,
      method,
      amount,
      status,
      vaNumber,
      qrisPayload,
      expiresAt,
      verifiedAt,
      createdDate);

  @override
  String toString() {
    return 'PaymentModel(id: $id, paymentNo: $paymentNo, orderId: $orderId, method: $method, amount: $amount, status: $status, vaNumber: $vaNumber, qrisPayload: $qrisPayload, expiresAt: $expiresAt, verifiedAt: $verifiedAt, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) _then) =
      _$PaymentModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
      @StringOrNullJson() String? method,
      @IntJson() int amount,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
      DateTime? createdDate});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res> implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentNo = freezed,
    Object? orderId = freezed,
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
      paymentNo: freezed == paymentNo
          ? _self.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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

/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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
    TResult Function(_PaymentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentModel() when $default != null:
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
    TResult Function(_PaymentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModel():
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
    TResult? Function(_PaymentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModel() when $default != null:
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
            @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
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
            @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.paymentNo,
            _that.orderId,
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
            @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
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
            @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModel():
        return $default(
            _that.id,
            _that.paymentNo,
            _that.orderId,
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
            @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
            @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
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
            @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentModel() when $default != null:
        return $default(
            _that.id,
            _that.paymentNo,
            _that.orderId,
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
class _PaymentModel extends PaymentModel {
  const _PaymentModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'payment_no') this.paymentNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') this.orderId,
      @StringOrNullJson() this.method,
      @IntJson() this.amount = 0,
      @StringJson() this.status = '',
      @StringOrNullJson() @JsonKey(name: 'va_number') this.vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') this.qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') this.expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') this.verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
      this.createdDate})
      : super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'payment_no')
  final String? paymentNo;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'order_id')
  final int? orderId;
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

  /// **Mock penuh** di backend saat ini: `va_number` dan `qris_payload`
  /// adalah string palsu, bukan instrumen pembayaran sungguhan. Alur bisa
  /// dites end-to-end, tapi jangan tampilkan ke user asli.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'va_number')
  final String? vaNumber;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'qris_payload')
  final String? qrisPayload;

  /// Batas bayar. Terkena bug jam 5 jam di backend v2.2 — tampilkan
  /// absolut, jangan hitung mundur presisi.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;

  /// Perhatikan: endpoint pembayaran **masih mengirim `created_at`**, bukan
  /// `created_date` seperti endpoint lain — backend meng-alias kolomnya di
  /// `C_Payments.php`. Inkonsistensi ini juga berlaku untuk
  /// `/chat/messages`. Dibaca lewat [_readPaymentCreated] supaya benar
  /// untuk kedua ejaan, dan tetap benar kalau nanti diseragamkan.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
  final DateTime? createdDate;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentModelCopyWith<_PaymentModel> get copyWith =>
      __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentNo,
      orderId,
      method,
      amount,
      status,
      vaNumber,
      qrisPayload,
      expiresAt,
      verifiedAt,
      createdDate);

  @override
  String toString() {
    return 'PaymentModel(id: $id, paymentNo: $paymentNo, orderId: $orderId, method: $method, amount: $amount, status: $status, vaNumber: $vaNumber, qrisPayload: $qrisPayload, expiresAt: $expiresAt, verifiedAt: $verifiedAt, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(
          _PaymentModel value, $Res Function(_PaymentModel) _then) =
      __$PaymentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'payment_no') String? paymentNo,
      @IntOrNullJson() @JsonKey(name: 'order_id') int? orderId,
      @StringOrNullJson() String? method,
      @IntJson() int amount,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'va_number') String? vaNumber,
      @StringOrNullJson() @JsonKey(name: 'qris_payload') String? qrisPayload,
      @ServerDateTimeJson() @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @ServerDateTimeJson() @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_at', readValue: _readPaymentCreated)
      DateTime? createdDate});
}

/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? paymentNo = freezed,
    Object? orderId = freezed,
    Object? method = freezed,
    Object? amount = null,
    Object? status = null,
    Object? vaNumber = freezed,
    Object? qrisPayload = freezed,
    Object? expiresAt = freezed,
    Object? verifiedAt = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_PaymentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentNo: freezed == paymentNo
          ? _self.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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

// dart format on
