// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSessionModel {
  @IntJson()
  @JsonKey(name: 'user_id')
  int get userId;
  @StringJson()
  @JsonKey(name: 'access_token')
  String get accessToken;

  /// Hanya terisi dari `login`. `null` dari `register`.
  @StringOrNullJson()
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;

  /// `BUY_R` atau `BUY_B`. `null` dari `register` — backend tidak
  /// mengirimkannya di sana, jadi nilainya harus diambil dari apa yang
  /// dikirim client atau dari `GET /auth/me`.
  @StringOrNullJson()
  String? get role;
  @IntOrNullJson()
  @JsonKey(name: 'expires_in')
  int? get expiresIn;
  @StringOrNullJson()
  @JsonKey(name: 'token_type')
  String? get tokenType;

  /// Selalu `null` untuk member; hanya berisi untuk akun toko.
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  int? get sellerId;

  /// `MEMBER` / `MERCHANT` / `ADMIN`. Ditambahkan backend v2.2.
  ///
  /// Berguna untuk memutuskan aplikasi/rute awal, tapi **bukan** penentu
  /// menu B2B — itu tetap [role] (`BUY_R` vs `BUY_B`), karena keduanya
  /// sama-sama `MEMBER`.
  @StringOrNullJson()
  @JsonKey(name: 'actor_type')
  String? get actorType;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSessionModelCopyWith<AuthSessionModel> get copyWith =>
      _$AuthSessionModelCopyWithImpl<AuthSessionModel>(
          this as AuthSessionModel, _$identity);

  /// Serializes this AuthSessionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSessionModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.actorType, actorType) ||
                other.actorType == actorType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, accessToken,
      refreshToken, role, expiresIn, tokenType, sellerId, actorType);

  @override
  String toString() {
    return 'AuthSessionModel(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken, role: $role, expiresIn: $expiresIn, tokenType: $tokenType, sellerId: $sellerId, actorType: $actorType)';
  }
}

/// @nodoc
abstract mixin class $AuthSessionModelCopyWith<$Res> {
  factory $AuthSessionModelCopyWith(
          AuthSessionModel value, $Res Function(AuthSessionModel) _then) =
      _$AuthSessionModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'user_id') int userId,
      @StringJson() @JsonKey(name: 'access_token') String accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') String? refreshToken,
      @StringOrNullJson() String? role,
      @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
      @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,
      @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType});
}

/// @nodoc
class _$AuthSessionModelCopyWithImpl<$Res>
    implements $AuthSessionModelCopyWith<$Res> {
  _$AuthSessionModelCopyWithImpl(this._self, this._then);

  final AuthSessionModel _self;
  final $Res Function(AuthSessionModel) _then;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? role = freezed,
    Object? expiresIn = freezed,
    Object? tokenType = freezed,
    Object? sellerId = freezed,
    Object? actorType = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorType: freezed == actorType
          ? _self.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuthSessionModel].
extension AuthSessionModelPatterns on AuthSessionModel {
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
    TResult Function(_AuthSessionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
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
    TResult Function(_AuthSessionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel():
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
    TResult? Function(_AuthSessionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
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
            @IntJson() @JsonKey(name: 'user_id') int userId,
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @StringOrNullJson() String? role,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(
            _that.userId,
            _that.accessToken,
            _that.refreshToken,
            _that.role,
            _that.expiresIn,
            _that.tokenType,
            _that.sellerId,
            _that.actorType);
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
            @IntJson() @JsonKey(name: 'user_id') int userId,
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @StringOrNullJson() String? role,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel():
        return $default(
            _that.userId,
            _that.accessToken,
            _that.refreshToken,
            _that.role,
            _that.expiresIn,
            _that.tokenType,
            _that.sellerId,
            _that.actorType);
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
            @IntJson() @JsonKey(name: 'user_id') int userId,
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @StringOrNullJson() String? role,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(
            _that.userId,
            _that.accessToken,
            _that.refreshToken,
            _that.role,
            _that.expiresIn,
            _that.tokenType,
            _that.sellerId,
            _that.actorType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthSessionModel implements AuthSessionModel {
  const _AuthSessionModel(
      {@IntJson() @JsonKey(name: 'user_id') required this.userId,
      @StringJson() @JsonKey(name: 'access_token') required this.accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') this.refreshToken,
      @StringOrNullJson() this.role,
      @IntOrNullJson() @JsonKey(name: 'expires_in') this.expiresIn,
      @StringOrNullJson() @JsonKey(name: 'token_type') this.tokenType,
      @IntOrNullJson() @JsonKey(name: 'seller_id') this.sellerId,
      @StringOrNullJson() @JsonKey(name: 'actor_type') this.actorType});
  factory _AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @StringJson()
  @JsonKey(name: 'access_token')
  final String accessToken;

  /// Hanya terisi dari `login`. `null` dari `register`.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  /// `BUY_R` atau `BUY_B`. `null` dari `register` — backend tidak
  /// mengirimkannya di sana, jadi nilainya harus diambil dari apa yang
  /// dikirim client atau dari `GET /auth/me`.
  @override
  @StringOrNullJson()
  final String? role;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'token_type')
  final String? tokenType;

  /// Selalu `null` untuk member; hanya berisi untuk akun toko.
  @override
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  final int? sellerId;

  /// `MEMBER` / `MERCHANT` / `ADMIN`. Ditambahkan backend v2.2.
  ///
  /// Berguna untuk memutuskan aplikasi/rute awal, tapi **bukan** penentu
  /// menu B2B — itu tetap [role] (`BUY_R` vs `BUY_B`), karena keduanya
  /// sama-sama `MEMBER`.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'actor_type')
  final String? actorType;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionModelCopyWith<_AuthSessionModel> get copyWith =>
      __$AuthSessionModelCopyWithImpl<_AuthSessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthSessionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSessionModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.actorType, actorType) ||
                other.actorType == actorType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, accessToken,
      refreshToken, role, expiresIn, tokenType, sellerId, actorType);

  @override
  String toString() {
    return 'AuthSessionModel(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken, role: $role, expiresIn: $expiresIn, tokenType: $tokenType, sellerId: $sellerId, actorType: $actorType)';
  }
}

/// @nodoc
abstract mixin class _$AuthSessionModelCopyWith<$Res>
    implements $AuthSessionModelCopyWith<$Res> {
  factory _$AuthSessionModelCopyWith(
          _AuthSessionModel value, $Res Function(_AuthSessionModel) _then) =
      __$AuthSessionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'user_id') int userId,
      @StringJson() @JsonKey(name: 'access_token') String accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') String? refreshToken,
      @StringOrNullJson() String? role,
      @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
      @StringOrNullJson() @JsonKey(name: 'token_type') String? tokenType,
      @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @StringOrNullJson() @JsonKey(name: 'actor_type') String? actorType});
}

/// @nodoc
class __$AuthSessionModelCopyWithImpl<$Res>
    implements _$AuthSessionModelCopyWith<$Res> {
  __$AuthSessionModelCopyWithImpl(this._self, this._then);

  final _AuthSessionModel _self;
  final $Res Function(_AuthSessionModel) _then;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? role = freezed,
    Object? expiresIn = freezed,
    Object? tokenType = freezed,
    Object? sellerId = freezed,
    Object? actorType = freezed,
  }) {
    return _then(_AuthSessionModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenType: freezed == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      actorType: freezed == actorType
          ? _self.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
