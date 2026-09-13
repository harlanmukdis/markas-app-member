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
  int get id;
  @StringOrNullJson()
  String? get email;
  @StringOrNullJson()
  String? get phone;
  @StringOrNullJson()
  @JsonKey(name: 'full_name')
  String? get fullName;
  @StringOrNullJson()
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// `pending_verification` / `active` / `suspended` / `banned` — huruf
  /// kecil di API ini, berbeda dari API lama yang memakai huruf besar.
  ///
  /// **Inilah penanda terverifikasi yang benar**, bukan [emailVerified].
  /// Akun baru lahir sebagai `pending_verification`, dan
  /// `POST /auth/verify-email` mengubahnya jadi `active`.
  @StringJson()
  String get status;

  /// Dikirim sebagai `"0"`/`"1"` (tinyint), bukan boolean JSON.
  ///
  /// 🔴 **Jangan dipakai sebagai penanda verifikasi.** Sudah diuji ke
  /// server: `verify-email` menaikkan [status] ke `active` tapi
  /// membiarkan kolom ini `"0"` selamanya. Aplikasi yang menunggu nilai ini
  /// berubah akan menahan user di layar "verifikasi dulu" tanpa jalan
  /// keluar. Pakai [isVerified].
  @BoolJson()
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @BoolJson()
  @JsonKey(name: 'phone_verified')
  bool get phoneVerified;

  /// API ini memakai `created_at` secara konsisten di seluruh endpoint —
  /// tidak ada lagi campuran `created_date`/`created_at` seperti backend
  /// sebelumnya.
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  List<UserRoleModel> get roles;
  List<UserStoreModel> get stores;

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
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.roles, roles) &&
            const DeepCollectionEquality().equals(other.stores, stores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      phone,
      fullName,
      avatarUrl,
      status,
      emailVerified,
      phoneVerified,
      createdAt,
      const DeepCollectionEquality().hash(roles),
      const DeepCollectionEquality().hash(stores));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, phone: $phone, fullName: $fullName, avatarUrl: $avatarUrl, status: $status, emailVerified: $emailVerified, phoneVerified: $phoneVerified, createdAt: $createdAt, roles: $roles, stores: $stores)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() String? email,
      @StringOrNullJson() String? phone,
      @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,
      @StringOrNullJson() @JsonKey(name: 'avatar_url') String? avatarUrl,
      @StringJson() String status,
      @BoolJson() @JsonKey(name: 'email_verified') bool emailVerified,
      @BoolJson() @JsonKey(name: 'phone_verified') bool phoneVerified,
      @ServerDateTimeJson() @JsonKey(name: 'created_at') DateTime? createdAt,
      List<UserRoleModel> roles,
      List<UserStoreModel> stores});
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
    Object? email = freezed,
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? createdAt = freezed,
    Object? roles = null,
    Object? stores = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _self.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roles: null == roles
          ? _self.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleModel>,
      stores: null == stores
          ? _self.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<UserStoreModel>,
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
            @IntJson() int id,
            @StringOrNullJson() String? email,
            @StringOrNullJson() String? phone,
            @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,
            @StringOrNullJson() @JsonKey(name: 'avatar_url') String? avatarUrl,
            @StringJson() String status,
            @BoolJson() @JsonKey(name: 'email_verified') bool emailVerified,
            @BoolJson() @JsonKey(name: 'phone_verified') bool phoneVerified,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            List<UserRoleModel> roles,
            List<UserStoreModel> stores)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.phone,
            _that.fullName,
            _that.avatarUrl,
            _that.status,
            _that.emailVerified,
            _that.phoneVerified,
            _that.createdAt,
            _that.roles,
            _that.stores);
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
            @StringOrNullJson() String? email,
            @StringOrNullJson() String? phone,
            @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,
            @StringOrNullJson() @JsonKey(name: 'avatar_url') String? avatarUrl,
            @StringJson() String status,
            @BoolJson() @JsonKey(name: 'email_verified') bool emailVerified,
            @BoolJson() @JsonKey(name: 'phone_verified') bool phoneVerified,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            List<UserRoleModel> roles,
            List<UserStoreModel> stores)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.id,
            _that.email,
            _that.phone,
            _that.fullName,
            _that.avatarUrl,
            _that.status,
            _that.emailVerified,
            _that.phoneVerified,
            _that.createdAt,
            _that.roles,
            _that.stores);
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
            @StringOrNullJson() String? email,
            @StringOrNullJson() String? phone,
            @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,
            @StringOrNullJson() @JsonKey(name: 'avatar_url') String? avatarUrl,
            @StringJson() String status,
            @BoolJson() @JsonKey(name: 'email_verified') bool emailVerified,
            @BoolJson() @JsonKey(name: 'phone_verified') bool phoneVerified,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            List<UserRoleModel> roles,
            List<UserStoreModel> stores)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.phone,
            _that.fullName,
            _that.avatarUrl,
            _that.status,
            _that.emailVerified,
            _that.phoneVerified,
            _that.createdAt,
            _that.roles,
            _that.stores);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel extends UserModel {
  const _UserModel(
      {@IntJson() required this.id,
      @StringOrNullJson() this.email,
      @StringOrNullJson() this.phone,
      @StringOrNullJson() @JsonKey(name: 'full_name') this.fullName,
      @StringOrNullJson() @JsonKey(name: 'avatar_url') this.avatarUrl,
      @StringJson() this.status = '',
      @BoolJson() @JsonKey(name: 'email_verified') this.emailVerified = false,
      @BoolJson() @JsonKey(name: 'phone_verified') this.phoneVerified = false,
      @ServerDateTimeJson() @JsonKey(name: 'created_at') this.createdAt,
      final List<UserRoleModel> roles = const <UserRoleModel>[],
      final List<UserStoreModel> stores = const <UserStoreModel>[]})
      : _roles = roles,
        _stores = stores,
        super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  final String? email;
  @override
  @StringOrNullJson()
  final String? phone;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  /// `pending_verification` / `active` / `suspended` / `banned` — huruf
  /// kecil di API ini, berbeda dari API lama yang memakai huruf besar.
  ///
  /// **Inilah penanda terverifikasi yang benar**, bukan [emailVerified].
  /// Akun baru lahir sebagai `pending_verification`, dan
  /// `POST /auth/verify-email` mengubahnya jadi `active`.
  @override
  @JsonKey()
  @StringJson()
  final String status;

  /// Dikirim sebagai `"0"`/`"1"` (tinyint), bukan boolean JSON.
  ///
  /// 🔴 **Jangan dipakai sebagai penanda verifikasi.** Sudah diuji ke
  /// server: `verify-email` menaikkan [status] ke `active` tapi
  /// membiarkan kolom ini `"0"` selamanya. Aplikasi yang menunggu nilai ini
  /// berubah akan menahan user di layar "verifikasi dulu" tanpa jalan
  /// keluar. Pakai [isVerified].
  @override
  @BoolJson()
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  @BoolJson()
  @JsonKey(name: 'phone_verified')
  final bool phoneVerified;

  /// API ini memakai `created_at` secara konsisten di seluruh endpoint —
  /// tidak ada lagi campuran `created_date`/`created_at` seperti backend
  /// sebelumnya.
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final List<UserRoleModel> _roles;
  @override
  @JsonKey()
  List<UserRoleModel> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  final List<UserStoreModel> _stores;
  @override
  @JsonKey()
  List<UserStoreModel> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

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
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other._stores, _stores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      phone,
      fullName,
      avatarUrl,
      status,
      emailVerified,
      phoneVerified,
      createdAt,
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(_stores));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, phone: $phone, fullName: $fullName, avatarUrl: $avatarUrl, status: $status, emailVerified: $emailVerified, phoneVerified: $phoneVerified, createdAt: $createdAt, roles: $roles, stores: $stores)';
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
      {@IntJson() int id,
      @StringOrNullJson() String? email,
      @StringOrNullJson() String? phone,
      @StringOrNullJson() @JsonKey(name: 'full_name') String? fullName,
      @StringOrNullJson() @JsonKey(name: 'avatar_url') String? avatarUrl,
      @StringJson() String status,
      @BoolJson() @JsonKey(name: 'email_verified') bool emailVerified,
      @BoolJson() @JsonKey(name: 'phone_verified') bool phoneVerified,
      @ServerDateTimeJson() @JsonKey(name: 'created_at') DateTime? createdAt,
      List<UserRoleModel> roles,
      List<UserStoreModel> stores});
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
    Object? email = freezed,
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? createdAt = freezed,
    Object? roles = null,
    Object? stores = null,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _self.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roles: null == roles
          ? _self._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleModel>,
      stores: null == stores
          ? _self._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<UserStoreModel>,
    ));
  }
}

/// @nodoc
mixin _$UserRoleModel {
  @StringJson()
  String get code;
  @StringOrNullJson()
  String? get name;

  /// Create a copy of UserRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRoleModelCopyWith<UserRoleModel> get copyWith =>
      _$UserRoleModelCopyWithImpl<UserRoleModel>(
          this as UserRoleModel, _$identity);

  /// Serializes this UserRoleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRoleModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'UserRoleModel(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class $UserRoleModelCopyWith<$Res> {
  factory $UserRoleModelCopyWith(
          UserRoleModel value, $Res Function(UserRoleModel) _then) =
      _$UserRoleModelCopyWithImpl;
  @useResult
  $Res call({@StringJson() String code, @StringOrNullJson() String? name});
}

/// @nodoc
class _$UserRoleModelCopyWithImpl<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  _$UserRoleModelCopyWithImpl(this._self, this._then);

  final UserRoleModel _self;
  final $Res Function(UserRoleModel) _then;

  /// Create a copy of UserRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserRoleModel].
extension UserRoleModelPatterns on UserRoleModel {
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
    TResult Function(_UserRoleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel() when $default != null:
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
    TResult Function(_UserRoleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel():
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
    TResult? Function(_UserRoleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel() when $default != null:
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
            @StringJson() String code, @StringOrNullJson() String? name)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel() when $default != null:
        return $default(_that.code, _that.name);
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
            @StringJson() String code, @StringOrNullJson() String? name)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel():
        return $default(_that.code, _that.name);
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
            @StringJson() String code, @StringOrNullJson() String? name)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRoleModel() when $default != null:
        return $default(_that.code, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserRoleModel implements UserRoleModel {
  const _UserRoleModel(
      {@StringJson() this.code = '', @StringOrNullJson() this.name});
  factory _UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  @override
  @JsonKey()
  @StringJson()
  final String code;
  @override
  @StringOrNullJson()
  final String? name;

  /// Create a copy of UserRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRoleModelCopyWith<_UserRoleModel> get copyWith =>
      __$UserRoleModelCopyWithImpl<_UserRoleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRoleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRoleModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'UserRoleModel(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$UserRoleModelCopyWith<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  factory _$UserRoleModelCopyWith(
          _UserRoleModel value, $Res Function(_UserRoleModel) _then) =
      __$UserRoleModelCopyWithImpl;
  @override
  @useResult
  $Res call({@StringJson() String code, @StringOrNullJson() String? name});
}

/// @nodoc
class __$UserRoleModelCopyWithImpl<$Res>
    implements _$UserRoleModelCopyWith<$Res> {
  __$UserRoleModelCopyWithImpl(this._self, this._then);

  final _UserRoleModel _self;
  final $Res Function(_UserRoleModel) _then;

  /// Create a copy of UserRoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = freezed,
  }) {
    return _then(_UserRoleModel(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UserStoreModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  String? get name;
  @StringOrNullJson()
  String? get slug;
  @StringOrNullJson()
  String? get status;

  /// Create a copy of UserStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserStoreModelCopyWith<UserStoreModel> get copyWith =>
      _$UserStoreModelCopyWithImpl<UserStoreModel>(
          this as UserStoreModel, _$identity);

  /// Serializes this UserStoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, status);

  @override
  String toString() {
    return 'UserStoreModel(id: $id, name: $name, slug: $slug, status: $status)';
  }
}

/// @nodoc
abstract mixin class $UserStoreModelCopyWith<$Res> {
  factory $UserStoreModelCopyWith(
          UserStoreModel value, $Res Function(UserStoreModel) _then) =
      _$UserStoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() String? name,
      @StringOrNullJson() String? slug,
      @StringOrNullJson() String? status});
}

/// @nodoc
class _$UserStoreModelCopyWithImpl<$Res>
    implements $UserStoreModelCopyWith<$Res> {
  _$UserStoreModelCopyWithImpl(this._self, this._then);

  final UserStoreModel _self;
  final $Res Function(UserStoreModel) _then;

  /// Create a copy of UserStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserStoreModel].
extension UserStoreModelPatterns on UserStoreModel {
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
    TResult Function(_UserStoreModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel() when $default != null:
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
    TResult Function(_UserStoreModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel():
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
    TResult? Function(_UserStoreModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel() when $default != null:
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
            @StringOrNullJson() String? name,
            @StringOrNullJson() String? slug,
            @StringOrNullJson() String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.status);
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
            @StringOrNullJson() String? name,
            @StringOrNullJson() String? slug,
            @StringOrNullJson() String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel():
        return $default(_that.id, _that.name, _that.slug, _that.status);
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
            @StringOrNullJson() String? name,
            @StringOrNullJson() String? slug,
            @StringOrNullJson() String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserStoreModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserStoreModel implements UserStoreModel {
  const _UserStoreModel(
      {@IntJson() required this.id,
      @StringOrNullJson() this.name,
      @StringOrNullJson() this.slug,
      @StringOrNullJson() this.status});
  factory _UserStoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserStoreModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  final String? name;
  @override
  @StringOrNullJson()
  final String? slug;
  @override
  @StringOrNullJson()
  final String? status;

  /// Create a copy of UserStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserStoreModelCopyWith<_UserStoreModel> get copyWith =>
      __$UserStoreModelCopyWithImpl<_UserStoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserStoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserStoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, status);

  @override
  String toString() {
    return 'UserStoreModel(id: $id, name: $name, slug: $slug, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$UserStoreModelCopyWith<$Res>
    implements $UserStoreModelCopyWith<$Res> {
  factory _$UserStoreModelCopyWith(
          _UserStoreModel value, $Res Function(_UserStoreModel) _then) =
      __$UserStoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() String? name,
      @StringOrNullJson() String? slug,
      @StringOrNullJson() String? status});
}

/// @nodoc
class __$UserStoreModelCopyWithImpl<$Res>
    implements _$UserStoreModelCopyWith<$Res> {
  __$UserStoreModelCopyWithImpl(this._self, this._then);

  final _UserStoreModel _self;
  final $Res Function(_UserStoreModel) _then;

  /// Create a copy of UserStoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
    Object? status = freezed,
  }) {
    return _then(_UserStoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
