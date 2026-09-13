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
  @StringJson()
  @JsonKey(name: 'access_token')
  String get accessToken;
  @StringOrNullJson()
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @IntOrNullJson()
  @JsonKey(name: 'expires_in')
  int? get expiresIn;

  /// UU PDP: kebijakan privasi berubah dan user harus menyetujui ulang.
  /// Sesi tetap sah, tapi aplikasi wajib menampilkan layar persetujuan.
  @BoolJson()
  @JsonKey(name: 'requires_reconsent')
  bool get requiresReconsent;

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
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.requiresReconsent, requiresReconsent) ||
                other.requiresReconsent == requiresReconsent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, expiresIn, requiresReconsent);

  @override
  String toString() {
    return 'AuthSessionModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, requiresReconsent: $requiresReconsent)';
  }
}

/// @nodoc
abstract mixin class $AuthSessionModelCopyWith<$Res> {
  factory $AuthSessionModelCopyWith(
          AuthSessionModel value, $Res Function(AuthSessionModel) _then) =
      _$AuthSessionModelCopyWithImpl;
  @useResult
  $Res call(
      {@StringJson() @JsonKey(name: 'access_token') String accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') String? refreshToken,
      @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
      @BoolJson() @JsonKey(name: 'requires_reconsent') bool requiresReconsent});
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
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? requiresReconsent = null,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      requiresReconsent: null == requiresReconsent
          ? _self.requiresReconsent
          : requiresReconsent // ignore: cast_nullable_to_non_nullable
              as bool,
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
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @BoolJson()
            @JsonKey(name: 'requires_reconsent')
            bool requiresReconsent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.requiresReconsent);
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
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @BoolJson()
            @JsonKey(name: 'requires_reconsent')
            bool requiresReconsent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel():
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.requiresReconsent);
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
            @StringJson() @JsonKey(name: 'access_token') String accessToken,
            @StringOrNullJson()
            @JsonKey(name: 'refresh_token')
            String? refreshToken,
            @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
            @BoolJson()
            @JsonKey(name: 'requires_reconsent')
            bool requiresReconsent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.requiresReconsent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthSessionModel extends AuthSessionModel {
  const _AuthSessionModel(
      {@StringJson() @JsonKey(name: 'access_token') required this.accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') this.refreshToken,
      @IntOrNullJson() @JsonKey(name: 'expires_in') this.expiresIn,
      @BoolJson()
      @JsonKey(name: 'requires_reconsent')
      this.requiresReconsent = false})
      : super._();
  factory _AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  @override
  @StringJson()
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  /// UU PDP: kebijakan privasi berubah dan user harus menyetujui ulang.
  /// Sesi tetap sah, tapi aplikasi wajib menampilkan layar persetujuan.
  @override
  @BoolJson()
  @JsonKey(name: 'requires_reconsent')
  final bool requiresReconsent;

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
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.requiresReconsent, requiresReconsent) ||
                other.requiresReconsent == requiresReconsent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, expiresIn, requiresReconsent);

  @override
  String toString() {
    return 'AuthSessionModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, requiresReconsent: $requiresReconsent)';
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
      {@StringJson() @JsonKey(name: 'access_token') String accessToken,
      @StringOrNullJson() @JsonKey(name: 'refresh_token') String? refreshToken,
      @IntOrNullJson() @JsonKey(name: 'expires_in') int? expiresIn,
      @BoolJson() @JsonKey(name: 'requires_reconsent') bool requiresReconsent});
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
    Object? accessToken = null,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? requiresReconsent = null,
  }) {
    return _then(_AuthSessionModel(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      requiresReconsent: null == requiresReconsent
          ? _self.requiresReconsent
          : requiresReconsent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$RegisterResultModel {
  @IntJson()
  @JsonKey(name: 'user_id')
  int get userId;

  /// Hanya ada saat backend berjalan dalam mode dev. Jangan pernah
  /// ditampilkan ke user — ini token verifikasi yang di produksi dikirim
  /// lewat email.
  @StringOrNullJson()
  @JsonKey(name: 'dev_verification_token')
  String? get devVerificationToken;

  /// Create a copy of RegisterResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterResultModelCopyWith<RegisterResultModel> get copyWith =>
      _$RegisterResultModelCopyWithImpl<RegisterResultModel>(
          this as RegisterResultModel, _$identity);

  /// Serializes this RegisterResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterResultModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.devVerificationToken, devVerificationToken) ||
                other.devVerificationToken == devVerificationToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, devVerificationToken);

  @override
  String toString() {
    return 'RegisterResultModel(userId: $userId, devVerificationToken: $devVerificationToken)';
  }
}

/// @nodoc
abstract mixin class $RegisterResultModelCopyWith<$Res> {
  factory $RegisterResultModelCopyWith(
          RegisterResultModel value, $Res Function(RegisterResultModel) _then) =
      _$RegisterResultModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'user_id') int userId,
      @StringOrNullJson()
      @JsonKey(name: 'dev_verification_token')
      String? devVerificationToken});
}

/// @nodoc
class _$RegisterResultModelCopyWithImpl<$Res>
    implements $RegisterResultModelCopyWith<$Res> {
  _$RegisterResultModelCopyWithImpl(this._self, this._then);

  final RegisterResultModel _self;
  final $Res Function(RegisterResultModel) _then;

  /// Create a copy of RegisterResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? devVerificationToken = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      devVerificationToken: freezed == devVerificationToken
          ? _self.devVerificationToken
          : devVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RegisterResultModel].
extension RegisterResultModelPatterns on RegisterResultModel {
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
    TResult Function(_RegisterResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel() when $default != null:
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
    TResult Function(_RegisterResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel():
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
    TResult? Function(_RegisterResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel() when $default != null:
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
            @StringOrNullJson()
            @JsonKey(name: 'dev_verification_token')
            String? devVerificationToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel() when $default != null:
        return $default(_that.userId, _that.devVerificationToken);
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
            @StringOrNullJson()
            @JsonKey(name: 'dev_verification_token')
            String? devVerificationToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel():
        return $default(_that.userId, _that.devVerificationToken);
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
            @StringOrNullJson()
            @JsonKey(name: 'dev_verification_token')
            String? devVerificationToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegisterResultModel() when $default != null:
        return $default(_that.userId, _that.devVerificationToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RegisterResultModel extends RegisterResultModel {
  const _RegisterResultModel(
      {@IntJson() @JsonKey(name: 'user_id') required this.userId,
      @StringOrNullJson()
      @JsonKey(name: 'dev_verification_token')
      this.devVerificationToken})
      : super._();
  factory _RegisterResultModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultModelFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'user_id')
  final int userId;

  /// Hanya ada saat backend berjalan dalam mode dev. Jangan pernah
  /// ditampilkan ke user — ini token verifikasi yang di produksi dikirim
  /// lewat email.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'dev_verification_token')
  final String? devVerificationToken;

  /// Create a copy of RegisterResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterResultModelCopyWith<_RegisterResultModel> get copyWith =>
      __$RegisterResultModelCopyWithImpl<_RegisterResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterResultModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.devVerificationToken, devVerificationToken) ||
                other.devVerificationToken == devVerificationToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, devVerificationToken);

  @override
  String toString() {
    return 'RegisterResultModel(userId: $userId, devVerificationToken: $devVerificationToken)';
  }
}

/// @nodoc
abstract mixin class _$RegisterResultModelCopyWith<$Res>
    implements $RegisterResultModelCopyWith<$Res> {
  factory _$RegisterResultModelCopyWith(_RegisterResultModel value,
          $Res Function(_RegisterResultModel) _then) =
      __$RegisterResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'user_id') int userId,
      @StringOrNullJson()
      @JsonKey(name: 'dev_verification_token')
      String? devVerificationToken});
}

/// @nodoc
class __$RegisterResultModelCopyWithImpl<$Res>
    implements _$RegisterResultModelCopyWith<$Res> {
  __$RegisterResultModelCopyWithImpl(this._self, this._then);

  final _RegisterResultModel _self;
  final $Res Function(_RegisterResultModel) _then;

  /// Create a copy of RegisterResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? devVerificationToken = freezed,
  }) {
    return _then(_RegisterResultModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      devVerificationToken: freezed == devVerificationToken
          ? _self.devVerificationToken
          : devVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
