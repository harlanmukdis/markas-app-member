// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerModel {
  @IntJson()
  int get id;
  @StringJson()
  String get name;
  @StringOrNullJson()
  String? get slug;
  @BoolJson()
  @JsonKey(name: 'is_official_store')
  bool get isOfficialStore;

  /// `TOKO` atau `DISTRIBUTOR` — **murni pembeda tampilan**. Mekanika
  /// onboarding, katalog, dan ordernya identik.
  @StringOrNullJson()
  @JsonKey(name: 'seller_type')
  String? get sellerType;
  @DoubleOrNullJson()
  double? get score;

  /// Create a copy of SellerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SellerModelCopyWith<SellerModel> get copyWith =>
      _$SellerModelCopyWithImpl<SellerModel>(this as SellerModel, _$identity);

  /// Serializes this SellerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SellerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isOfficialStore, isOfficialStore) ||
                other.isOfficialStore == isOfficialStore) &&
            (identical(other.sellerType, sellerType) ||
                other.sellerType == sellerType) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, isOfficialStore, sellerType, score);

  @override
  String toString() {
    return 'SellerModel(id: $id, name: $name, slug: $slug, isOfficialStore: $isOfficialStore, sellerType: $sellerType, score: $score)';
  }
}

/// @nodoc
abstract mixin class $SellerModelCopyWith<$Res> {
  factory $SellerModelCopyWith(
          SellerModel value, $Res Function(SellerModel) _then) =
      _$SellerModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() String name,
      @StringOrNullJson() String? slug,
      @BoolJson() @JsonKey(name: 'is_official_store') bool isOfficialStore,
      @StringOrNullJson() @JsonKey(name: 'seller_type') String? sellerType,
      @DoubleOrNullJson() double? score});
}

/// @nodoc
class _$SellerModelCopyWithImpl<$Res> implements $SellerModelCopyWith<$Res> {
  _$SellerModelCopyWithImpl(this._self, this._then);

  final SellerModel _self;
  final $Res Function(SellerModel) _then;

  /// Create a copy of SellerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? isOfficialStore = null,
    Object? sellerType = freezed,
    Object? score = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficialStore: null == isOfficialStore
          ? _self.isOfficialStore
          : isOfficialStore // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerType: freezed == sellerType
          ? _self.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SellerModel].
extension SellerModelPatterns on SellerModel {
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
    TResult Function(_SellerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SellerModel() when $default != null:
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
    TResult Function(_SellerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerModel():
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
    TResult? Function(_SellerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerModel() when $default != null:
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
            @StringJson() String name,
            @StringOrNullJson() String? slug,
            @BoolJson()
            @JsonKey(name: 'is_official_store')
            bool isOfficialStore,
            @StringOrNullJson()
            @JsonKey(name: 'seller_type')
            String? sellerType,
            @DoubleOrNullJson() double? score)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SellerModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.isOfficialStore,
            _that.sellerType, _that.score);
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
            @StringJson() String name,
            @StringOrNullJson() String? slug,
            @BoolJson()
            @JsonKey(name: 'is_official_store')
            bool isOfficialStore,
            @StringOrNullJson()
            @JsonKey(name: 'seller_type')
            String? sellerType,
            @DoubleOrNullJson() double? score)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerModel():
        return $default(_that.id, _that.name, _that.slug, _that.isOfficialStore,
            _that.sellerType, _that.score);
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
            @StringJson() String name,
            @StringOrNullJson() String? slug,
            @BoolJson()
            @JsonKey(name: 'is_official_store')
            bool isOfficialStore,
            @StringOrNullJson()
            @JsonKey(name: 'seller_type')
            String? sellerType,
            @DoubleOrNullJson() double? score)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.isOfficialStore,
            _that.sellerType, _that.score);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SellerModel extends SellerModel {
  const _SellerModel(
      {@IntJson() required this.id,
      @StringJson() required this.name,
      @StringOrNullJson() this.slug,
      @BoolJson()
      @JsonKey(name: 'is_official_store')
      this.isOfficialStore = false,
      @StringOrNullJson() @JsonKey(name: 'seller_type') this.sellerType,
      @DoubleOrNullJson() this.score})
      : super._();
  factory _SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringJson()
  final String name;
  @override
  @StringOrNullJson()
  final String? slug;
  @override
  @BoolJson()
  @JsonKey(name: 'is_official_store')
  final bool isOfficialStore;

  /// `TOKO` atau `DISTRIBUTOR` — **murni pembeda tampilan**. Mekanika
  /// onboarding, katalog, dan ordernya identik.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'seller_type')
  final String? sellerType;
  @override
  @DoubleOrNullJson()
  final double? score;

  /// Create a copy of SellerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SellerModelCopyWith<_SellerModel> get copyWith =>
      __$SellerModelCopyWithImpl<_SellerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SellerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SellerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isOfficialStore, isOfficialStore) ||
                other.isOfficialStore == isOfficialStore) &&
            (identical(other.sellerType, sellerType) ||
                other.sellerType == sellerType) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, isOfficialStore, sellerType, score);

  @override
  String toString() {
    return 'SellerModel(id: $id, name: $name, slug: $slug, isOfficialStore: $isOfficialStore, sellerType: $sellerType, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$SellerModelCopyWith<$Res>
    implements $SellerModelCopyWith<$Res> {
  factory _$SellerModelCopyWith(
          _SellerModel value, $Res Function(_SellerModel) _then) =
      __$SellerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() String name,
      @StringOrNullJson() String? slug,
      @BoolJson() @JsonKey(name: 'is_official_store') bool isOfficialStore,
      @StringOrNullJson() @JsonKey(name: 'seller_type') String? sellerType,
      @DoubleOrNullJson() double? score});
}

/// @nodoc
class __$SellerModelCopyWithImpl<$Res> implements _$SellerModelCopyWith<$Res> {
  __$SellerModelCopyWithImpl(this._self, this._then);

  final _SellerModel _self;
  final $Res Function(_SellerModel) _then;

  /// Create a copy of SellerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? isOfficialStore = null,
    Object? sellerType = freezed,
    Object? score = freezed,
  }) {
    return _then(_SellerModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficialStore: null == isOfficialStore
          ? _self.isOfficialStore
          : isOfficialStore // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerType: freezed == sellerType
          ? _self.sellerType
          : sellerType // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$SellerResponseRateModel {
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  int? get sellerId;
  @IntOrNullJson()
  @JsonKey(name: 'sample_size')
  int? get sampleSize;
  @DoubleOrNullJson()
  @JsonKey(name: 'avg_response_seconds')
  double? get avgResponseSeconds;
  @DoubleOrNullJson()
  @JsonKey(name: 'avg_response_minutes')
  double? get avgResponseMinutes;
  @StringOrNullJson()
  String? get note;

  /// Create a copy of SellerResponseRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SellerResponseRateModelCopyWith<SellerResponseRateModel> get copyWith =>
      _$SellerResponseRateModelCopyWithImpl<SellerResponseRateModel>(
          this as SellerResponseRateModel, _$identity);

  /// Serializes this SellerResponseRateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SellerResponseRateModel &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sampleSize, sampleSize) ||
                other.sampleSize == sampleSize) &&
            (identical(other.avgResponseSeconds, avgResponseSeconds) ||
                other.avgResponseSeconds == avgResponseSeconds) &&
            (identical(other.avgResponseMinutes, avgResponseMinutes) ||
                other.avgResponseMinutes == avgResponseMinutes) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sellerId, sampleSize,
      avgResponseSeconds, avgResponseMinutes, note);

  @override
  String toString() {
    return 'SellerResponseRateModel(sellerId: $sellerId, sampleSize: $sampleSize, avgResponseSeconds: $avgResponseSeconds, avgResponseMinutes: $avgResponseMinutes, note: $note)';
  }
}

/// @nodoc
abstract mixin class $SellerResponseRateModelCopyWith<$Res> {
  factory $SellerResponseRateModelCopyWith(SellerResponseRateModel value,
          $Res Function(SellerResponseRateModel) _then) =
      _$SellerResponseRateModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_seconds')
      double? avgResponseSeconds,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_minutes')
      double? avgResponseMinutes,
      @StringOrNullJson() String? note});
}

/// @nodoc
class _$SellerResponseRateModelCopyWithImpl<$Res>
    implements $SellerResponseRateModelCopyWith<$Res> {
  _$SellerResponseRateModelCopyWithImpl(this._self, this._then);

  final SellerResponseRateModel _self;
  final $Res Function(SellerResponseRateModel) _then;

  /// Create a copy of SellerResponseRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = freezed,
    Object? sampleSize = freezed,
    Object? avgResponseSeconds = freezed,
    Object? avgResponseMinutes = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleSize: freezed == sampleSize
          ? _self.sampleSize
          : sampleSize // ignore: cast_nullable_to_non_nullable
              as int?,
      avgResponseSeconds: freezed == avgResponseSeconds
          ? _self.avgResponseSeconds
          : avgResponseSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseMinutes: freezed == avgResponseMinutes
          ? _self.avgResponseMinutes
          : avgResponseMinutes // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SellerResponseRateModel].
extension SellerResponseRateModelPatterns on SellerResponseRateModel {
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
    TResult Function(_SellerResponseRateModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel() when $default != null:
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
    TResult Function(_SellerResponseRateModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel():
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
    TResult? Function(_SellerResponseRateModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_seconds')
            double? avgResponseSeconds,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_minutes')
            double? avgResponseMinutes,
            @StringOrNullJson() String? note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel() when $default != null:
        return $default(_that.sellerId, _that.sampleSize,
            _that.avgResponseSeconds, _that.avgResponseMinutes, _that.note);
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
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_seconds')
            double? avgResponseSeconds,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_minutes')
            double? avgResponseMinutes,
            @StringOrNullJson() String? note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel():
        return $default(_that.sellerId, _that.sampleSize,
            _that.avgResponseSeconds, _that.avgResponseMinutes, _that.note);
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
            @IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
            @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_seconds')
            double? avgResponseSeconds,
            @DoubleOrNullJson()
            @JsonKey(name: 'avg_response_minutes')
            double? avgResponseMinutes,
            @StringOrNullJson() String? note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SellerResponseRateModel() when $default != null:
        return $default(_that.sellerId, _that.sampleSize,
            _that.avgResponseSeconds, _that.avgResponseMinutes, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SellerResponseRateModel extends SellerResponseRateModel {
  const _SellerResponseRateModel(
      {@IntOrNullJson() @JsonKey(name: 'seller_id') this.sellerId,
      @IntOrNullJson() @JsonKey(name: 'sample_size') this.sampleSize,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_seconds')
      this.avgResponseSeconds,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_minutes')
      this.avgResponseMinutes,
      @StringOrNullJson() this.note})
      : super._();
  factory _SellerResponseRateModel.fromJson(Map<String, dynamic> json) =>
      _$SellerResponseRateModelFromJson(json);

  @override
  @IntOrNullJson()
  @JsonKey(name: 'seller_id')
  final int? sellerId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sample_size')
  final int? sampleSize;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'avg_response_seconds')
  final double? avgResponseSeconds;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'avg_response_minutes')
  final double? avgResponseMinutes;
  @override
  @StringOrNullJson()
  final String? note;

  /// Create a copy of SellerResponseRateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SellerResponseRateModelCopyWith<_SellerResponseRateModel> get copyWith =>
      __$SellerResponseRateModelCopyWithImpl<_SellerResponseRateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SellerResponseRateModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SellerResponseRateModel &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sampleSize, sampleSize) ||
                other.sampleSize == sampleSize) &&
            (identical(other.avgResponseSeconds, avgResponseSeconds) ||
                other.avgResponseSeconds == avgResponseSeconds) &&
            (identical(other.avgResponseMinutes, avgResponseMinutes) ||
                other.avgResponseMinutes == avgResponseMinutes) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sellerId, sampleSize,
      avgResponseSeconds, avgResponseMinutes, note);

  @override
  String toString() {
    return 'SellerResponseRateModel(sellerId: $sellerId, sampleSize: $sampleSize, avgResponseSeconds: $avgResponseSeconds, avgResponseMinutes: $avgResponseMinutes, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$SellerResponseRateModelCopyWith<$Res>
    implements $SellerResponseRateModelCopyWith<$Res> {
  factory _$SellerResponseRateModelCopyWith(_SellerResponseRateModel value,
          $Res Function(_SellerResponseRateModel) _then) =
      __$SellerResponseRateModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'seller_id') int? sellerId,
      @IntOrNullJson() @JsonKey(name: 'sample_size') int? sampleSize,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_seconds')
      double? avgResponseSeconds,
      @DoubleOrNullJson()
      @JsonKey(name: 'avg_response_minutes')
      double? avgResponseMinutes,
      @StringOrNullJson() String? note});
}

/// @nodoc
class __$SellerResponseRateModelCopyWithImpl<$Res>
    implements _$SellerResponseRateModelCopyWith<$Res> {
  __$SellerResponseRateModelCopyWithImpl(this._self, this._then);

  final _SellerResponseRateModel _self;
  final $Res Function(_SellerResponseRateModel) _then;

  /// Create a copy of SellerResponseRateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sellerId = freezed,
    Object? sampleSize = freezed,
    Object? avgResponseSeconds = freezed,
    Object? avgResponseMinutes = freezed,
    Object? note = freezed,
  }) {
    return _then(_SellerResponseRateModel(
      sellerId: freezed == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleSize: freezed == sampleSize
          ? _self.sampleSize
          : sampleSize // ignore: cast_nullable_to_non_nullable
              as int?,
      avgResponseSeconds: freezed == avgResponseSeconds
          ? _self.avgResponseSeconds
          : avgResponseSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseMinutes: freezed == avgResponseMinutes
          ? _self.avgResponseMinutes
          : avgResponseMinutes // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
