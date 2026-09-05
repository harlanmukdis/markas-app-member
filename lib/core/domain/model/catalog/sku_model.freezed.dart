// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sku_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SkuUnitModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  int? get skuId;
  @StringJson()
  @JsonKey(name: 'unit_name')
  String get unitName;

  /// Berapa satuan dasar per satu satuan ini. **Desimal**, dikirim sebagai
  /// string `"1.0000"` — bukan bilangan bulat.
  @DoubleJson()
  @JsonKey(name: 'conversion_factor_to_base')
  double get conversionFactorToBase;
  @BoolJson()
  @JsonKey(name: 'is_default_sell_unit')
  bool get isDefaultSellUnit;

  /// Create a copy of SkuUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SkuUnitModelCopyWith<SkuUnitModel> get copyWith =>
      _$SkuUnitModelCopyWithImpl<SkuUnitModel>(
          this as SkuUnitModel, _$identity);

  /// Serializes this SkuUnitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SkuUnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.conversionFactorToBase, conversionFactorToBase) ||
                other.conversionFactorToBase == conversionFactorToBase) &&
            (identical(other.isDefaultSellUnit, isDefaultSellUnit) ||
                other.isDefaultSellUnit == isDefaultSellUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, skuId, unitName,
      conversionFactorToBase, isDefaultSellUnit);

  @override
  String toString() {
    return 'SkuUnitModel(id: $id, skuId: $skuId, unitName: $unitName, conversionFactorToBase: $conversionFactorToBase, isDefaultSellUnit: $isDefaultSellUnit)';
  }
}

/// @nodoc
abstract mixin class $SkuUnitModelCopyWith<$Res> {
  factory $SkuUnitModelCopyWith(
          SkuUnitModel value, $Res Function(SkuUnitModel) _then) =
      _$SkuUnitModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @StringJson() @JsonKey(name: 'unit_name') String unitName,
      @DoubleJson()
      @JsonKey(name: 'conversion_factor_to_base')
      double conversionFactorToBase,
      @BoolJson()
      @JsonKey(name: 'is_default_sell_unit')
      bool isDefaultSellUnit});
}

/// @nodoc
class _$SkuUnitModelCopyWithImpl<$Res> implements $SkuUnitModelCopyWith<$Res> {
  _$SkuUnitModelCopyWithImpl(this._self, this._then);

  final SkuUnitModel _self;
  final $Res Function(SkuUnitModel) _then;

  /// Create a copy of SkuUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? skuId = freezed,
    Object? unitName = null,
    Object? conversionFactorToBase = null,
    Object? isDefaultSellUnit = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      conversionFactorToBase: null == conversionFactorToBase
          ? _self.conversionFactorToBase
          : conversionFactorToBase // ignore: cast_nullable_to_non_nullable
              as double,
      isDefaultSellUnit: null == isDefaultSellUnit
          ? _self.isDefaultSellUnit
          : isDefaultSellUnit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SkuUnitModel].
extension SkuUnitModelPatterns on SkuUnitModel {
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
    TResult Function(_SkuUnitModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel() when $default != null:
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
    TResult Function(_SkuUnitModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel():
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
    TResult? Function(_SkuUnitModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringJson() @JsonKey(name: 'unit_name') String unitName,
            @DoubleJson()
            @JsonKey(name: 'conversion_factor_to_base')
            double conversionFactorToBase,
            @BoolJson()
            @JsonKey(name: 'is_default_sell_unit')
            bool isDefaultSellUnit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel() when $default != null:
        return $default(_that.id, _that.skuId, _that.unitName,
            _that.conversionFactorToBase, _that.isDefaultSellUnit);
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
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringJson() @JsonKey(name: 'unit_name') String unitName,
            @DoubleJson()
            @JsonKey(name: 'conversion_factor_to_base')
            double conversionFactorToBase,
            @BoolJson()
            @JsonKey(name: 'is_default_sell_unit')
            bool isDefaultSellUnit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel():
        return $default(_that.id, _that.skuId, _that.unitName,
            _that.conversionFactorToBase, _that.isDefaultSellUnit);
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
            @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
            @StringJson() @JsonKey(name: 'unit_name') String unitName,
            @DoubleJson()
            @JsonKey(name: 'conversion_factor_to_base')
            double conversionFactorToBase,
            @BoolJson()
            @JsonKey(name: 'is_default_sell_unit')
            bool isDefaultSellUnit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuUnitModel() when $default != null:
        return $default(_that.id, _that.skuId, _that.unitName,
            _that.conversionFactorToBase, _that.isDefaultSellUnit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SkuUnitModel extends SkuUnitModel {
  const _SkuUnitModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'sku_id') this.skuId,
      @StringJson() @JsonKey(name: 'unit_name') required this.unitName,
      @DoubleJson()
      @JsonKey(name: 'conversion_factor_to_base')
      this.conversionFactorToBase = 1,
      @BoolJson()
      @JsonKey(name: 'is_default_sell_unit')
      this.isDefaultSellUnit = false})
      : super._();
  factory _SkuUnitModel.fromJson(Map<String, dynamic> json) =>
      _$SkuUnitModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'sku_id')
  final int? skuId;
  @override
  @StringJson()
  @JsonKey(name: 'unit_name')
  final String unitName;

  /// Berapa satuan dasar per satu satuan ini. **Desimal**, dikirim sebagai
  /// string `"1.0000"` — bukan bilangan bulat.
  @override
  @DoubleJson()
  @JsonKey(name: 'conversion_factor_to_base')
  final double conversionFactorToBase;
  @override
  @BoolJson()
  @JsonKey(name: 'is_default_sell_unit')
  final bool isDefaultSellUnit;

  /// Create a copy of SkuUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SkuUnitModelCopyWith<_SkuUnitModel> get copyWith =>
      __$SkuUnitModelCopyWithImpl<_SkuUnitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SkuUnitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SkuUnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.conversionFactorToBase, conversionFactorToBase) ||
                other.conversionFactorToBase == conversionFactorToBase) &&
            (identical(other.isDefaultSellUnit, isDefaultSellUnit) ||
                other.isDefaultSellUnit == isDefaultSellUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, skuId, unitName,
      conversionFactorToBase, isDefaultSellUnit);

  @override
  String toString() {
    return 'SkuUnitModel(id: $id, skuId: $skuId, unitName: $unitName, conversionFactorToBase: $conversionFactorToBase, isDefaultSellUnit: $isDefaultSellUnit)';
  }
}

/// @nodoc
abstract mixin class _$SkuUnitModelCopyWith<$Res>
    implements $SkuUnitModelCopyWith<$Res> {
  factory _$SkuUnitModelCopyWith(
          _SkuUnitModel value, $Res Function(_SkuUnitModel) _then) =
      __$SkuUnitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'sku_id') int? skuId,
      @StringJson() @JsonKey(name: 'unit_name') String unitName,
      @DoubleJson()
      @JsonKey(name: 'conversion_factor_to_base')
      double conversionFactorToBase,
      @BoolJson()
      @JsonKey(name: 'is_default_sell_unit')
      bool isDefaultSellUnit});
}

/// @nodoc
class __$SkuUnitModelCopyWithImpl<$Res>
    implements _$SkuUnitModelCopyWith<$Res> {
  __$SkuUnitModelCopyWithImpl(this._self, this._then);

  final _SkuUnitModel _self;
  final $Res Function(_SkuUnitModel) _then;

  /// Create a copy of SkuUnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? skuId = freezed,
    Object? unitName = null,
    Object? conversionFactorToBase = null,
    Object? isDefaultSellUnit = null,
  }) {
    return _then(_SkuUnitModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      skuId: freezed == skuId
          ? _self.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as int?,
      unitName: null == unitName
          ? _self.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      conversionFactorToBase: null == conversionFactorToBase
          ? _self.conversionFactorToBase
          : conversionFactorToBase // ignore: cast_nullable_to_non_nullable
              as double,
      isDefaultSellUnit: null == isDefaultSellUnit
          ? _self.isDefaultSellUnit
          : isDefaultSellUnit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SkuModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @StringJson()
  String get name;
  @IntOrNullJson()
  @JsonKey(name: 'brand_id')
  int? get brandId;
  @StringOrNullJson()
  @JsonKey(name: 'base_unit')
  String?
      get baseUnit; // Dimensi & berat semuanya DECIMAL di database, jadi double.
  @DoubleOrNullJson()
  @JsonKey(name: 'weight_kg')
  double? get weightKg;
  @DoubleOrNullJson()
  @JsonKey(name: 'length_cm')
  double? get lengthCm;
  @DoubleOrNullJson()
  @JsonKey(name: 'width_cm')
  double? get widthCm;
  @DoubleOrNullJson()
  @JsonKey(name: 'height_cm')
  double? get heightCm;
  @DoubleOrNullJson()
  @JsonKey(name: 'volumetric_divisor')
  double? get volumetricDivisor;

  /// `NORMAL`, `PECAH_BELAH`, `BERBAHAYA`, atau `OVERSIZE`.
  /// Menentukan panjang jendela retur (2×24 jam vs 7 hari).
  @StringJson()
  @JsonKey(name: 'handling_class')
  String get handlingClass;
  @BoolJson()
  @JsonKey(name: 'is_quote_first')
  bool get isQuoteFirst;
  @StringJson()
  String get status;
  @IntOrNullJson()
  @JsonKey(name: 'merged_into_sku_id')
  int? get mergedIntoSkuId;
  List<SkuUnitModel> get units;

  /// Longgar dengan sengaja — lihat catatan pada `CategoryModel.attributes`.
  List<Map<String, dynamic>> get attributes;

  /// Create a copy of SkuModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SkuModelCopyWith<SkuModel> get copyWith =>
      _$SkuModelCopyWithImpl<SkuModel>(this as SkuModel, _$identity);

  /// Serializes this SkuModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SkuModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.baseUnit, baseUnit) ||
                other.baseUnit == baseUnit) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.lengthCm, lengthCm) ||
                other.lengthCm == lengthCm) &&
            (identical(other.widthCm, widthCm) || other.widthCm == widthCm) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.volumetricDivisor, volumetricDivisor) ||
                other.volumetricDivisor == volumetricDivisor) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.isQuoteFirst, isQuoteFirst) ||
                other.isQuoteFirst == isQuoteFirst) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mergedIntoSkuId, mergedIntoSkuId) ||
                other.mergedIntoSkuId == mergedIntoSkuId) &&
            const DeepCollectionEquality().equals(other.units, units) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      name,
      brandId,
      baseUnit,
      weightKg,
      lengthCm,
      widthCm,
      heightCm,
      volumetricDivisor,
      handlingClass,
      isQuoteFirst,
      status,
      mergedIntoSkuId,
      const DeepCollectionEquality().hash(units),
      const DeepCollectionEquality().hash(attributes));

  @override
  String toString() {
    return 'SkuModel(id: $id, categoryId: $categoryId, name: $name, brandId: $brandId, baseUnit: $baseUnit, weightKg: $weightKg, lengthCm: $lengthCm, widthCm: $widthCm, heightCm: $heightCm, volumetricDivisor: $volumetricDivisor, handlingClass: $handlingClass, isQuoteFirst: $isQuoteFirst, status: $status, mergedIntoSkuId: $mergedIntoSkuId, units: $units, attributes: $attributes)';
  }
}

/// @nodoc
abstract mixin class $SkuModelCopyWith<$Res> {
  factory $SkuModelCopyWith(SkuModel value, $Res Function(SkuModel) _then) =
      _$SkuModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
      @StringJson() String name,
      @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
      @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
      @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
      @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
      @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'volumetric_divisor')
      double? volumetricDivisor,
      @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
      @BoolJson() @JsonKey(name: 'is_quote_first') bool isQuoteFirst,
      @StringJson() String status,
      @IntOrNullJson()
      @JsonKey(name: 'merged_into_sku_id')
      int? mergedIntoSkuId,
      List<SkuUnitModel> units,
      List<Map<String, dynamic>> attributes});
}

/// @nodoc
class _$SkuModelCopyWithImpl<$Res> implements $SkuModelCopyWith<$Res> {
  _$SkuModelCopyWithImpl(this._self, this._then);

  final SkuModel _self;
  final $Res Function(SkuModel) _then;

  /// Create a copy of SkuModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? name = null,
    Object? brandId = freezed,
    Object? baseUnit = freezed,
    Object? weightKg = freezed,
    Object? lengthCm = freezed,
    Object? widthCm = freezed,
    Object? heightCm = freezed,
    Object? volumetricDivisor = freezed,
    Object? handlingClass = null,
    Object? isQuoteFirst = null,
    Object? status = null,
    Object? mergedIntoSkuId = freezed,
    Object? units = null,
    Object? attributes = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: freezed == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      baseUnit: freezed == baseUnit
          ? _self.baseUnit
          : baseUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      lengthCm: freezed == lengthCm
          ? _self.lengthCm
          : lengthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      widthCm: freezed == widthCm
          ? _self.widthCm
          : widthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      volumetricDivisor: freezed == volumetricDivisor
          ? _self.volumetricDivisor
          : volumetricDivisor // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: null == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String,
      isQuoteFirst: null == isQuoteFirst
          ? _self.isQuoteFirst
          : isQuoteFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      mergedIntoSkuId: freezed == mergedIntoSkuId
          ? _self.mergedIntoSkuId
          : mergedIntoSkuId // ignore: cast_nullable_to_non_nullable
              as int?,
      units: null == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<SkuUnitModel>,
      attributes: null == attributes
          ? _self.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SkuModel].
extension SkuModelPatterns on SkuModel {
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
    TResult Function(_SkuModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SkuModel() when $default != null:
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
    TResult Function(_SkuModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuModel():
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
    TResult? Function(_SkuModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @StringJson() String name,
            @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
            @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
            @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
            @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
            @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
            @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'volumetric_divisor')
            double? volumetricDivisor,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @BoolJson() @JsonKey(name: 'is_quote_first') bool isQuoteFirst,
            @StringJson() String status,
            @IntOrNullJson()
            @JsonKey(name: 'merged_into_sku_id')
            int? mergedIntoSkuId,
            List<SkuUnitModel> units,
            List<Map<String, dynamic>> attributes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SkuModel() when $default != null:
        return $default(
            _that.id,
            _that.categoryId,
            _that.name,
            _that.brandId,
            _that.baseUnit,
            _that.weightKg,
            _that.lengthCm,
            _that.widthCm,
            _that.heightCm,
            _that.volumetricDivisor,
            _that.handlingClass,
            _that.isQuoteFirst,
            _that.status,
            _that.mergedIntoSkuId,
            _that.units,
            _that.attributes);
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
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @StringJson() String name,
            @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
            @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
            @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
            @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
            @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
            @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'volumetric_divisor')
            double? volumetricDivisor,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @BoolJson() @JsonKey(name: 'is_quote_first') bool isQuoteFirst,
            @StringJson() String status,
            @IntOrNullJson()
            @JsonKey(name: 'merged_into_sku_id')
            int? mergedIntoSkuId,
            List<SkuUnitModel> units,
            List<Map<String, dynamic>> attributes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuModel():
        return $default(
            _that.id,
            _that.categoryId,
            _that.name,
            _that.brandId,
            _that.baseUnit,
            _that.weightKg,
            _that.lengthCm,
            _that.widthCm,
            _that.heightCm,
            _that.volumetricDivisor,
            _that.handlingClass,
            _that.isQuoteFirst,
            _that.status,
            _that.mergedIntoSkuId,
            _that.units,
            _that.attributes);
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
            @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
            @StringJson() String name,
            @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
            @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
            @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
            @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
            @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
            @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
            @DoubleOrNullJson()
            @JsonKey(name: 'volumetric_divisor')
            double? volumetricDivisor,
            @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
            @BoolJson() @JsonKey(name: 'is_quote_first') bool isQuoteFirst,
            @StringJson() String status,
            @IntOrNullJson()
            @JsonKey(name: 'merged_into_sku_id')
            int? mergedIntoSkuId,
            List<SkuUnitModel> units,
            List<Map<String, dynamic>> attributes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SkuModel() when $default != null:
        return $default(
            _that.id,
            _that.categoryId,
            _that.name,
            _that.brandId,
            _that.baseUnit,
            _that.weightKg,
            _that.lengthCm,
            _that.widthCm,
            _that.heightCm,
            _that.volumetricDivisor,
            _that.handlingClass,
            _that.isQuoteFirst,
            _that.status,
            _that.mergedIntoSkuId,
            _that.units,
            _that.attributes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SkuModel extends SkuModel {
  const _SkuModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'category_id') this.categoryId,
      @StringJson() required this.name,
      @IntOrNullJson() @JsonKey(name: 'brand_id') this.brandId,
      @StringOrNullJson() @JsonKey(name: 'base_unit') this.baseUnit,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg') this.weightKg,
      @DoubleOrNullJson() @JsonKey(name: 'length_cm') this.lengthCm,
      @DoubleOrNullJson() @JsonKey(name: 'width_cm') this.widthCm,
      @DoubleOrNullJson() @JsonKey(name: 'height_cm') this.heightCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'volumetric_divisor')
      this.volumetricDivisor,
      @StringJson()
      @JsonKey(name: 'handling_class')
      this.handlingClass = 'NORMAL',
      @BoolJson() @JsonKey(name: 'is_quote_first') this.isQuoteFirst = false,
      @StringJson() this.status = 'ACTIVE',
      @IntOrNullJson()
      @JsonKey(name: 'merged_into_sku_id')
      this.mergedIntoSkuId,
      final List<SkuUnitModel> units = const <SkuUnitModel>[],
      final List<Map<String, dynamic>> attributes =
          const <Map<String, dynamic>>[]})
      : _units = units,
        _attributes = attributes,
        super._();
  factory _SkuModel.fromJson(Map<String, dynamic> json) =>
      _$SkuModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @StringJson()
  final String name;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'brand_id')
  final int? brandId;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'base_unit')
  final String? baseUnit;
// Dimensi & berat semuanya DECIMAL di database, jadi double.
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'weight_kg')
  final double? weightKg;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'length_cm')
  final double? lengthCm;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'width_cm')
  final double? widthCm;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'height_cm')
  final double? heightCm;
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'volumetric_divisor')
  final double? volumetricDivisor;

  /// `NORMAL`, `PECAH_BELAH`, `BERBAHAYA`, atau `OVERSIZE`.
  /// Menentukan panjang jendela retur (2×24 jam vs 7 hari).
  @override
  @StringJson()
  @JsonKey(name: 'handling_class')
  final String handlingClass;
  @override
  @BoolJson()
  @JsonKey(name: 'is_quote_first')
  final bool isQuoteFirst;
  @override
  @JsonKey()
  @StringJson()
  final String status;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'merged_into_sku_id')
  final int? mergedIntoSkuId;
  final List<SkuUnitModel> _units;
  @override
  @JsonKey()
  List<SkuUnitModel> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  /// Longgar dengan sengaja — lihat catatan pada `CategoryModel.attributes`.
  final List<Map<String, dynamic>> _attributes;

  /// Longgar dengan sengaja — lihat catatan pada `CategoryModel.attributes`.
  @override
  @JsonKey()
  List<Map<String, dynamic>> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  /// Create a copy of SkuModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SkuModelCopyWith<_SkuModel> get copyWith =>
      __$SkuModelCopyWithImpl<_SkuModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SkuModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SkuModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.baseUnit, baseUnit) ||
                other.baseUnit == baseUnit) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.lengthCm, lengthCm) ||
                other.lengthCm == lengthCm) &&
            (identical(other.widthCm, widthCm) || other.widthCm == widthCm) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.volumetricDivisor, volumetricDivisor) ||
                other.volumetricDivisor == volumetricDivisor) &&
            (identical(other.handlingClass, handlingClass) ||
                other.handlingClass == handlingClass) &&
            (identical(other.isQuoteFirst, isQuoteFirst) ||
                other.isQuoteFirst == isQuoteFirst) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mergedIntoSkuId, mergedIntoSkuId) ||
                other.mergedIntoSkuId == mergedIntoSkuId) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      name,
      brandId,
      baseUnit,
      weightKg,
      lengthCm,
      widthCm,
      heightCm,
      volumetricDivisor,
      handlingClass,
      isQuoteFirst,
      status,
      mergedIntoSkuId,
      const DeepCollectionEquality().hash(_units),
      const DeepCollectionEquality().hash(_attributes));

  @override
  String toString() {
    return 'SkuModel(id: $id, categoryId: $categoryId, name: $name, brandId: $brandId, baseUnit: $baseUnit, weightKg: $weightKg, lengthCm: $lengthCm, widthCm: $widthCm, heightCm: $heightCm, volumetricDivisor: $volumetricDivisor, handlingClass: $handlingClass, isQuoteFirst: $isQuoteFirst, status: $status, mergedIntoSkuId: $mergedIntoSkuId, units: $units, attributes: $attributes)';
  }
}

/// @nodoc
abstract mixin class _$SkuModelCopyWith<$Res>
    implements $SkuModelCopyWith<$Res> {
  factory _$SkuModelCopyWith(_SkuModel value, $Res Function(_SkuModel) _then) =
      __$SkuModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'category_id') int? categoryId,
      @StringJson() String name,
      @IntOrNullJson() @JsonKey(name: 'brand_id') int? brandId,
      @StringOrNullJson() @JsonKey(name: 'base_unit') String? baseUnit,
      @DoubleOrNullJson() @JsonKey(name: 'weight_kg') double? weightKg,
      @DoubleOrNullJson() @JsonKey(name: 'length_cm') double? lengthCm,
      @DoubleOrNullJson() @JsonKey(name: 'width_cm') double? widthCm,
      @DoubleOrNullJson() @JsonKey(name: 'height_cm') double? heightCm,
      @DoubleOrNullJson()
      @JsonKey(name: 'volumetric_divisor')
      double? volumetricDivisor,
      @StringJson() @JsonKey(name: 'handling_class') String handlingClass,
      @BoolJson() @JsonKey(name: 'is_quote_first') bool isQuoteFirst,
      @StringJson() String status,
      @IntOrNullJson()
      @JsonKey(name: 'merged_into_sku_id')
      int? mergedIntoSkuId,
      List<SkuUnitModel> units,
      List<Map<String, dynamic>> attributes});
}

/// @nodoc
class __$SkuModelCopyWithImpl<$Res> implements _$SkuModelCopyWith<$Res> {
  __$SkuModelCopyWithImpl(this._self, this._then);

  final _SkuModel _self;
  final $Res Function(_SkuModel) _then;

  /// Create a copy of SkuModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? name = null,
    Object? brandId = freezed,
    Object? baseUnit = freezed,
    Object? weightKg = freezed,
    Object? lengthCm = freezed,
    Object? widthCm = freezed,
    Object? heightCm = freezed,
    Object? volumetricDivisor = freezed,
    Object? handlingClass = null,
    Object? isQuoteFirst = null,
    Object? status = null,
    Object? mergedIntoSkuId = freezed,
    Object? units = null,
    Object? attributes = null,
  }) {
    return _then(_SkuModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: freezed == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      baseUnit: freezed == baseUnit
          ? _self.baseUnit
          : baseUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      lengthCm: freezed == lengthCm
          ? _self.lengthCm
          : lengthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      widthCm: freezed == widthCm
          ? _self.widthCm
          : widthCm // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _self.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      volumetricDivisor: freezed == volumetricDivisor
          ? _self.volumetricDivisor
          : volumetricDivisor // ignore: cast_nullable_to_non_nullable
              as double?,
      handlingClass: null == handlingClass
          ? _self.handlingClass
          : handlingClass // ignore: cast_nullable_to_non_nullable
              as String,
      isQuoteFirst: null == isQuoteFirst
          ? _self.isQuoteFirst
          : isQuoteFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      mergedIntoSkuId: freezed == mergedIntoSkuId
          ? _self.mergedIntoSkuId
          : mergedIntoSkuId // ignore: cast_nullable_to_non_nullable
              as int?,
      units: null == units
          ? _self._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<SkuUnitModel>,
      attributes: null == attributes
          ? _self._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

// dart format on
