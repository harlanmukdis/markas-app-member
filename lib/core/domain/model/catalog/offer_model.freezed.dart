// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceTierModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  int? get offerId;

  /// `RETAIL` atau `PROJECT`.
  @StringJson()
  String get segment;

  /// Kuantitas minimum agar tier ini berlaku. **Desimal** (`"1.0000"`).
  @DoubleJson()
  @JsonKey(name: 'min_qty')
  double get minQty;

  /// Rupiah penuh. Dikirim `"65000.00"`, dibulatkan jadi int.
  @IntJson()
  int get price;
  @IntOrNullJson()
  @JsonKey(name: 'strikethrough_price')
  int? get strikethroughPrice;
  @ServerDateTimeJson()
  @JsonKey(name: 'strikethrough_since')
  DateTime? get strikethroughSince;

  /// Create a copy of PriceTierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PriceTierModelCopyWith<PriceTierModel> get copyWith =>
      _$PriceTierModelCopyWithImpl<PriceTierModel>(
          this as PriceTierModel, _$identity);

  /// Serializes this PriceTierModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PriceTierModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.segment, segment) || other.segment == segment) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.strikethroughPrice, strikethroughPrice) ||
                other.strikethroughPrice == strikethroughPrice) &&
            (identical(other.strikethroughSince, strikethroughSince) ||
                other.strikethroughSince == strikethroughSince));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, offerId, segment, minQty,
      price, strikethroughPrice, strikethroughSince);

  @override
  String toString() {
    return 'PriceTierModel(id: $id, offerId: $offerId, segment: $segment, minQty: $minQty, price: $price, strikethroughPrice: $strikethroughPrice, strikethroughSince: $strikethroughSince)';
  }
}

/// @nodoc
abstract mixin class $PriceTierModelCopyWith<$Res> {
  factory $PriceTierModelCopyWith(
          PriceTierModel value, $Res Function(PriceTierModel) _then) =
      _$PriceTierModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @StringJson() String segment,
      @DoubleJson() @JsonKey(name: 'min_qty') double minQty,
      @IntJson() int price,
      @IntOrNullJson()
      @JsonKey(name: 'strikethrough_price')
      int? strikethroughPrice,
      @ServerDateTimeJson()
      @JsonKey(name: 'strikethrough_since')
      DateTime? strikethroughSince});
}

/// @nodoc
class _$PriceTierModelCopyWithImpl<$Res>
    implements $PriceTierModelCopyWith<$Res> {
  _$PriceTierModelCopyWithImpl(this._self, this._then);

  final PriceTierModel _self;
  final $Res Function(PriceTierModel) _then;

  /// Create a copy of PriceTierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offerId = freezed,
    Object? segment = null,
    Object? minQty = null,
    Object? price = null,
    Object? strikethroughPrice = freezed,
    Object? strikethroughSince = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: freezed == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      segment: null == segment
          ? _self.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _self.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      strikethroughPrice: freezed == strikethroughPrice
          ? _self.strikethroughPrice
          : strikethroughPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      strikethroughSince: freezed == strikethroughSince
          ? _self.strikethroughSince
          : strikethroughSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PriceTierModel].
extension PriceTierModelPatterns on PriceTierModel {
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
    TResult Function(_PriceTierModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel() when $default != null:
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
    TResult Function(_PriceTierModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel():
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
    TResult? Function(_PriceTierModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringJson() String segment,
            @DoubleJson() @JsonKey(name: 'min_qty') double minQty,
            @IntJson() int price,
            @IntOrNullJson()
            @JsonKey(name: 'strikethrough_price')
            int? strikethroughPrice,
            @ServerDateTimeJson()
            @JsonKey(name: 'strikethrough_since')
            DateTime? strikethroughSince)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel() when $default != null:
        return $default(_that.id, _that.offerId, _that.segment, _that.minQty,
            _that.price, _that.strikethroughPrice, _that.strikethroughSince);
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
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringJson() String segment,
            @DoubleJson() @JsonKey(name: 'min_qty') double minQty,
            @IntJson() int price,
            @IntOrNullJson()
            @JsonKey(name: 'strikethrough_price')
            int? strikethroughPrice,
            @ServerDateTimeJson()
            @JsonKey(name: 'strikethrough_since')
            DateTime? strikethroughSince)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel():
        return $default(_that.id, _that.offerId, _that.segment, _that.minQty,
            _that.price, _that.strikethroughPrice, _that.strikethroughSince);
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
            @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
            @StringJson() String segment,
            @DoubleJson() @JsonKey(name: 'min_qty') double minQty,
            @IntJson() int price,
            @IntOrNullJson()
            @JsonKey(name: 'strikethrough_price')
            int? strikethroughPrice,
            @ServerDateTimeJson()
            @JsonKey(name: 'strikethrough_since')
            DateTime? strikethroughSince)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PriceTierModel() when $default != null:
        return $default(_that.id, _that.offerId, _that.segment, _that.minQty,
            _that.price, _that.strikethroughPrice, _that.strikethroughSince);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PriceTierModel extends PriceTierModel {
  const _PriceTierModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') this.offerId,
      @StringJson() required this.segment,
      @DoubleJson() @JsonKey(name: 'min_qty') this.minQty = 1,
      @IntJson() required this.price,
      @IntOrNullJson()
      @JsonKey(name: 'strikethrough_price')
      this.strikethroughPrice,
      @ServerDateTimeJson()
      @JsonKey(name: 'strikethrough_since')
      this.strikethroughSince})
      : super._();
  factory _PriceTierModel.fromJson(Map<String, dynamic> json) =>
      _$PriceTierModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  final int? offerId;

  /// `RETAIL` atau `PROJECT`.
  @override
  @StringJson()
  final String segment;

  /// Kuantitas minimum agar tier ini berlaku. **Desimal** (`"1.0000"`).
  @override
  @DoubleJson()
  @JsonKey(name: 'min_qty')
  final double minQty;

  /// Rupiah penuh. Dikirim `"65000.00"`, dibulatkan jadi int.
  @override
  @IntJson()
  final int price;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'strikethrough_price')
  final int? strikethroughPrice;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'strikethrough_since')
  final DateTime? strikethroughSince;

  /// Create a copy of PriceTierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PriceTierModelCopyWith<_PriceTierModel> get copyWith =>
      __$PriceTierModelCopyWithImpl<_PriceTierModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PriceTierModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PriceTierModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.segment, segment) || other.segment == segment) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.strikethroughPrice, strikethroughPrice) ||
                other.strikethroughPrice == strikethroughPrice) &&
            (identical(other.strikethroughSince, strikethroughSince) ||
                other.strikethroughSince == strikethroughSince));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, offerId, segment, minQty,
      price, strikethroughPrice, strikethroughSince);

  @override
  String toString() {
    return 'PriceTierModel(id: $id, offerId: $offerId, segment: $segment, minQty: $minQty, price: $price, strikethroughPrice: $strikethroughPrice, strikethroughSince: $strikethroughSince)';
  }
}

/// @nodoc
abstract mixin class _$PriceTierModelCopyWith<$Res>
    implements $PriceTierModelCopyWith<$Res> {
  factory _$PriceTierModelCopyWith(
          _PriceTierModel value, $Res Function(_PriceTierModel) _then) =
      __$PriceTierModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @StringJson() String segment,
      @DoubleJson() @JsonKey(name: 'min_qty') double minQty,
      @IntJson() int price,
      @IntOrNullJson()
      @JsonKey(name: 'strikethrough_price')
      int? strikethroughPrice,
      @ServerDateTimeJson()
      @JsonKey(name: 'strikethrough_since')
      DateTime? strikethroughSince});
}

/// @nodoc
class __$PriceTierModelCopyWithImpl<$Res>
    implements _$PriceTierModelCopyWith<$Res> {
  __$PriceTierModelCopyWithImpl(this._self, this._then);

  final _PriceTierModel _self;
  final $Res Function(_PriceTierModel) _then;

  /// Create a copy of PriceTierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? offerId = freezed,
    Object? segment = null,
    Object? minQty = null,
    Object? price = null,
    Object? strikethroughPrice = freezed,
    Object? strikethroughSince = freezed,
  }) {
    return _then(_PriceTierModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: freezed == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      segment: null == segment
          ? _self.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _self.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      strikethroughPrice: freezed == strikethroughPrice
          ? _self.strikethroughPrice
          : strikethroughPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      strikethroughSince: freezed == strikethroughSince
          ? _self.strikethroughSince
          : strikethroughSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$OfferModel {
  @IntJson()
  int get id;
  @IntJson()
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  int? get skuId;
  @IntOrNullJson()
  @JsonKey(name: 'category_id')
  int? get categoryId;

  /// Penawaran jalur `BEBAS` — barangnya tidak punya SKU master, jadi
  /// nama dan dimensinya ada di field `freeform_*` di bawah.
  @BoolJson()
  @JsonKey(name: 'is_freeform')
  bool get isFreeform;
  @BoolJson()
  @JsonKey(name: 'is_temporary_listing')
  bool get isTemporaryListing;
  @StringOrNullJson()
  @JsonKey(name: 'freeform_name')
  String? get freeformName;
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_weight_kg')
  double? get freeformWeightKg;
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_length_cm')
  double? get freeformLengthCm;
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_width_cm')
  double? get freeformWidthCm;
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_height_cm')
  double? get freeformHeightCm;
  @StringJson()
  @JsonKey(name: 'handling_class')
  String get handlingClass;

  /// Foto produk. Lihat [PhotosJsonConverter] — backend mengirim ini sebagai
  /// **String berisi JSON**, bukan array.
  @PhotosJsonConverter()
  @JsonKey(name: 'photos_json')
  List<PhotoModel> get photos;

  /// Minimum order toko. **Desimal** — `5.0000` bisa berarti 5,5 m³.
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  double get minOrderQty;
  @StringJson()
  String get status;
  @StringOrNullJson()
  @JsonKey(name: 'reject_reason')
  String? get rejectReason;
  @StringOrNullJson()
  String? get description;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;
  @ServerDateTimeJson()
  @JsonKey(name: 'modified_date')
  DateTime? get modifiedDate;
  @JsonKey(name: 'price_tiers')
  List<PriceTierModel> get priceTiers; // --- Hanya terisi dari GET /search ---
  @StringOrNullJson()
  @JsonKey(name: 'seller_name')
  String? get sellerName;
  @DoubleOrNullJson()
  @JsonKey(name: 'seller_score')
  double? get sellerScore;

  /// `PKP` atau `NON_PKP`. Hanya toko PKP yang bisa menerbitkan faktur pajak.
  @StringOrNullJson()
  @JsonKey(name: 'pkp_status')
  String? get pkpStatus;

  /// Ongkir termurah sebagai **estimasi**, bukan harga final.
  @IntOrNullJson()
  @JsonKey(name: 'ongkir_mulai_dari')
  int? get ongkirMulaiDari;
  @BoolJson()
  @JsonKey(name: 'ongkir_is_estimate')
  bool get ongkirIsEstimate;
  @DoubleOrNullJson()
  @JsonKey(name: 'available_stock')
  double? get availableStock;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<OfferModel> get copyWith =>
      _$OfferModelCopyWithImpl<OfferModel>(this as OfferModel, _$identity);

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfferModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isFreeform, isFreeform) ||
                other.isFreeform == isFreeform) &&
            (identical(other.isTemporaryListing, isTemporaryListing) ||
                other.isTemporaryListing == isTemporaryListing) &&
            (identical(other.freeformName, freeformName) ||
                other.freeformName == freeformName) &&
            (identical(other.freeformWeightKg, freeformWeightKg) ||
                other.freeformWeightKg == freeformWeightKg) &&
            (identical(other.freeformLengthCm, freeformLengthCm) ||
                other.freeformLengthCm == freeformLengthCm) &&
            (identical(other.freeformWidthCm, freeformWidthCm) ||
                other.freeformWidthCm == freeformWidthCm) &&
            (identical(other.freeformHeightCm, freeformHeightCm) ||
                other.freeformHeightCm == freeformHeightCm) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            const DeepCollectionEquality()
                .equals(other.priceTiers, priceTiers) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerScore, sellerScore) ||
                other.sellerScore == sellerScore) &&
            (identical(other.pkpStatus, pkpStatus) ||
                other.pkpStatus == pkpStatus) &&
            (identical(other.ongkirMulaiDari, ongkirMulaiDari) ||
                other.ongkirMulaiDari == ongkirMulaiDari) &&
            (identical(other.ongkirIsEstimate, ongkirIsEstimate) ||
                other.ongkirIsEstimate == ongkirIsEstimate) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        sellerId,
        skuId,
        categoryId,
        isFreeform,
        isTemporaryListing,
        freeformName,
        freeformWeightKg,
        freeformLengthCm,
        freeformWidthCm,
        freeformHeightCm,
        handlingClass,
        const DeepCollectionEquality().hash(photos),
        minOrderQty,
        status,
        rejectReason,
        description,
        createdDate,
        modifiedDate,
        const DeepCollectionEquality().hash(priceTiers),
        sellerName,
        sellerScore,
        pkpStatus,
        ongkirMulaiDari,
        ongkirIsEstimate,
        availableStock
      ]);

  @override
  String toString() {
    return 'OfferModel(id: $id, sellerId: $sellerId, skuId: $skuId, categoryId: $categoryId, isFreeform: $isFreeform, isTemporaryListing: $isTemporaryListing, freeformName: $freeformName, freeformWeightKg: $freeformWeightKg, freeformLengthCm: $freeformLengthCm, freeformWidthCm: $freeformWidthCm, freeformHeightCm: $freeformHeightCm, handlingClass: $handlingClass, photos: $photos, minOrderQty: $minOrderQty, status: $status, rejectReason: $rejectReason, description: $description, createdDate: $createdDate, modifiedDate: $modifiedDate, priceTiers: $priceTiers, sellerName: $sellerName, sellerScore: $sellerScore, pkpStatus: $pkpStatus, ongkirMulaiDari: $ongkirMulaiDari, ongkirIsEstimate: $ongkirIsEstimate, availableStock: $availableStock)';
  }
}

/// @nodoc
abstract mixin class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) _then) =
      _$OfferModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
      @BoolJson() @JsonKey(name: 'is_freeform') bool isFreeform,
      @BoolJson()
      @JsonKey(name: 'is_temporary_listing')
      bool isTemporaryListing,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_weight_kg')
      double? freeformWeightKg,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_length_cm')
      double? freeformLengthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_width_cm')
      double? freeformWidthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_height_cm')
      double? freeformHeightCm,
      @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      List<PhotoModel> photos,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'reject_reason') String? rejectReason,
      @StringOrNullJson() String? description,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      @ServerDateTimeJson()
      @JsonKey(name: 'modified_date')
      DateTime? modifiedDate,
      @JsonKey(name: 'price_tiers') List<PriceTierModel> priceTiers,
      @StringOrNullJson() @JsonKey(name: 'seller_name') String? sellerName,
      @DoubleOrNullJson() @JsonKey(name: 'seller_score') double? sellerScore,
      @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,
      @IntOrNullJson() @JsonKey(name: 'ongkir_mulai_dari') int? ongkirMulaiDari,
      @BoolJson() @JsonKey(name: 'ongkir_is_estimate') bool ongkirIsEstimate,
      @DoubleOrNullJson()
      @JsonKey(name: 'available_stock')
      double? availableStock});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res> implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._self, this._then);

  final OfferModel _self;
  final $Res Function(OfferModel) _then;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sellerId = null,
    Object? skuId = freezed,
    Object? categoryId = freezed,
    Object? isFreeform = null,
    Object? isTemporaryListing = null,
    Object? freeformName = freezed,
    Object? freeformWeightKg = freezed,
    Object? freeformLengthCm = freezed,
    Object? freeformWidthCm = freezed,
    Object? freeformHeightCm = freezed,
    Object? handlingClass = null,
    Object? photos = null,
    Object? minOrderQty = null,
    Object? status = null,
    Object? rejectReason = freezed,
    Object? description = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? priceTiers = null,
    Object? sellerName = freezed,
    Object? sellerScore = freezed,
    Object? pkpStatus = freezed,
    Object? ongkirMulaiDari = freezed,
    Object? ongkirIsEstimate = null,
    Object? availableStock = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFreeform: null == isFreeform
          ? _self.isFreeform
          : isFreeform // ignore: cast_nullable_to_non_nullable
              as bool,
      isTemporaryListing: null == isTemporaryListing
          ? _self.isTemporaryListing
          : isTemporaryListing // ignore: cast_nullable_to_non_nullable
              as bool,
      freeformName: freezed == freeformName
          ? _self.freeformName
          : freeformName // ignore: cast_nullable_to_non_nullable
              as String?,
      freeformWeightKg: freezed == freeformWeightKg
          ? _self.freeformWeightKg
          : freeformWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformLengthCm: freezed == freeformLengthCm
          ? _self.freeformLengthCm
          : freeformLengthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformWidthCm: freezed == freeformWidthCm
          ? _self.freeformWidthCm
          : freeformWidthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformHeightCm: freezed == freeformHeightCm
          ? _self.freeformHeightCm
          : freeformHeightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: null == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: freezed == rejectReason
          ? _self.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _self.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priceTiers: null == priceTiers
          ? _self.priceTiers
          : priceTiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierModel>,
      sellerName: freezed == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerScore: freezed == sellerScore
          ? _self.sellerScore
          : sellerScore // ignore: cast_nullable_to_non_nullable
              as double?,
      pkpStatus: freezed == pkpStatus
          ? _self.pkpStatus
          : pkpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      ongkirMulaiDari: freezed == ongkirMulaiDari
          ? _self.ongkirMulaiDari
          : ongkirMulaiDari // ignore: cast_nullable_to_non_nullable
              as int?,
      ongkirIsEstimate: null == ongkirIsEstimate
          ? _self.ongkirIsEstimate
          : ongkirIsEstimate // ignore: cast_nullable_to_non_nullable
              as bool,
      availableStock: freezed == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfferModel].
extension OfferModelPatterns on OfferModel {
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
    TResult Function(_OfferModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfferModel() when $default != null:
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
    TResult Function(_OfferModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferModel():
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
    TResult? Function(_OfferModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferModel() when $default != null:
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
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @BoolJson() @JsonKey(name: 'is_freeform') bool isFreeform,
            @BoolJson()
            @JsonKey(name: 'is_temporary_listing')
            bool isTemporaryListing,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_weight_kg')
            double? freeformWeightKg,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_length_cm')
            double? freeformLengthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_width_cm')
            double? freeformWidthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_height_cm')
            double? freeformHeightCm,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'reject_reason')
            String? rejectReason,
            @StringOrNullJson() String? description,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate,
            @JsonKey(name: 'price_tiers') List<PriceTierModel> priceTiers,
            @StringOrNullJson()
            @JsonKey(name: 'seller_name')
            String? sellerName,
            @DoubleOrNullJson()
            @JsonKey(name: 'seller_score')
            double? sellerScore,
            @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,
            @IntOrNullJson()
            @JsonKey(name: 'ongkir_mulai_dari')
            int? ongkirMulaiDari,
            @BoolJson()
            @JsonKey(name: 'ongkir_is_estimate')
            bool ongkirIsEstimate,
            @DoubleOrNullJson()
            @JsonKey(name: 'available_stock')
            double? availableStock)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfferModel() when $default != null:
        return $default(
            _that.id,
            _that.sellerId,
            _that.skuId,
            _that.categoryId,
            _that.isFreeform,
            _that.isTemporaryListing,
            _that.freeformName,
            _that.freeformWeightKg,
            _that.freeformLengthCm,
            _that.freeformWidthCm,
            _that.freeformHeightCm,
            _that.handlingClass,
            _that.photos,
            _that.minOrderQty,
            _that.status,
            _that.rejectReason,
            _that.description,
            _that.createdDate,
            _that.modifiedDate,
            _that.priceTiers,
            _that.sellerName,
            _that.sellerScore,
            _that.pkpStatus,
            _that.ongkirMulaiDari,
            _that.ongkirIsEstimate,
            _that.availableStock);
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
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @BoolJson() @JsonKey(name: 'is_freeform') bool isFreeform,
            @BoolJson()
            @JsonKey(name: 'is_temporary_listing')
            bool isTemporaryListing,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_weight_kg')
            double? freeformWeightKg,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_length_cm')
            double? freeformLengthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_width_cm')
            double? freeformWidthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_height_cm')
            double? freeformHeightCm,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'reject_reason')
            String? rejectReason,
            @StringOrNullJson() String? description,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate,
            @JsonKey(name: 'price_tiers') List<PriceTierModel> priceTiers,
            @StringOrNullJson()
            @JsonKey(name: 'seller_name')
            String? sellerName,
            @DoubleOrNullJson()
            @JsonKey(name: 'seller_score')
            double? sellerScore,
            @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,
            @IntOrNullJson()
            @JsonKey(name: 'ongkir_mulai_dari')
            int? ongkirMulaiDari,
            @BoolJson()
            @JsonKey(name: 'ongkir_is_estimate')
            bool ongkirIsEstimate,
            @DoubleOrNullJson()
            @JsonKey(name: 'available_stock')
            double? availableStock)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferModel():
        return $default(
            _that.id,
            _that.sellerId,
            _that.skuId,
            _that.categoryId,
            _that.isFreeform,
            _that.isTemporaryListing,
            _that.freeformName,
            _that.freeformWeightKg,
            _that.freeformLengthCm,
            _that.freeformWidthCm,
            _that.freeformHeightCm,
            _that.handlingClass,
            _that.photos,
            _that.minOrderQty,
            _that.status,
            _that.rejectReason,
            _that.description,
            _that.createdDate,
            _that.modifiedDate,
            _that.priceTiers,
            _that.sellerName,
            _that.sellerScore,
            _that.pkpStatus,
            _that.ongkirMulaiDari,
            _that.ongkirIsEstimate,
            _that.availableStock);
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
            @IntJson() @JsonKey(name: 'seller_id') int sellerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @BoolJson() @JsonKey(name: 'is_freeform') bool isFreeform,
            @BoolJson()
            @JsonKey(name: 'is_temporary_listing')
            bool isTemporaryListing,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_weight_kg')
            double? freeformWeightKg,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_length_cm')
            double? freeformLengthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_width_cm')
            double? freeformWidthCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'freeform_height_cm')
            double? freeformHeightCm,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringJson() String status,
            @StringOrNullJson()
            @JsonKey(name: 'reject_reason')
            String? rejectReason,
            @StringOrNullJson() String? description,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate,
            @ServerDateTimeJson()
            @JsonKey(name: 'modified_date')
            DateTime? modifiedDate,
            @JsonKey(name: 'price_tiers') List<PriceTierModel> priceTiers,
            @StringOrNullJson()
            @JsonKey(name: 'seller_name')
            String? sellerName,
            @DoubleOrNullJson()
            @JsonKey(name: 'seller_score')
            double? sellerScore,
            @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,
            @IntOrNullJson()
            @JsonKey(name: 'ongkir_mulai_dari')
            int? ongkirMulaiDari,
            @BoolJson()
            @JsonKey(name: 'ongkir_is_estimate')
            bool ongkirIsEstimate,
            @DoubleOrNullJson()
            @JsonKey(name: 'available_stock')
            double? availableStock)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfferModel() when $default != null:
        return $default(
            _that.id,
            _that.sellerId,
            _that.skuId,
            _that.categoryId,
            _that.isFreeform,
            _that.isTemporaryListing,
            _that.freeformName,
            _that.freeformWeightKg,
            _that.freeformLengthCm,
            _that.freeformWidthCm,
            _that.freeformHeightCm,
            _that.handlingClass,
            _that.photos,
            _that.minOrderQty,
            _that.status,
            _that.rejectReason,
            _that.description,
            _that.createdDate,
            _that.modifiedDate,
            _that.priceTiers,
            _that.sellerName,
            _that.sellerScore,
            _that.pkpStatus,
            _that.ongkirMulaiDari,
            _that.ongkirIsEstimate,
            _that.availableStock);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OfferModel extends OfferModel {
  const _OfferModel(
      {@IntJson() required this.id,
      @IntJson() @JsonKey(name: 'seller_id') required this.sellerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') this.skuId,
      @IntOrNullJson() @JsonKey(name: 'category_id') this.categoryId,
      @BoolJson() @JsonKey(name: 'is_freeform') this.isFreeform = false,
      @BoolJson()
      @JsonKey(name: 'is_temporary_listing')
      this.isTemporaryListing = false,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') this.freeformName,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_weight_kg')
      this.freeformWeightKg,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_length_cm')
      this.freeformLengthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_width_cm')
      this.freeformWidthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_height_cm')
      this.freeformHeightCm,
      @StringJson()
      @JsonKey(name: 'handling_class')
      this.handlingClass = 'NORMAL',
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      final List<PhotoModel> photos = const <PhotoModel>[],
      @DoubleJson() @JsonKey(name: 'min_order_qty') this.minOrderQty = 0,
      @StringJson() this.status = 'ACTIVE',
      @StringOrNullJson() @JsonKey(name: 'reject_reason') this.rejectReason,
      @StringOrNullJson() this.description,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate,
      @ServerDateTimeJson() @JsonKey(name: 'modified_date') this.modifiedDate,
      @JsonKey(name: 'price_tiers')
      final List<PriceTierModel> priceTiers = const <PriceTierModel>[],
      @StringOrNullJson() @JsonKey(name: 'seller_name') this.sellerName,
      @DoubleOrNullJson() @JsonKey(name: 'seller_score') this.sellerScore,
      @StringOrNullJson() @JsonKey(name: 'pkp_status') this.pkpStatus,
      @IntOrNullJson() @JsonKey(name: 'ongkir_mulai_dari') this.ongkirMulaiDari,
      @BoolJson()
      @JsonKey(name: 'ongkir_is_estimate')
      this.ongkirIsEstimate = true,
      @DoubleOrNullJson()
      @JsonKey(name: 'available_stock')
      this.availableStock})
      : _photos = photos,
        _priceTiers = priceTiers,
        super._();
  factory _OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntJson()
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  final int? skuId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'category_id')
  final int? categoryId;

  /// Penawaran jalur `BEBAS` — barangnya tidak punya SKU master, jadi
  /// nama dan dimensinya ada di field `freeform_*` di bawah.
  @override
  @BoolJson()
  @JsonKey(name: 'is_freeform')
  final bool isFreeform;
  @override
  @BoolJson()
  @JsonKey(name: 'is_temporary_listing')
  final bool isTemporaryListing;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'freeform_name')
  final String? freeformName;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_weight_kg')
  final double? freeformWeightKg;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_length_cm')
  final double? freeformLengthCm;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_width_cm')
  final double? freeformWidthCm;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'freeform_height_cm')
  final double? freeformHeightCm;
  @override
  @StringJson()
  @JsonKey(name: 'handling_class')
  final String handlingClass;

  /// Foto produk. Lihat [PhotosJsonConverter] — backend mengirim ini sebagai
  /// **String berisi JSON**, bukan array.
  final List<PhotoModel> _photos;

  /// Foto produk. Lihat [PhotosJsonConverter] — backend mengirim ini sebagai
  /// **String berisi JSON**, bukan array.
  @override
  @PhotosJsonConverter()
  @JsonKey(name: 'photos_json')
  List<PhotoModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  /// Minimum order toko. **Desimal** — `5.0000` bisa berarti 5,5 m³.
  @override
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  final double minOrderQty;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'reject_reason')
  final String? rejectReason;
  @override
  @StringOrNullJson()
  final String? description;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'modified_date')
  final DateTime? modifiedDate;
  final List<PriceTierModel> _priceTiers;
  @override
  @JsonKey(name: 'price_tiers')
  List<PriceTierModel> get priceTiers {
    if (_priceTiers is EqualUnmodifiableListView) return _priceTiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceTiers);
  }

// --- Hanya terisi dari GET /search ---
  @override
  @StringOrNullJson()
  @JsonKey(name: 'seller_name')
  final String? sellerName;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'seller_score')
  final double? sellerScore;

  /// `PKP` atau `NON_PKP`. Hanya toko PKP yang bisa menerbitkan faktur pajak.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'pkp_status')
  final String? pkpStatus;

  /// Ongkir termurah sebagai **estimasi**, bukan harga final.
  @override
  @IntOrNullJson()
  @JsonKey(name: 'ongkir_mulai_dari')
  final int? ongkirMulaiDari;
  @override
  @BoolJson()
  @JsonKey(name: 'ongkir_is_estimate')
  final bool ongkirIsEstimate;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'available_stock')
  final double? availableStock;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfferModelCopyWith<_OfferModel> get copyWith =>
      __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfferModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfferModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isFreeform, isFreeform) ||
                other.isFreeform == isFreeform) &&
            (identical(other.isTemporaryListing, isTemporaryListing) ||
                other.isTemporaryListing == isTemporaryListing) &&
            (identical(other.freeformName, freeformName) ||
                other.freeformName == freeformName) &&
            (identical(other.freeformWeightKg, freeformWeightKg) ||
                other.freeformWeightKg == freeformWeightKg) &&
            (identical(other.freeformLengthCm, freeformLengthCm) ||
                other.freeformLengthCm == freeformLengthCm) &&
            (identical(other.freeformWidthCm, freeformWidthCm) ||
                other.freeformWidthCm == freeformWidthCm) &&
            (identical(other.freeformHeightCm, freeformHeightCm) ||
                other.freeformHeightCm == freeformHeightCm) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            const DeepCollectionEquality()
                .equals(other._priceTiers, _priceTiers) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerScore, sellerScore) ||
                other.sellerScore == sellerScore) &&
            (identical(other.pkpStatus, pkpStatus) ||
                other.pkpStatus == pkpStatus) &&
            (identical(other.ongkirMulaiDari, ongkirMulaiDari) ||
                other.ongkirMulaiDari == ongkirMulaiDari) &&
            (identical(other.ongkirIsEstimate, ongkirIsEstimate) ||
                other.ongkirIsEstimate == ongkirIsEstimate) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        sellerId,
        skuId,
        categoryId,
        isFreeform,
        isTemporaryListing,
        freeformName,
        freeformWeightKg,
        freeformLengthCm,
        freeformWidthCm,
        freeformHeightCm,
        handlingClass,
        const DeepCollectionEquality().hash(_photos),
        minOrderQty,
        status,
        rejectReason,
        description,
        createdDate,
        modifiedDate,
        const DeepCollectionEquality().hash(_priceTiers),
        sellerName,
        sellerScore,
        pkpStatus,
        ongkirMulaiDari,
        ongkirIsEstimate,
        availableStock
      ]);

  @override
  String toString() {
    return 'OfferModel(id: $id, sellerId: $sellerId, skuId: $skuId, categoryId: $categoryId, isFreeform: $isFreeform, isTemporaryListing: $isTemporaryListing, freeformName: $freeformName, freeformWeightKg: $freeformWeightKg, freeformLengthCm: $freeformLengthCm, freeformWidthCm: $freeformWidthCm, freeformHeightCm: $freeformHeightCm, handlingClass: $handlingClass, photos: $photos, minOrderQty: $minOrderQty, status: $status, rejectReason: $rejectReason, description: $description, createdDate: $createdDate, modifiedDate: $modifiedDate, priceTiers: $priceTiers, sellerName: $sellerName, sellerScore: $sellerScore, pkpStatus: $pkpStatus, ongkirMulaiDari: $ongkirMulaiDari, ongkirIsEstimate: $ongkirIsEstimate, availableStock: $availableStock)';
  }
}

/// @nodoc
abstract mixin class _$OfferModelCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(
          _OfferModel value, $Res Function(_OfferModel) _then) =
      __$OfferModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'seller_id') int sellerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
      @BoolJson() @JsonKey(name: 'is_freeform') bool isFreeform,
      @BoolJson()
      @JsonKey(name: 'is_temporary_listing')
      bool isTemporaryListing,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_weight_kg')
      double? freeformWeightKg,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_length_cm')
      double? freeformLengthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_width_cm')
      double? freeformWidthCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'freeform_height_cm')
      double? freeformHeightCm,
      @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      List<PhotoModel> photos,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @StringJson() String status,
      @StringOrNullJson() @JsonKey(name: 'reject_reason') String? rejectReason,
      @StringOrNullJson() String? description,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate,
      @ServerDateTimeJson()
      @JsonKey(name: 'modified_date')
      DateTime? modifiedDate,
      @JsonKey(name: 'price_tiers') List<PriceTierModel> priceTiers,
      @StringOrNullJson() @JsonKey(name: 'seller_name') String? sellerName,
      @DoubleOrNullJson() @JsonKey(name: 'seller_score') double? sellerScore,
      @StringOrNullJson() @JsonKey(name: 'pkp_status') String? pkpStatus,
      @IntOrNullJson() @JsonKey(name: 'ongkir_mulai_dari') int? ongkirMulaiDari,
      @BoolJson() @JsonKey(name: 'ongkir_is_estimate') bool ongkirIsEstimate,
      @DoubleOrNullJson()
      @JsonKey(name: 'available_stock')
      double? availableStock});
}

/// @nodoc
class __$OfferModelCopyWithImpl<$Res> implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(this._self, this._then);

  final _OfferModel _self;
  final $Res Function(_OfferModel) _then;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sellerId = null,
    Object? skuId = freezed,
    Object? categoryId = freezed,
    Object? isFreeform = null,
    Object? isTemporaryListing = null,
    Object? freeformName = freezed,
    Object? freeformWeightKg = freezed,
    Object? freeformLengthCm = freezed,
    Object? freeformWidthCm = freezed,
    Object? freeformHeightCm = freezed,
    Object? handlingClass = null,
    Object? photos = null,
    Object? minOrderQty = null,
    Object? status = null,
    Object? rejectReason = freezed,
    Object? description = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? priceTiers = null,
    Object? sellerName = freezed,
    Object? sellerScore = freezed,
    Object? pkpStatus = freezed,
    Object? ongkirMulaiDari = freezed,
    Object? ongkirIsEstimate = null,
    Object? availableStock = freezed,
  }) {
    return _then(_OfferModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isFreeform: null == isFreeform
          ? _self.isFreeform
          : isFreeform // ignore: cast_nullable_to_non_nullable
              as bool,
      isTemporaryListing: null == isTemporaryListing
          ? _self.isTemporaryListing
          : isTemporaryListing // ignore: cast_nullable_to_non_nullable
              as bool,
      freeformName: freezed == freeformName
          ? _self.freeformName
          : freeformName // ignore: cast_nullable_to_non_nullable
              as String?,
      freeformWeightKg: freezed == freeformWeightKg
          ? _self.freeformWeightKg
          : freeformWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformLengthCm: freezed == freeformLengthCm
          ? _self.freeformLengthCm
          : freeformLengthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformWidthCm: freezed == freeformWidthCm
          ? _self.freeformWidthCm
          : freeformWidthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      freeformHeightCm: freezed == freeformHeightCm
          ? _self.freeformHeightCm
          : freeformHeightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: null == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: freezed == rejectReason
          ? _self.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _self.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priceTiers: null == priceTiers
          ? _self._priceTiers
          : priceTiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierModel>,
      sellerName: freezed == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerScore: freezed == sellerScore
          ? _self.sellerScore
          : sellerScore // ignore: cast_nullable_to_non_nullable
              as double?,
      pkpStatus: freezed == pkpStatus
          ? _self.pkpStatus
          : pkpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      ongkirMulaiDari: freezed == ongkirMulaiDari
          ? _self.ongkirMulaiDari
          : ongkirMulaiDari // ignore: cast_nullable_to_non_nullable
              as int?,
      ongkirIsEstimate: null == ongkirIsEstimate
          ? _self.ongkirIsEstimate
          : ongkirIsEstimate // ignore: cast_nullable_to_non_nullable
              as bool,
      availableStock: freezed == availableStock
          ? _self.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
