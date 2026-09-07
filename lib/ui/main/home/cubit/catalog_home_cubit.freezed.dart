// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogHomeState {
  CatalogHomeMode get mode;

  /// Kategori level 1. Dimuat sekali saat Home pertama dibuka.
  List<CategoryModel> get categories;

  /// Isi daftar untuk mode [CatalogHomeMode.searchResults] dan
  /// [CatalogHomeMode.categoryOffers].
  List<OfferModel> get offers;

  /// Nama SKU per id, untuk menamai penawaran jalur `MASTER` — `OfferModel`
  /// sendiri tidak membawa nama SKU, hanya `sku_id`.
  Map<int, SkuModel> get skus;

  /// Ringkasan rating per `offer_id`.
  ///
  /// Diambil sekali lewat `GET /offers/reviews-summary?ids=` untuk seluruh
  /// kartu yang tampil — bukan satu panggilan per kartu. Grid ini sudah
  /// membayar mahal untuk melengkapi harga; menambah N request lagi hanya
  /// untuk bintang akan membuatnya tidak bisa dipakai.
  Map<int, ReviewSummaryModel> get reviews;

  /// Nama toko per id, untuk penawaran yang tidak membawa `seller_name`
  /// (semua hasil `GET /offers`; hanya `GET /search` yang memuatnya).
  Map<int, String> get sellers;
  CategoryModel? get activeCategory;
  String get keyword;
  bool get isLoadingCategories;
  bool get isLoadingOffers;

  /// Kegagalan terakhir. Dipisah dari data supaya daftar yang sudah termuat
  /// tidak hilang hanya karena satu permintaan berikutnya gagal.
  DataError? get error;

  /// Jumlah penawaran yang tersedia di server, dari `meta.total_available`.
  /// Bisa lebih besar dari panjang [offers] karena harga hanya bisa
  /// dilengkapi sebagian per muat.
  int get totalAvailable;

  /// Permintaan selesai tapi hasilnya kosong — beda dari "belum dimuat".
  bool get isEmptyResult;

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CatalogHomeStateCopyWith<CatalogHomeState> get copyWith =>
      _$CatalogHomeStateCopyWithImpl<CatalogHomeState>(
          this as CatalogHomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CatalogHomeState &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.offers, offers) &&
            const DeepCollectionEquality().equals(other.skus, skus) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            const DeepCollectionEquality().equals(other.sellers, sellers) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            (identical(other.isLoadingOffers, isLoadingOffers) ||
                other.isLoadingOffers == isLoadingOffers) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.totalAvailable, totalAvailable) ||
                other.totalAvailable == totalAvailable) &&
            (identical(other.isEmptyResult, isEmptyResult) ||
                other.isEmptyResult == isEmptyResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(offers),
      const DeepCollectionEquality().hash(skus),
      const DeepCollectionEquality().hash(reviews),
      const DeepCollectionEquality().hash(sellers),
      activeCategory,
      keyword,
      isLoadingCategories,
      isLoadingOffers,
      error,
      totalAvailable,
      isEmptyResult);

  @override
  String toString() {
    return 'CatalogHomeState(mode: $mode, categories: $categories, offers: $offers, skus: $skus, reviews: $reviews, sellers: $sellers, activeCategory: $activeCategory, keyword: $keyword, isLoadingCategories: $isLoadingCategories, isLoadingOffers: $isLoadingOffers, error: $error, totalAvailable: $totalAvailable, isEmptyResult: $isEmptyResult)';
  }
}

/// @nodoc
abstract mixin class $CatalogHomeStateCopyWith<$Res> {
  factory $CatalogHomeStateCopyWith(
          CatalogHomeState value, $Res Function(CatalogHomeState) _then) =
      _$CatalogHomeStateCopyWithImpl;
  @useResult
  $Res call(
      {CatalogHomeMode mode,
      List<CategoryModel> categories,
      List<OfferModel> offers,
      Map<int, SkuModel> skus,
      Map<int, ReviewSummaryModel> reviews,
      Map<int, String> sellers,
      CategoryModel? activeCategory,
      String keyword,
      bool isLoadingCategories,
      bool isLoadingOffers,
      DataError? error,
      int totalAvailable,
      bool isEmptyResult});

  $CategoryModelCopyWith<$Res>? get activeCategory;
}

/// @nodoc
class _$CatalogHomeStateCopyWithImpl<$Res>
    implements $CatalogHomeStateCopyWith<$Res> {
  _$CatalogHomeStateCopyWithImpl(this._self, this._then);

  final CatalogHomeState _self;
  final $Res Function(CatalogHomeState) _then;

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? categories = null,
    Object? offers = null,
    Object? skus = null,
    Object? reviews = null,
    Object? sellers = null,
    Object? activeCategory = freezed,
    Object? keyword = null,
    Object? isLoadingCategories = null,
    Object? isLoadingOffers = null,
    Object? error = freezed,
    Object? totalAvailable = null,
    Object? isEmptyResult = null,
  }) {
    return _then(_self.copyWith(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as CatalogHomeMode,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      offers: null == offers
          ? _self.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      skus: null == skus
          ? _self.skus
          : skus // ignore: cast_nullable_to_non_nullable
              as Map<int, SkuModel>,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as Map<int, ReviewSummaryModel>,
      sellers: null == sellers
          ? _self.sellers
          : sellers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      activeCategory: freezed == activeCategory
          ? _self.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingCategories: null == isLoadingCategories
          ? _self.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingOffers: null == isLoadingOffers
          ? _self.isLoadingOffers
          : isLoadingOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      totalAvailable: null == totalAvailable
          ? _self.totalAvailable
          : totalAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      isEmptyResult: null == isEmptyResult
          ? _self.isEmptyResult
          : isEmptyResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get activeCategory {
    if (_self.activeCategory == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_self.activeCategory!, (value) {
      return _then(_self.copyWith(activeCategory: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CatalogHomeState].
extension CatalogHomeStatePatterns on CatalogHomeState {
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
    TResult Function(_CatalogHomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState() when $default != null:
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
    TResult Function(_CatalogHomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState():
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
    TResult? Function(_CatalogHomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState() when $default != null:
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
            CatalogHomeMode mode,
            List<CategoryModel> categories,
            List<OfferModel> offers,
            Map<int, SkuModel> skus,
            Map<int, ReviewSummaryModel> reviews,
            Map<int, String> sellers,
            CategoryModel? activeCategory,
            String keyword,
            bool isLoadingCategories,
            bool isLoadingOffers,
            DataError? error,
            int totalAvailable,
            bool isEmptyResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState() when $default != null:
        return $default(
            _that.mode,
            _that.categories,
            _that.offers,
            _that.skus,
            _that.reviews,
            _that.sellers,
            _that.activeCategory,
            _that.keyword,
            _that.isLoadingCategories,
            _that.isLoadingOffers,
            _that.error,
            _that.totalAvailable,
            _that.isEmptyResult);
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
            CatalogHomeMode mode,
            List<CategoryModel> categories,
            List<OfferModel> offers,
            Map<int, SkuModel> skus,
            Map<int, ReviewSummaryModel> reviews,
            Map<int, String> sellers,
            CategoryModel? activeCategory,
            String keyword,
            bool isLoadingCategories,
            bool isLoadingOffers,
            DataError? error,
            int totalAvailable,
            bool isEmptyResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState():
        return $default(
            _that.mode,
            _that.categories,
            _that.offers,
            _that.skus,
            _that.reviews,
            _that.sellers,
            _that.activeCategory,
            _that.keyword,
            _that.isLoadingCategories,
            _that.isLoadingOffers,
            _that.error,
            _that.totalAvailable,
            _that.isEmptyResult);
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
            CatalogHomeMode mode,
            List<CategoryModel> categories,
            List<OfferModel> offers,
            Map<int, SkuModel> skus,
            Map<int, ReviewSummaryModel> reviews,
            Map<int, String> sellers,
            CategoryModel? activeCategory,
            String keyword,
            bool isLoadingCategories,
            bool isLoadingOffers,
            DataError? error,
            int totalAvailable,
            bool isEmptyResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CatalogHomeState() when $default != null:
        return $default(
            _that.mode,
            _that.categories,
            _that.offers,
            _that.skus,
            _that.reviews,
            _that.sellers,
            _that.activeCategory,
            _that.keyword,
            _that.isLoadingCategories,
            _that.isLoadingOffers,
            _that.error,
            _that.totalAvailable,
            _that.isEmptyResult);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CatalogHomeState extends CatalogHomeState {
  const _CatalogHomeState(
      {this.mode = CatalogHomeMode.browse,
      final List<CategoryModel> categories = const <CategoryModel>[],
      final List<OfferModel> offers = const <OfferModel>[],
      final Map<int, SkuModel> skus = const <int, SkuModel>{},
      final Map<int, ReviewSummaryModel> reviews =
          const <int, ReviewSummaryModel>{},
      final Map<int, String> sellers = const <int, String>{},
      this.activeCategory,
      this.keyword = '',
      this.isLoadingCategories = false,
      this.isLoadingOffers = false,
      this.error,
      this.totalAvailable = 0,
      this.isEmptyResult = false})
      : _categories = categories,
        _offers = offers,
        _skus = skus,
        _reviews = reviews,
        _sellers = sellers,
        super._();

  @override
  @JsonKey()
  final CatalogHomeMode mode;

  /// Kategori level 1. Dimuat sekali saat Home pertama dibuka.
  final List<CategoryModel> _categories;

  /// Kategori level 1. Dimuat sekali saat Home pertama dibuka.
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Isi daftar untuk mode [CatalogHomeMode.searchResults] dan
  /// [CatalogHomeMode.categoryOffers].
  final List<OfferModel> _offers;

  /// Isi daftar untuk mode [CatalogHomeMode.searchResults] dan
  /// [CatalogHomeMode.categoryOffers].
  @override
  @JsonKey()
  List<OfferModel> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  /// Nama SKU per id, untuk menamai penawaran jalur `MASTER` — `OfferModel`
  /// sendiri tidak membawa nama SKU, hanya `sku_id`.
  final Map<int, SkuModel> _skus;

  /// Nama SKU per id, untuk menamai penawaran jalur `MASTER` — `OfferModel`
  /// sendiri tidak membawa nama SKU, hanya `sku_id`.
  @override
  @JsonKey()
  Map<int, SkuModel> get skus {
    if (_skus is EqualUnmodifiableMapView) return _skus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_skus);
  }

  /// Ringkasan rating per `offer_id`.
  ///
  /// Diambil sekali lewat `GET /offers/reviews-summary?ids=` untuk seluruh
  /// kartu yang tampil — bukan satu panggilan per kartu. Grid ini sudah
  /// membayar mahal untuk melengkapi harga; menambah N request lagi hanya
  /// untuk bintang akan membuatnya tidak bisa dipakai.
  final Map<int, ReviewSummaryModel> _reviews;

  /// Ringkasan rating per `offer_id`.
  ///
  /// Diambil sekali lewat `GET /offers/reviews-summary?ids=` untuk seluruh
  /// kartu yang tampil — bukan satu panggilan per kartu. Grid ini sudah
  /// membayar mahal untuk melengkapi harga; menambah N request lagi hanya
  /// untuk bintang akan membuatnya tidak bisa dipakai.
  @override
  @JsonKey()
  Map<int, ReviewSummaryModel> get reviews {
    if (_reviews is EqualUnmodifiableMapView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reviews);
  }

  /// Nama toko per id, untuk penawaran yang tidak membawa `seller_name`
  /// (semua hasil `GET /offers`; hanya `GET /search` yang memuatnya).
  final Map<int, String> _sellers;

  /// Nama toko per id, untuk penawaran yang tidak membawa `seller_name`
  /// (semua hasil `GET /offers`; hanya `GET /search` yang memuatnya).
  @override
  @JsonKey()
  Map<int, String> get sellers {
    if (_sellers is EqualUnmodifiableMapView) return _sellers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sellers);
  }

  @override
  final CategoryModel? activeCategory;
  @override
  @JsonKey()
  final String keyword;
  @override
  @JsonKey()
  final bool isLoadingCategories;
  @override
  @JsonKey()
  final bool isLoadingOffers;

  /// Kegagalan terakhir. Dipisah dari data supaya daftar yang sudah termuat
  /// tidak hilang hanya karena satu permintaan berikutnya gagal.
  @override
  final DataError? error;

  /// Jumlah penawaran yang tersedia di server, dari `meta.total_available`.
  /// Bisa lebih besar dari panjang [offers] karena harga hanya bisa
  /// dilengkapi sebagian per muat.
  @override
  @JsonKey()
  final int totalAvailable;

  /// Permintaan selesai tapi hasilnya kosong — beda dari "belum dimuat".
  @override
  @JsonKey()
  final bool isEmptyResult;

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CatalogHomeStateCopyWith<_CatalogHomeState> get copyWith =>
      __$CatalogHomeStateCopyWithImpl<_CatalogHomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CatalogHomeState &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            const DeepCollectionEquality().equals(other._skus, _skus) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._sellers, _sellers) &&
            (identical(other.activeCategory, activeCategory) ||
                other.activeCategory == activeCategory) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            (identical(other.isLoadingOffers, isLoadingOffers) ||
                other.isLoadingOffers == isLoadingOffers) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.totalAvailable, totalAvailable) ||
                other.totalAvailable == totalAvailable) &&
            (identical(other.isEmptyResult, isEmptyResult) ||
                other.isEmptyResult == isEmptyResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_offers),
      const DeepCollectionEquality().hash(_skus),
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_sellers),
      activeCategory,
      keyword,
      isLoadingCategories,
      isLoadingOffers,
      error,
      totalAvailable,
      isEmptyResult);

  @override
  String toString() {
    return 'CatalogHomeState(mode: $mode, categories: $categories, offers: $offers, skus: $skus, reviews: $reviews, sellers: $sellers, activeCategory: $activeCategory, keyword: $keyword, isLoadingCategories: $isLoadingCategories, isLoadingOffers: $isLoadingOffers, error: $error, totalAvailable: $totalAvailable, isEmptyResult: $isEmptyResult)';
  }
}

/// @nodoc
abstract mixin class _$CatalogHomeStateCopyWith<$Res>
    implements $CatalogHomeStateCopyWith<$Res> {
  factory _$CatalogHomeStateCopyWith(
          _CatalogHomeState value, $Res Function(_CatalogHomeState) _then) =
      __$CatalogHomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CatalogHomeMode mode,
      List<CategoryModel> categories,
      List<OfferModel> offers,
      Map<int, SkuModel> skus,
      Map<int, ReviewSummaryModel> reviews,
      Map<int, String> sellers,
      CategoryModel? activeCategory,
      String keyword,
      bool isLoadingCategories,
      bool isLoadingOffers,
      DataError? error,
      int totalAvailable,
      bool isEmptyResult});

  @override
  $CategoryModelCopyWith<$Res>? get activeCategory;
}

/// @nodoc
class __$CatalogHomeStateCopyWithImpl<$Res>
    implements _$CatalogHomeStateCopyWith<$Res> {
  __$CatalogHomeStateCopyWithImpl(this._self, this._then);

  final _CatalogHomeState _self;
  final $Res Function(_CatalogHomeState) _then;

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
    Object? categories = null,
    Object? offers = null,
    Object? skus = null,
    Object? reviews = null,
    Object? sellers = null,
    Object? activeCategory = freezed,
    Object? keyword = null,
    Object? isLoadingCategories = null,
    Object? isLoadingOffers = null,
    Object? error = freezed,
    Object? totalAvailable = null,
    Object? isEmptyResult = null,
  }) {
    return _then(_CatalogHomeState(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as CatalogHomeMode,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      offers: null == offers
          ? _self._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      skus: null == skus
          ? _self._skus
          : skus // ignore: cast_nullable_to_non_nullable
              as Map<int, SkuModel>,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as Map<int, ReviewSummaryModel>,
      sellers: null == sellers
          ? _self._sellers
          : sellers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      activeCategory: freezed == activeCategory
          ? _self.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      keyword: null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingCategories: null == isLoadingCategories
          ? _self.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingOffers: null == isLoadingOffers
          ? _self.isLoadingOffers
          : isLoadingOffers // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      totalAvailable: null == totalAvailable
          ? _self.totalAvailable
          : totalAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      isEmptyResult: null == isEmptyResult
          ? _self.isEmptyResult
          : isEmptyResult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CatalogHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get activeCategory {
    if (_self.activeCategory == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_self.activeCategory!, (value) {
      return _then(_self.copyWith(activeCategory: value));
    });
  }
}

// dart format on
