// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  @IntJson()
  @JsonKey(name: 'seq', readValue: _readUserId)
  int get id;
  @StringJson()
  String get phone;
  @StringOrNullJson()
  String? get email;
  @StringOrNullJson()
  @JsonKey(name: 'name', readValue: _readUserName)
  String? get fullName;

  /// `BUY_R` (retail) atau `BUY_B` (B2B/kontraktor).
  @StringJson()
  String get role;

  /// `RETAIL` atau `B2B`. Server yang menentukan segmen harga saat checkout
  /// dari kolom ini — **tidak bisa dikirim dari client**.
  @StringOrNullJson()
  @JsonKey(name: 'buyer_segment')
  String? get buyerSegment;
  @StringOrNullJson()
  String? get npwp;
  @StringOrNullJson()
  @JsonKey(name: 'nib_siup_no')
  String? get nibSiupNo;

  /// Terisi kalau berkas B2B sudah diverifikasi admin.
  @ServerDateTimeJson()
  @JsonKey(name: 'b2b_verified_at')
  DateTime? get b2bVerifiedAt;
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  int? get sellerId;

  /// `ACTIVE` atau `SUSPENDED`.
  @StringJson()
  String
      get status; // Backend v2.2 mengganti nama kolom waktu: `created_at`/`updated_at`
// HILANG TOTAL dari semua respons, diganti `created_date`/
// `modified_date`. Nama Dart-nya ikut diselaraskan supaya tidak ada
// celah antara nama field di kode dan di API.
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;
  @ServerDateTimeJson()
  @JsonKey(name: 'modified_date')
  DateTime? get modifiedDate;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.buyerSegment, buyerSegment) ||
                other.buyerSegment == buyerSegment) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.nibSiupNo, nibSiupNo) ||
                other.nibSiupNo == nibSiupNo) &&
            (identical(other.b2bVerifiedAt, b2bVerifiedAt) ||
                other.b2bVerifiedAt == b2bVerifiedAt) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phone,
      email,
      fullName,
      role,
      buyerSegment,
      npwp,
      nibSiupNo,
      b2bVerifiedAt,
      sellerId,
      status,
      createdDate,
      modifiedDate);

  @override
  String toString() {
    return 'UserModel(id: $id, phone: $phone, email: $email, fullName: $fullName, role: $role, buyerSegment: $buyerSegment, npwp: $npwp, nibSiupNo: $nibSiupNo, b2bVerifiedAt: $b2bVerifiedAt, sellerId: $sellerId, status: $status, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'seq', readValue: _readUserId) int id,
      @StringJson() String phone,
      @StringOrNullJson() String? email,
      @StringOrNullJson()
      @JsonKey(name: 'name', readValue: _readUserName)
      String? fullName,
      @StringJson() String role,
      @StringOrNullJson() @JsonKey(name: 'buyer_segment') String? buyerSegment,
      @StringOrNullJson() String? npwp,
      @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'b2b_verified_at')
      DateTime? b2bVerifiedAt,
      @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @StringJson() String status,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      @ServerDateTimeJson()
      @JsonKey(name: 'modified_date')
      DateTime? modifiedDate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = null,
    Object? buyerSegment = freezed,
    Object? npwp = freezed,
    Object? nibSiupNo = freezed,
    Object? b2bVerifiedAt = freezed,
    Object? sellerId = freezed,
    Object? status = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      buyerSegment: freezed == buyerSegment
          ? _self.buyerSegment
          : buyerSegment // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _self.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      nibSiupNo: freezed == nibSiupNo
          ? _self.nibSiupNo
          : nibSiupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      b2bVerifiedAt: freezed == b2bVerifiedAt
          ? _self.b2bVerifiedAt
          : b2bVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _self.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
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
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
            @IntJson() @JsonKey(name: 'seq', readValue: _readUserId) int id,
            @StringJson() String phone,
            @StringOrNullJson() String? email,
            @StringOrNullJson()
            @JsonKey(name: 'name', readValue: _readUserName)
            String? fullName,
            @StringJson() String role,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment')
            String? buyerSegment,
            @StringOrNullJson() String? npwp,
            @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'b2b_verified_at')
            DateTime? b2bVerifiedAt,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.phone,
            _that.email,
            _that.fullName,
            _that.role,
            _that.buyerSegment,
            _that.npwp,
            _that.nibSiupNo,
            _that.b2bVerifiedAt,
            _that.sellerId,
            _that.status,
            _that.createdDate,
            _that.modifiedDate);
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
            @IntJson() @JsonKey(name: 'seq', readValue: _readUserId) int id,
            @StringJson() String phone,
            @StringOrNullJson() String? email,
            @StringOrNullJson()
            @JsonKey(name: 'name', readValue: _readUserName)
            String? fullName,
            @StringJson() String role,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment')
            String? buyerSegment,
            @StringOrNullJson() String? npwp,
            @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'b2b_verified_at')
            DateTime? b2bVerifiedAt,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.id,
            _that.phone,
            _that.email,
            _that.fullName,
            _that.role,
            _that.buyerSegment,
            _that.npwp,
            _that.nibSiupNo,
            _that.b2bVerifiedAt,
            _that.sellerId,
            _that.status,
            _that.createdDate,
            _that.modifiedDate);
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
            @IntJson() @JsonKey(name: 'seq', readValue: _readUserId) int id,
            @StringJson() String phone,
            @StringOrNullJson() String? email,
            @StringOrNullJson()
            @JsonKey(name: 'name', readValue: _readUserName)
            String? fullName,
            @StringJson() String role,
            @StringOrNullJson()
            @JsonKey(name: 'buyer_segment')
            String? buyerSegment,
            @StringOrNullJson() String? npwp,
            @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,
            @ServerDateTimeJson()
            @JsonKey(name: 'b2b_verified_at')
            DateTime? b2bVerifiedAt,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringJson() String status,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.phone,
            _that.email,
            _that.fullName,
            _that.role,
            _that.buyerSegment,
            _that.npwp,
            _that.nibSiupNo,
            _that.b2bVerifiedAt,
            _that.sellerId,
            _that.status,
            _that.createdDate,
            _that.modifiedDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel extends UserModel {
  const _UserModel(
      {@IntJson()
      @JsonKey(name: 'seq', readValue: _readUserId)
      required this.id,
      @StringJson() required this.phone,
      @StringOrNullJson() this.email,
      @StringOrNullJson()
      @JsonKey(name: 'name', readValue: _readUserName)
      this.fullName,
      @StringJson() required this.role,
      @StringOrNullJson() @JsonKey(name: 'buyer_segment') this.buyerSegment,
      @StringOrNullJson() this.npwp,
      @StringOrNullJson() @JsonKey(name: 'nib_siup_no') this.nibSiupNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'b2b_verified_at')
      this.b2bVerifiedAt,
      @IntOrNullJson() @JsonKey(name: 'seller_id') this.sellerId,
      @StringJson() required this.status,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate,
      @ServerDateTimeJson() @JsonKey(name: 'modified_date') this.modifiedDate})
      : super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'seq', readValue: _readUserId)
  final int id;
  @override
  @StringJson()
  final String phone;
  @override
  @StringOrNullJson()
  final String? email;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'name', readValue: _readUserName)
  final String? fullName;

  /// `BUY_R` (retail) atau `BUY_B` (B2B/kontraktor).
  @override
  @StringJson()
  final String role;

  /// `RETAIL` atau `B2B`. Server yang menentukan segmen harga saat checkout
  /// dari kolom ini — **tidak bisa dikirim dari client**.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'buyer_segment')
  final String? buyerSegment;
  @override
  @StringOrNullJson()
  final String? npwp;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'nib_siup_no')
  final String? nibSiupNo;

  /// Terisi kalau berkas B2B sudah diverifikasi admin.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'b2b_verified_at')
  final DateTime? b2bVerifiedAt;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  final int? sellerId;

  /// `ACTIVE` atau `SUSPENDED`.
  @override
  @StringJson()
  final String status;
// Backend v2.2 mengganti nama kolom waktu: `created_at`/`updated_at`
// HILANG TOTAL dari semua respons, diganti `created_date`/
// `modified_date`. Nama Dart-nya ikut diselaraskan supaya tidak ada
// celah antara nama field di kode dan di API.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'modified_date')
  final DateTime? modifiedDate;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.buyerSegment, buyerSegment) ||
                other.buyerSegment == buyerSegment) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.nibSiupNo, nibSiupNo) ||
                other.nibSiupNo == nibSiupNo) &&
            (identical(other.b2bVerifiedAt, b2bVerifiedAt) ||
                other.b2bVerifiedAt == b2bVerifiedAt) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phone,
      email,
      fullName,
      role,
      buyerSegment,
      npwp,
      nibSiupNo,
      b2bVerifiedAt,
      sellerId,
      status,
      createdDate,
      modifiedDate);

  @override
  String toString() {
    return 'UserModel(id: $id, phone: $phone, email: $email, fullName: $fullName, role: $role, buyerSegment: $buyerSegment, npwp: $npwp, nibSiupNo: $nibSiupNo, b2bVerifiedAt: $b2bVerifiedAt, sellerId: $sellerId, status: $status, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'seq', readValue: _readUserId) int id,
      @StringJson() String phone,
      @StringOrNullJson() String? email,
      @StringOrNullJson()
      @JsonKey(name: 'name', readValue: _readUserName)
      String? fullName,
      @StringJson() String role,
      @StringOrNullJson() @JsonKey(name: 'buyer_segment') String? buyerSegment,
      @StringOrNullJson() String? npwp,
      @StringOrNullJson() @JsonKey(name: 'nib_siup_no') String? nibSiupNo,
      @ServerDateTimeJson()
      @JsonKey(name: 'b2b_verified_at')
      DateTime? b2bVerifiedAt,
      @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @StringJson() String status,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      @ServerDateTimeJson()
      @JsonKey(name: 'modified_date')
      DateTime? modifiedDate});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = null,
    Object? buyerSegment = freezed,
    Object? npwp = freezed,
    Object? nibSiupNo = freezed,
    Object? b2bVerifiedAt = freezed,
    Object? sellerId = freezed,
    Object? status = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      buyerSegment: freezed == buyerSegment
          ? _self.buyerSegment
          : buyerSegment // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _self.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      nibSiupNo: freezed == nibSiupNo
          ? _self.nibSiupNo
          : nibSiupNo // ignore: cast_nullable_to_non_nullable
              as String?,
      b2bVerifiedAt: freezed == b2bVerifiedAt
          ? _self.b2bVerifiedAt
          : b2bVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _self.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
