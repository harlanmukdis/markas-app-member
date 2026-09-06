// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetailState {
  bool get isLoading;
  DataError? get error;
  OfferModel? get offer;
  SkuModel? get sku;

  /// Penawaran **toko lain** untuk SKU yang sama.
  ///
  /// Inti nilai marketplace ini: barang komoditas identik, yang beda hanya
  /// harga dan ongkir. Kalau toko termurah kehabisan stok, pembeli tidak
  /// buntu.
  List<OfferModel> get otherOffers;

  /// Nama toko per id, karena `GET /offers` tidak memuat `seller_name`.
  Map<int, String> get sellers;

  /// Satuan jual yang dipilih user.
  SkuUnitModel? get selectedUnit;

  /// Kuantitas dalam [selectedUnit].
  double get qty;

  /// Input kalkulator kebutuhan, dalam satuan luas/volume.
  double get calculatorInput;
  bool get isAddingToCart;

  /// Terisi setelah berhasil masuk keranjang, untuk umpan balik sekali pakai.
  String? get cartMessage;

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      _$ProductDetailStateCopyWithImpl<ProductDetailState>(
          this as ProductDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            const DeepCollectionEquality()
                .equals(other.otherOffers, otherOffers) &&
            const DeepCollectionEquality().equals(other.sellers, sellers) &&
            (identical(other.selectedUnit, selectedUnit) ||
                other.selectedUnit == selectedUnit) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.calculatorInput, calculatorInput) ||
                other.calculatorInput == calculatorInput) &&
            (identical(other.isAddingToCart, isAddingToCart) ||
                other.isAddingToCart == isAddingToCart) &&
            (identical(other.cartMessage, cartMessage) ||
                other.cartMessage == cartMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      offer,
      sku,
      const DeepCollectionEquality().hash(otherOffers),
      const DeepCollectionEquality().hash(sellers),
      selectedUnit,
      qty,
      calculatorInput,
      isAddingToCart,
      cartMessage);

  @override
  String toString() {
    return 'ProductDetailState(isLoading: $isLoading, error: $error, offer: $offer, sku: $sku, otherOffers: $otherOffers, sellers: $sellers, selectedUnit: $selectedUnit, qty: $qty, calculatorInput: $calculatorInput, isAddingToCart: $isAddingToCart, cartMessage: $cartMessage)';
  }
}

/// @nodoc
abstract mixin class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) _then) =
      _$ProductDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      OfferModel? offer,
      SkuModel? sku,
      List<OfferModel> otherOffers,
      Map<int, String> sellers,
      SkuUnitModel? selectedUnit,
      double qty,
      double calculatorInput,
      bool isAddingToCart,
      String? cartMessage});

  $OfferModelCopyWith<$Res>? get offer;
  $SkuModelCopyWith<$Res>? get sku;
  $SkuUnitModelCopyWith<$Res>? get selectedUnit;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._self, this._then);

  final ProductDetailState _self;
  final $Res Function(ProductDetailState) _then;

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? offer = freezed,
    Object? sku = freezed,
    Object? otherOffers = null,
    Object? sellers = null,
    Object? selectedUnit = freezed,
    Object? qty = null,
    Object? calculatorInput = null,
    Object? isAddingToCart = null,
    Object? cartMessage = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      offer: freezed == offer
          ? _self.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as SkuModel?,
      otherOffers: null == otherOffers
          ? _self.otherOffers
          : otherOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      sellers: null == sellers
          ? _self.sellers
          : sellers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      selectedUnit: freezed == selectedUnit
          ? _self.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as SkuUnitModel?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      calculatorInput: null == calculatorInput
          ? _self.calculatorInput
          : calculatorInput // ignore: cast_nullable_to_non_nullable
              as double,
      isAddingToCart: null == isAddingToCart
          ? _self.isAddingToCart
          : isAddingToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      cartMessage: freezed == cartMessage
          ? _self.cartMessage
          : cartMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
      return _then(_self.copyWith(offer: value));
    });
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuModelCopyWith<$Res>? get sku {
    if (_self.sku == null) {
      return null;
    }

    return $SkuModelCopyWith<$Res>(_self.sku!, (value) {
      return _then(_self.copyWith(sku: value));
    });
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuUnitModelCopyWith<$Res>? get selectedUnit {
    if (_self.selectedUnit == null) {
      return null;
    }

    return $SkuUnitModelCopyWith<$Res>(_self.selectedUnit!, (value) {
      return _then(_self.copyWith(selectedUnit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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
    TResult Function(_ProductDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState() when $default != null:
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
    TResult Function(_ProductDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState():
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
    TResult? Function(_ProductDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState() when $default != null:
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
            bool isLoading,
            DataError? error,
            OfferModel? offer,
            SkuModel? sku,
            List<OfferModel> otherOffers,
            Map<int, String> sellers,
            SkuUnitModel? selectedUnit,
            double qty,
            double calculatorInput,
            bool isAddingToCart,
            String? cartMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.offer,
            _that.sku,
            _that.otherOffers,
            _that.sellers,
            _that.selectedUnit,
            _that.qty,
            _that.calculatorInput,
            _that.isAddingToCart,
            _that.cartMessage);
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
            bool isLoading,
            DataError? error,
            OfferModel? offer,
            SkuModel? sku,
            List<OfferModel> otherOffers,
            Map<int, String> sellers,
            SkuUnitModel? selectedUnit,
            double qty,
            double calculatorInput,
            bool isAddingToCart,
            String? cartMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState():
        return $default(
            _that.isLoading,
            _that.error,
            _that.offer,
            _that.sku,
            _that.otherOffers,
            _that.sellers,
            _that.selectedUnit,
            _that.qty,
            _that.calculatorInput,
            _that.isAddingToCart,
            _that.cartMessage);
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
            bool isLoading,
            DataError? error,
            OfferModel? offer,
            SkuModel? sku,
            List<OfferModel> otherOffers,
            Map<int, String> sellers,
            SkuUnitModel? selectedUnit,
            double qty,
            double calculatorInput,
            bool isAddingToCart,
            String? cartMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailState() when $default != null:
        return $default(
            _that.isLoading,
            _that.error,
            _that.offer,
            _that.sku,
            _that.otherOffers,
            _that.sellers,
            _that.selectedUnit,
            _that.qty,
            _that.calculatorInput,
            _that.isAddingToCart,
            _that.cartMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductDetailState extends ProductDetailState {
  const _ProductDetailState(
      {this.isLoading = true,
      this.error,
      this.offer,
      this.sku,
      final List<OfferModel> otherOffers = const <OfferModel>[],
      final Map<int, String> sellers = const <int, String>{},
      this.selectedUnit,
      this.qty = 1.0,
      this.calculatorInput = 0.0,
      this.isAddingToCart = false,
      this.cartMessage})
      : _otherOffers = otherOffers,
        _sellers = sellers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DataError? error;
  @override
  final OfferModel? offer;
  @override
  final SkuModel? sku;

  /// Penawaran **toko lain** untuk SKU yang sama.
  ///
  /// Inti nilai marketplace ini: barang komoditas identik, yang beda hanya
  /// harga dan ongkir. Kalau toko termurah kehabisan stok, pembeli tidak
  /// buntu.
  final List<OfferModel> _otherOffers;

  /// Penawaran **toko lain** untuk SKU yang sama.
  ///
  /// Inti nilai marketplace ini: barang komoditas identik, yang beda hanya
  /// harga dan ongkir. Kalau toko termurah kehabisan stok, pembeli tidak
  /// buntu.
  @override
  @JsonKey()
  List<OfferModel> get otherOffers {
    if (_otherOffers is EqualUnmodifiableListView) return _otherOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherOffers);
  }

  /// Nama toko per id, karena `GET /offers` tidak memuat `seller_name`.
  final Map<int, String> _sellers;

  /// Nama toko per id, karena `GET /offers` tidak memuat `seller_name`.
  @override
  @JsonKey()
  Map<int, String> get sellers {
    if (_sellers is EqualUnmodifiableMapView) return _sellers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sellers);
  }

  /// Satuan jual yang dipilih user.
  @override
  final SkuUnitModel? selectedUnit;

  /// Kuantitas dalam [selectedUnit].
  @override
  @JsonKey()
  final double qty;

  /// Input kalkulator kebutuhan, dalam satuan luas/volume.
  @override
  @JsonKey()
  final double calculatorInput;
  @override
  @JsonKey()
  final bool isAddingToCart;

  /// Terisi setelah berhasil masuk keranjang, untuk umpan balik sekali pakai.
  @override
  final String? cartMessage;

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductDetailStateCopyWith<_ProductDetailState> get copyWith =>
      __$ProductDetailStateCopyWithImpl<_ProductDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            const DeepCollectionEquality()
                .equals(other._otherOffers, _otherOffers) &&
            const DeepCollectionEquality().equals(other._sellers, _sellers) &&
            (identical(other.selectedUnit, selectedUnit) ||
                other.selectedUnit == selectedUnit) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.calculatorInput, calculatorInput) ||
                other.calculatorInput == calculatorInput) &&
            (identical(other.isAddingToCart, isAddingToCart) ||
                other.isAddingToCart == isAddingToCart) &&
            (identical(other.cartMessage, cartMessage) ||
                other.cartMessage == cartMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      offer,
      sku,
      const DeepCollectionEquality().hash(_otherOffers),
      const DeepCollectionEquality().hash(_sellers),
      selectedUnit,
      qty,
      calculatorInput,
      isAddingToCart,
      cartMessage);

  @override
  String toString() {
    return 'ProductDetailState(isLoading: $isLoading, error: $error, offer: $offer, sku: $sku, otherOffers: $otherOffers, sellers: $sellers, selectedUnit: $selectedUnit, qty: $qty, calculatorInput: $calculatorInput, isAddingToCart: $isAddingToCart, cartMessage: $cartMessage)';
  }
}

/// @nodoc
abstract mixin class _$ProductDetailStateCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$ProductDetailStateCopyWith(
          _ProductDetailState value, $Res Function(_ProductDetailState) _then) =
      __$ProductDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DataError? error,
      OfferModel? offer,
      SkuModel? sku,
      List<OfferModel> otherOffers,
      Map<int, String> sellers,
      SkuUnitModel? selectedUnit,
      double qty,
      double calculatorInput,
      bool isAddingToCart,
      String? cartMessage});

  @override
  $OfferModelCopyWith<$Res>? get offer;
  @override
  $SkuModelCopyWith<$Res>? get sku;
  @override
  $SkuUnitModelCopyWith<$Res>? get selectedUnit;
}

/// @nodoc
class __$ProductDetailStateCopyWithImpl<$Res>
    implements _$ProductDetailStateCopyWith<$Res> {
  __$ProductDetailStateCopyWithImpl(this._self, this._then);

  final _ProductDetailState _self;
  final $Res Function(_ProductDetailState) _then;

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? offer = freezed,
    Object? sku = freezed,
    Object? otherOffers = null,
    Object? sellers = null,
    Object? selectedUnit = freezed,
    Object? qty = null,
    Object? calculatorInput = null,
    Object? isAddingToCart = null,
    Object? cartMessage = freezed,
  }) {
    return _then(_ProductDetailState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      offer: freezed == offer
          ? _self.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as SkuModel?,
      otherOffers: null == otherOffers
          ? _self._otherOffers
          : otherOffers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
      sellers: null == sellers
          ? _self._sellers
          : sellers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      selectedUnit: freezed == selectedUnit
          ? _self.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as SkuUnitModel?,
      qty: null == qty
          ? _self.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      calculatorInput: null == calculatorInput
          ? _self.calculatorInput
          : calculatorInput // ignore: cast_nullable_to_non_nullable
              as double,
      isAddingToCart: null == isAddingToCart
          ? _self.isAddingToCart
          : isAddingToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      cartMessage: freezed == cartMessage
          ? _self.cartMessage
          : cartMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_self.offer!, (value) {
      return _then(_self.copyWith(offer: value));
    });
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuModelCopyWith<$Res>? get sku {
    if (_self.sku == null) {
      return null;
    }

    return $SkuModelCopyWith<$Res>(_self.sku!, (value) {
      return _then(_self.copyWith(sku: value));
    });
  }

  /// Create a copy of ProductDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SkuUnitModelCopyWith<$Res>? get selectedUnit {
    if (_self.selectedUnit == null) {
      return null;
    }

    return $SkuUnitModelCopyWith<$Res>(_self.selectedUnit!, (value) {
      return _then(_self.copyWith(selectedUnit: value));
    });
  }
}

// dart format on
