// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishlistItemModel {
  @IntJson()
  int get id;
  @IntJson()
  @JsonKey(name: 'offer_id')
  int get offerId;
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  int? get skuId;
  @StringOrNullJson()
  @JsonKey(name: 'display_name')
  String? get displayName;
  @IntOrNullJson()
  @JsonKey(name: 'display_price')
  int? get displayPrice;
  @StringOrNullJson()
  @JsonKey(name: 'freeform_name')
  String? get freeformName;
  @PhotosJsonConverter()
  @JsonKey(name: 'photos_json')
  List<PhotoModel> get photos;
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  double get minOrderQty;
  @StringOrNullJson()
  @JsonKey(name: 'offer_status')
  String? get offerStatus;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of WishlistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WishlistItemModelCopyWith<WishlistItemModel> get copyWith =>
      _$WishlistItemModelCopyWithImpl<WishlistItemModel>(
          this as WishlistItemModel, _$identity);

  /// Serializes this WishlistItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WishlistItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.displayPrice, displayPrice) ||
                other.displayPrice == displayPrice) &&
            (identical(other.freeformName, freeformName) ||
                other.freeformName == freeformName) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.offerStatus, offerStatus) ||
                other.offerStatus == offerStatus) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      offerId,
      skuId,
      displayName,
      displayPrice,
      freeformName,
      const DeepCollectionEquality().hash(photos),
      minOrderQty,
      offerStatus,
      createdDate);

  @override
  String toString() {
    return 'WishlistItemModel(id: $id, offerId: $offerId, skuId: $skuId, displayName: $displayName, displayPrice: $displayPrice, freeformName: $freeformName, photos: $photos, minOrderQty: $minOrderQty, offerStatus: $offerStatus, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $WishlistItemModelCopyWith<$Res> {
  factory $WishlistItemModelCopyWith(
          WishlistItemModel value, $Res Function(WishlistItemModel) _then) =
      _$WishlistItemModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'offer_id') int offerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @StringOrNullJson() @JsonKey(name: 'display_name') String? displayName,
      @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      List<PhotoModel> photos,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$WishlistItemModelCopyWithImpl<$Res>
    implements $WishlistItemModelCopyWith<$Res> {
  _$WishlistItemModelCopyWithImpl(this._self, this._then);

  final WishlistItemModel _self;
  final $Res Function(WishlistItemModel) _then;

  /// Create a copy of WishlistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offerId = null,
    Object? skuId = freezed,
    Object? displayName = freezed,
    Object? displayPrice = freezed,
    Object? freeformName = freezed,
    Object? photos = null,
    Object? minOrderQty = null,
    Object? offerStatus = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      displayPrice: freezed == displayPrice
          ? _self.displayPrice
          : displayPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      freeformName: freezed == freeformName
          ? _self.freeformName
          : freeformName // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      offerStatus: freezed == offerStatus
          ? _self.offerStatus
          : offerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WishlistItemModel].
extension WishlistItemModelPatterns on WishlistItemModel {
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
    TResult Function(_WishlistItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel() when $default != null:
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
    TResult Function(_WishlistItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel():
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
    TResult? Function(_WishlistItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel() when $default != null:
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
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringOrNullJson()
            @JsonKey(name: 'display_name')
            String? displayName,
            @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel() when $default != null:
        return $default(
            _that.id,
            _that.offerId,
            _that.skuId,
            _that.displayName,
            _that.displayPrice,
            _that.freeformName,
            _that.photos,
            _that.minOrderQty,
            _that.offerStatus,
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
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringOrNullJson()
            @JsonKey(name: 'display_name')
            String? displayName,
            @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel():
        return $default(
            _that.id,
            _that.offerId,
            _that.skuId,
            _that.displayName,
            _that.displayPrice,
            _that.freeformName,
            _that.photos,
            _that.minOrderQty,
            _that.offerStatus,
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
            @IntJson() @JsonKey(name: 'offer_id') int offerId,
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringOrNullJson()
            @JsonKey(name: 'display_name')
            String? displayName,
            @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
            @StringOrNullJson()
            @JsonKey(name: 'freeform_name')
            String? freeformName,
            @PhotosJsonConverter()
            @JsonKey(name: 'photos_json')
            List<PhotoModel> photos,
            @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
            @StringOrNullJson()
            @JsonKey(name: 'offer_status')
            String? offerStatus,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WishlistItemModel() when $default != null:
        return $default(
            _that.id,
            _that.offerId,
            _that.skuId,
            _that.displayName,
            _that.displayPrice,
            _that.freeformName,
            _that.photos,
            _that.minOrderQty,
            _that.offerStatus,
            _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WishlistItemModel extends WishlistItemModel {
  const _WishlistItemModel(
      {@IntJson() required this.id,
      @IntJson() @JsonKey(name: 'offer_id') required this.offerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') this.skuId,
      @StringOrNullJson() @JsonKey(name: 'display_name') this.displayName,
      @IntOrNullJson() @JsonKey(name: 'display_price') this.displayPrice,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') this.freeformName,
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      final List<PhotoModel> photos = const <PhotoModel>[],
      @DoubleJson() @JsonKey(name: 'min_order_qty') this.minOrderQty = 0,
      @StringOrNullJson() @JsonKey(name: 'offer_status') this.offerStatus,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : _photos = photos,
        super._();
  factory _WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntJson()
  @JsonKey(name: 'offer_id')
  final int offerId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  final int? skuId;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'display_price')
  final int? displayPrice;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'freeform_name')
  final String? freeformName;
  final List<PhotoModel> _photos;
  @override
  @PhotosJsonConverter()
  @JsonKey(name: 'photos_json')
  List<PhotoModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  @DoubleJson()
  @JsonKey(name: 'min_order_qty')
  final double minOrderQty;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'offer_status')
  final String? offerStatus;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of WishlistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WishlistItemModelCopyWith<_WishlistItemModel> get copyWith =>
      __$WishlistItemModelCopyWithImpl<_WishlistItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WishlistItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WishlistItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.displayPrice, displayPrice) ||
                other.displayPrice == displayPrice) &&
            (identical(other.freeformName, freeformName) ||
                other.freeformName == freeformName) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.minOrderQty, minOrderQty) ||
                other.minOrderQty == minOrderQty) &&
            (identical(other.offerStatus, offerStatus) ||
                other.offerStatus == offerStatus) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      offerId,
      skuId,
      displayName,
      displayPrice,
      freeformName,
      const DeepCollectionEquality().hash(_photos),
      minOrderQty,
      offerStatus,
      createdDate);

  @override
  String toString() {
    return 'WishlistItemModel(id: $id, offerId: $offerId, skuId: $skuId, displayName: $displayName, displayPrice: $displayPrice, freeformName: $freeformName, photos: $photos, minOrderQty: $minOrderQty, offerStatus: $offerStatus, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$WishlistItemModelCopyWith<$Res>
    implements $WishlistItemModelCopyWith<$Res> {
  factory _$WishlistItemModelCopyWith(
          _WishlistItemModel value, $Res Function(_WishlistItemModel) _then) =
      __$WishlistItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntJson() @JsonKey(name: 'offer_id') int offerId,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @StringOrNullJson() @JsonKey(name: 'display_name') String? displayName,
      @IntOrNullJson() @JsonKey(name: 'display_price') int? displayPrice,
      @StringOrNullJson() @JsonKey(name: 'freeform_name') String? freeformName,
      @PhotosJsonConverter()
      @JsonKey(name: 'photos_json')
      List<PhotoModel> photos,
      @DoubleJson() @JsonKey(name: 'min_order_qty') double minOrderQty,
      @StringOrNullJson() @JsonKey(name: 'offer_status') String? offerStatus,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$WishlistItemModelCopyWithImpl<$Res>
    implements _$WishlistItemModelCopyWith<$Res> {
  __$WishlistItemModelCopyWithImpl(this._self, this._then);

  final _WishlistItemModel _self;
  final $Res Function(_WishlistItemModel) _then;

  /// Create a copy of WishlistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? offerId = null,
    Object? skuId = freezed,
    Object? displayName = freezed,
    Object? displayPrice = freezed,
    Object? freeformName = freezed,
    Object? photos = null,
    Object? minOrderQty = null,
    Object? offerStatus = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_WishlistItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      displayPrice: freezed == displayPrice
          ? _self.displayPrice
          : displayPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      freeformName: freezed == freeformName
          ? _self.freeformName
          : freeformName // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      minOrderQty: null == minOrderQty
          ? _self.minOrderQty
          : minOrderQty // ignore: cast_nullable_to_non_nullable
              as double,
      offerStatus: freezed == offerStatus
          ? _self.offerStatus
          : offerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
