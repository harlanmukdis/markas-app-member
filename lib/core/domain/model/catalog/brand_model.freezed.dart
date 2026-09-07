// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BrandModel {
  @IntJson()
  int get id;
  @StringJson()
  String get name;
  @StringOrNullJson()
  String? get slug;

  /// Merek bersertifikat (SNI dan sejenisnya).
  ///
  /// Relevan untuk kategori berisiko — besi, semen, kabel — di mana merek
  /// palsu bukan soal selera tapi soal keselamatan bangunan. Dikirim
  /// sebagai `"1"`/`"0"`.
  @BoolJson()
  @JsonKey(name: 'is_certified')
  bool get isCertified;
  @StringOrNullJson()
  @JsonKey(name: 'logo_url')
  String? get logoUrl;

  /// Jumlah penawaran aktif bermerek ini. `0` berarti merek terdaftar tapi
  /// belum ada barangnya — jangan ditampilkan sebagai filter.
  @IntJson()
  @JsonKey(name: 'offer_count')
  int get offerCount;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrandModelCopyWith<BrandModel> get copyWith =>
      _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrandModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isCertified, isCertified) ||
                other.isCertified == isCertified) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.offerCount, offerCount) ||
                other.offerCount == offerCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, isCertified, logoUrl, offerCount);

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, slug: $slug, isCertified: $isCertified, logoUrl: $logoUrl, offerCount: $offerCount)';
  }
}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res> {
  factory $BrandModelCopyWith(
          BrandModel value, $Res Function(BrandModel) _then) =
      _$BrandModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() String name,
      @StringOrNullJson() String? slug,
      @BoolJson() @JsonKey(name: 'is_certified') bool isCertified,
      @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,
      @IntJson() @JsonKey(name: 'offer_count') int offerCount});
}

/// @nodoc
class _$BrandModelCopyWithImpl<$Res> implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._self, this._then);

  final BrandModel _self;
  final $Res Function(BrandModel) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? isCertified = null,
    Object? logoUrl = freezed,
    Object? offerCount = null,
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
      isCertified: null == isCertified
          ? _self.isCertified
          : isCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: freezed == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      offerCount: null == offerCount
          ? _self.offerCount
          : offerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [BrandModel].
extension BrandModelPatterns on BrandModel {
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
    TResult Function(_BrandModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandModel() when $default != null:
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
    TResult Function(_BrandModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandModel():
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
    TResult? Function(_BrandModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandModel() when $default != null:
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
            @BoolJson() @JsonKey(name: 'is_certified') bool isCertified,
            @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,
            @IntJson() @JsonKey(name: 'offer_count') int offerCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BrandModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.isCertified,
            _that.logoUrl, _that.offerCount);
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
            @BoolJson() @JsonKey(name: 'is_certified') bool isCertified,
            @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,
            @IntJson() @JsonKey(name: 'offer_count') int offerCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandModel():
        return $default(_that.id, _that.name, _that.slug, _that.isCertified,
            _that.logoUrl, _that.offerCount);
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
            @BoolJson() @JsonKey(name: 'is_certified') bool isCertified,
            @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,
            @IntJson() @JsonKey(name: 'offer_count') int offerCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BrandModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.isCertified,
            _that.logoUrl, _that.offerCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BrandModel extends BrandModel {
  const _BrandModel(
      {@IntJson() required this.id,
      @StringJson() required this.name,
      @StringOrNullJson() this.slug,
      @BoolJson() @JsonKey(name: 'is_certified') this.isCertified = false,
      @StringOrNullJson() @JsonKey(name: 'logo_url') this.logoUrl,
      @IntJson() @JsonKey(name: 'offer_count') this.offerCount = 0})
      : super._();
  factory _BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringJson()
  final String name;
  @override
  @StringOrNullJson()
  final String? slug;

  /// Merek bersertifikat (SNI dan sejenisnya).
  ///
  /// Relevan untuk kategori berisiko — besi, semen, kabel — di mana merek
  /// palsu bukan soal selera tapi soal keselamatan bangunan. Dikirim
  /// sebagai `"1"`/`"0"`.
  @override
  @BoolJson()
  @JsonKey(name: 'is_certified')
  final bool isCertified;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  /// Jumlah penawaran aktif bermerek ini. `0` berarti merek terdaftar tapi
  /// belum ada barangnya — jangan ditampilkan sebagai filter.
  @override
  @IntJson()
  @JsonKey(name: 'offer_count')
  final int offerCount;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BrandModelCopyWith<_BrandModel> get copyWith =>
      __$BrandModelCopyWithImpl<_BrandModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BrandModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrandModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isCertified, isCertified) ||
                other.isCertified == isCertified) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.offerCount, offerCount) ||
                other.offerCount == offerCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, isCertified, logoUrl, offerCount);

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, slug: $slug, isCertified: $isCertified, logoUrl: $logoUrl, offerCount: $offerCount)';
  }
}

/// @nodoc
abstract mixin class _$BrandModelCopyWith<$Res>
    implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(
          _BrandModel value, $Res Function(_BrandModel) _then) =
      __$BrandModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() String name,
      @StringOrNullJson() String? slug,
      @BoolJson() @JsonKey(name: 'is_certified') bool isCertified,
      @StringOrNullJson() @JsonKey(name: 'logo_url') String? logoUrl,
      @IntJson() @JsonKey(name: 'offer_count') int offerCount});
}

/// @nodoc
class __$BrandModelCopyWithImpl<$Res> implements _$BrandModelCopyWith<$Res> {
  __$BrandModelCopyWithImpl(this._self, this._then);

  final _BrandModel _self;
  final $Res Function(_BrandModel) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? isCertified = null,
    Object? logoUrl = freezed,
    Object? offerCount = null,
  }) {
    return _then(_BrandModel(
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
      isCertified: null == isCertified
          ? _self.isCertified
          : isCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: freezed == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      offerCount: null == offerCount
          ? _self.offerCount
          : offerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$OfferFacetsModel {
  @IntOrNullJson()
  @JsonKey(name: 'price_min')
  int? get priceMin;
  @IntOrNullJson()
  @JsonKey(name: 'price_max')
  int? get priceMax;

  /// Jumlah penawaran dengan rating **≥ N**, ber-key `"5"`..`"1"`.
  ///
  /// Kumulatif, bukan histogram: nilai pada `"4"` sudah mencakup yang
  /// berating 5. Menampilkannya sebagai batang histogram akan menyesatkan.
  @JsonKey(name: 'rating_counts')
  Map<String, int> get ratingCounts;
  List<FacetBrand> get brands;

  /// Create a copy of OfferFacetsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfferFacetsModelCopyWith<OfferFacetsModel> get copyWith =>
      _$OfferFacetsModelCopyWithImpl<OfferFacetsModel>(
          this as OfferFacetsModel, _$identity);

  /// Serializes this OfferFacetsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfferFacetsModel &&
            (identical(other.priceMin, priceMin) ||
                other.priceMin == priceMin) &&
            (identical(other.priceMax, priceMax) ||
                other.priceMax == priceMax) &&
            const DeepCollectionEquality()
                .equals(other.ratingCounts, ratingCounts) &&
            const DeepCollectionEquality().equals(other.brands, brands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      priceMin,
      priceMax,
      const DeepCollectionEquality().hash(ratingCounts),
      const DeepCollectionEquality().hash(brands));

  @override
  String toString() {
    return 'OfferFacetsModel(priceMin: $priceMin, priceMax: $priceMax, ratingCounts: $ratingCounts, brands: $brands)';
  }
}

/// @nodoc
abstract mixin class $OfferFacetsModelCopyWith<$Res> {
  factory $OfferFacetsModelCopyWith(
          OfferFacetsModel value, $Res Function(OfferFacetsModel) _then) =
      _$OfferFacetsModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
      @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,
      @JsonKey(name: 'rating_counts') Map<String, int> ratingCounts,
      List<FacetBrand> brands});
}

/// @nodoc
class _$OfferFacetsModelCopyWithImpl<$Res>
    implements $OfferFacetsModelCopyWith<$Res> {
  _$OfferFacetsModelCopyWithImpl(this._self, this._then);

  final OfferFacetsModel _self;
  final $Res Function(OfferFacetsModel) _then;

  /// Create a copy of OfferFacetsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? ratingCounts = null,
    Object? brands = null,
  }) {
    return _then(_self.copyWith(
      priceMin: freezed == priceMin
          ? _self.priceMin
          : priceMin // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMax: freezed == priceMax
          ? _self.priceMax
          : priceMax // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCounts: null == ratingCounts
          ? _self.ratingCounts
          : ratingCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      brands: null == brands
          ? _self.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<FacetBrand>,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfferFacetsModel].
extension OfferFacetsModelPatterns on OfferFacetsModel {
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
    TResult Function(_OfferFacetsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel() when $default != null:
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
    TResult Function(_OfferFacetsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel():
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
    TResult? Function(_OfferFacetsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
            @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,
            @JsonKey(name: 'rating_counts') Map<String, int> ratingCounts,
            List<FacetBrand> brands)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel() when $default != null:
        return $default(
            _that.priceMin, _that.priceMax, _that.ratingCounts, _that.brands);
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
            @IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
            @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,
            @JsonKey(name: 'rating_counts') Map<String, int> ratingCounts,
            List<FacetBrand> brands)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel():
        return $default(
            _that.priceMin, _that.priceMax, _that.ratingCounts, _that.brands);
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
            @IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
            @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,
            @JsonKey(name: 'rating_counts') Map<String, int> ratingCounts,
            List<FacetBrand> brands)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferFacetsModel() when $default != null:
        return $default(
            _that.priceMin, _that.priceMax, _that.ratingCounts, _that.brands);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OfferFacetsModel extends OfferFacetsModel {
  const _OfferFacetsModel(
      {@IntOrNullJson() @JsonKey(name: 'price_min') this.priceMin,
      @IntOrNullJson() @JsonKey(name: 'price_max') this.priceMax,
      @JsonKey(name: 'rating_counts')
      final Map<String, int> ratingCounts = const <String, int>{},
      final List<FacetBrand> brands = const <FacetBrand>[]})
      : _ratingCounts = ratingCounts,
        _brands = brands,
        super._();
  factory _OfferFacetsModel.fromJson(Map<String, dynamic> json) =>
      _$OfferFacetsModelFromJson(json);

  @override
  @IntOrNullJson()
  @JsonKey(name: 'price_min')
  final int? priceMin;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'price_max')
  final int? priceMax;

  /// Jumlah penawaran dengan rating **≥ N**, ber-key `"5"`..`"1"`.
  ///
  /// Kumulatif, bukan histogram: nilai pada `"4"` sudah mencakup yang
  /// berating 5. Menampilkannya sebagai batang histogram akan menyesatkan.
  final Map<String, int> _ratingCounts;

  /// Jumlah penawaran dengan rating **≥ N**, ber-key `"5"`..`"1"`.
  ///
  /// Kumulatif, bukan histogram: nilai pada `"4"` sudah mencakup yang
  /// berating 5. Menampilkannya sebagai batang histogram akan menyesatkan.
  @override
  @JsonKey(name: 'rating_counts')
  Map<String, int> get ratingCounts {
    if (_ratingCounts is EqualUnmodifiableMapView) return _ratingCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ratingCounts);
  }

  final List<FacetBrand> _brands;
  @override
  @JsonKey()
  List<FacetBrand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  /// Create a copy of OfferFacetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfferFacetsModelCopyWith<_OfferFacetsModel> get copyWith =>
      __$OfferFacetsModelCopyWithImpl<_OfferFacetsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfferFacetsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfferFacetsModel &&
            (identical(other.priceMin, priceMin) ||
                other.priceMin == priceMin) &&
            (identical(other.priceMax, priceMax) ||
                other.priceMax == priceMax) &&
            const DeepCollectionEquality()
                .equals(other._ratingCounts, _ratingCounts) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      priceMin,
      priceMax,
      const DeepCollectionEquality().hash(_ratingCounts),
      const DeepCollectionEquality().hash(_brands));

  @override
  String toString() {
    return 'OfferFacetsModel(priceMin: $priceMin, priceMax: $priceMax, ratingCounts: $ratingCounts, brands: $brands)';
  }
}

/// @nodoc
abstract mixin class _$OfferFacetsModelCopyWith<$Res>
    implements $OfferFacetsModelCopyWith<$Res> {
  factory _$OfferFacetsModelCopyWith(
          _OfferFacetsModel value, $Res Function(_OfferFacetsModel) _then) =
      __$OfferFacetsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntOrNullJson() @JsonKey(name: 'price_min') int? priceMin,
      @IntOrNullJson() @JsonKey(name: 'price_max') int? priceMax,
      @JsonKey(name: 'rating_counts') Map<String, int> ratingCounts,
      List<FacetBrand> brands});
}

/// @nodoc
class __$OfferFacetsModelCopyWithImpl<$Res>
    implements _$OfferFacetsModelCopyWith<$Res> {
  __$OfferFacetsModelCopyWithImpl(this._self, this._then);

  final _OfferFacetsModel _self;
  final $Res Function(_OfferFacetsModel) _then;

  /// Create a copy of OfferFacetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? ratingCounts = null,
    Object? brands = null,
  }) {
    return _then(_OfferFacetsModel(
      priceMin: freezed == priceMin
          ? _self.priceMin
          : priceMin // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMax: freezed == priceMax
          ? _self.priceMax
          : priceMax // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCounts: null == ratingCounts
          ? _self._ratingCounts
          : ratingCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      brands: null == brands
          ? _self._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<FacetBrand>,
    ));
  }
}

/// @nodoc
mixin _$FacetBrand {
  @IntJson()
  int get id;
  @StringJson()
  String get name;
  @IntJson()
  int get cnt;

  /// Create a copy of FacetBrand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacetBrandCopyWith<FacetBrand> get copyWith =>
      _$FacetBrandCopyWithImpl<FacetBrand>(this as FacetBrand, _$identity);

  /// Serializes this FacetBrand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacetBrand &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cnt, cnt) || other.cnt == cnt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, cnt);

  @override
  String toString() {
    return 'FacetBrand(id: $id, name: $name, cnt: $cnt)';
  }
}

/// @nodoc
abstract mixin class $FacetBrandCopyWith<$Res> {
  factory $FacetBrandCopyWith(
          FacetBrand value, $Res Function(FacetBrand) _then) =
      _$FacetBrandCopyWithImpl;
  @useResult
  $Res call({@IntJson() int id, @StringJson() String name, @IntJson() int cnt});
}

/// @nodoc
class _$FacetBrandCopyWithImpl<$Res> implements $FacetBrandCopyWith<$Res> {
  _$FacetBrandCopyWithImpl(this._self, this._then);

  final FacetBrand _self;
  final $Res Function(FacetBrand) _then;

  /// Create a copy of FacetBrand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cnt = null,
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
      cnt: null == cnt
          ? _self.cnt
          : cnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacetBrand].
extension FacetBrandPatterns on FacetBrand {
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
    TResult Function(_FacetBrand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacetBrand() when $default != null:
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
    TResult Function(_FacetBrand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacetBrand():
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
    TResult? Function(_FacetBrand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacetBrand() when $default != null:
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
            @IntJson() int id, @StringJson() String name, @IntJson() int cnt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacetBrand() when $default != null:
        return $default(_that.id, _that.name, _that.cnt);
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
            @IntJson() int id, @StringJson() String name, @IntJson() int cnt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacetBrand():
        return $default(_that.id, _that.name, _that.cnt);
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
            @IntJson() int id, @StringJson() String name, @IntJson() int cnt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacetBrand() when $default != null:
        return $default(_that.id, _that.name, _that.cnt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacetBrand implements FacetBrand {
  const _FacetBrand(
      {@IntJson() required this.id,
      @StringJson() required this.name,
      @IntJson() this.cnt = 0});
  factory _FacetBrand.fromJson(Map<String, dynamic> json) =>
      _$FacetBrandFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringJson()
  final String name;
  @override
  @JsonKey()
  @IntJson()
  final int cnt;

  /// Create a copy of FacetBrand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacetBrandCopyWith<_FacetBrand> get copyWith =>
      __$FacetBrandCopyWithImpl<_FacetBrand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacetBrandToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacetBrand &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cnt, cnt) || other.cnt == cnt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, cnt);

  @override
  String toString() {
    return 'FacetBrand(id: $id, name: $name, cnt: $cnt)';
  }
}

/// @nodoc
abstract mixin class _$FacetBrandCopyWith<$Res>
    implements $FacetBrandCopyWith<$Res> {
  factory _$FacetBrandCopyWith(
          _FacetBrand value, $Res Function(_FacetBrand) _then) =
      __$FacetBrandCopyWithImpl;
  @override
  @useResult
  $Res call({@IntJson() int id, @StringJson() String name, @IntJson() int cnt});
}

/// @nodoc
class __$FacetBrandCopyWithImpl<$Res> implements _$FacetBrandCopyWith<$Res> {
  __$FacetBrandCopyWithImpl(this._self, this._then);

  final _FacetBrand _self;
  final $Res Function(_FacetBrand) _then;

  /// Create a copy of FacetBrand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cnt = null,
  }) {
    return _then(_FacetBrand(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cnt: null == cnt
          ? _self.cnt
          : cnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
