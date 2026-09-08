// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZoneModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'parent_id')
  int? get parentId;

  /// `PROVINCE`, `CITY`, atau `ZONE`.
  @StringJson()
  String get level;
  @StringJson()
  String get name;
  @StringOrNullJson()
  String? get code;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZoneModelCopyWith<ZoneModel> get copyWith =>
      _$ZoneModelCopyWithImpl<ZoneModel>(this as ZoneModel, _$identity);

  /// Serializes this ZoneModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZoneModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parentId, level, name, code, createdDate);

  @override
  String toString() {
    return 'ZoneModel(id: $id, parentId: $parentId, level: $level, name: $name, code: $code, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $ZoneModelCopyWith<$Res> {
  factory $ZoneModelCopyWith(ZoneModel value, $Res Function(ZoneModel) _then) =
      _$ZoneModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
      @StringJson() String level,
      @StringJson() String name,
      @StringOrNullJson() String? code,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$ZoneModelCopyWithImpl<$Res> implements $ZoneModelCopyWith<$Res> {
  _$ZoneModelCopyWithImpl(this._self, this._then);

  final ZoneModel _self;
  final $Res Function(ZoneModel) _then;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? level = null,
    Object? name = null,
    Object? code = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ZoneModel].
extension ZoneModelPatterns on ZoneModel {
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
    TResult Function(_ZoneModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ZoneModel() when $default != null:
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
    TResult Function(_ZoneModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ZoneModel():
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
    TResult? Function(_ZoneModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ZoneModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
            @StringJson() String level,
            @StringJson() String name,
            @StringOrNullJson() String? code,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ZoneModel() when $default != null:
        return $default(_that.id, _that.parentId, _that.level, _that.name,
            _that.code, _that.createdDate);
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
            @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
            @StringJson() String level,
            @StringJson() String name,
            @StringOrNullJson() String? code,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ZoneModel():
        return $default(_that.id, _that.parentId, _that.level, _that.name,
            _that.code, _that.createdDate);
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
            @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
            @StringJson() String level,
            @StringJson() String name,
            @StringOrNullJson() String? code,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ZoneModel() when $default != null:
        return $default(_that.id, _that.parentId, _that.level, _that.name,
            _that.code, _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ZoneModel extends ZoneModel {
  const _ZoneModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'parent_id') this.parentId,
      @StringJson() required this.level,
      @StringJson() required this.name,
      @StringOrNullJson() this.code,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : super._();
  factory _ZoneModel.fromJson(Map<String, dynamic> json) =>
      _$ZoneModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'parent_id')
  final int? parentId;

  /// `PROVINCE`, `CITY`, atau `ZONE`.
  @override
  @StringJson()
  final String level;
  @override
  @StringJson()
  final String name;
  @override
  @StringOrNullJson()
  final String? code;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ZoneModelCopyWith<_ZoneModel> get copyWith =>
      __$ZoneModelCopyWithImpl<_ZoneModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ZoneModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZoneModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parentId, level, name, code, createdDate);

  @override
  String toString() {
    return 'ZoneModel(id: $id, parentId: $parentId, level: $level, name: $name, code: $code, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$ZoneModelCopyWith<$Res>
    implements $ZoneModelCopyWith<$Res> {
  factory _$ZoneModelCopyWith(
          _ZoneModel value, $Res Function(_ZoneModel) _then) =
      __$ZoneModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'parent_id') int? parentId,
      @StringJson() String level,
      @StringJson() String name,
      @StringOrNullJson() String? code,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$ZoneModelCopyWithImpl<$Res> implements _$ZoneModelCopyWith<$Res> {
  __$ZoneModelCopyWithImpl(this._self, this._then);

  final _ZoneModel _self;
  final $Res Function(_ZoneModel) _then;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? level = null,
    Object? name = null,
    Object? code = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_ZoneModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$FleetTypeModel {
  @StringJson()
  String get code;
  @StringJson()
  String get name;

  /// Deskripsi kapasitas siap tampil, mis. `"± 5 ton"`.
  @StringOrNullJson()
  @JsonKey(name: 'capacity_kg_desc')
  String? get capacityKgDesc;

  /// Kapasitas muatan, dipakai backend untuk memblokir pengiriman yang
  /// melebihi kapasitas (`FLEET_PAYLOAD_EXCEEDED`).
  ///
  /// **Jangan di-hardcode di aplikasi** — nilainya masih DRAFT dan bisa
  /// diubah owner. Ambil dari endpoint ini.
  @DoubleOrNullJson()
  @JsonKey(name: 'max_payload_kg')
  double? get maxPayloadKg;

  /// Peringkat ukuran armada (1 = motor, 6 = tronton). Dipakai backend
  /// membandingkan dengan `access_type` alamat.
  @IntOrNullJson()
  @JsonKey(name: 'size_rank')
  int? get sizeRank;

  /// Create a copy of FleetTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FleetTypeModelCopyWith<FleetTypeModel> get copyWith =>
      _$FleetTypeModelCopyWithImpl<FleetTypeModel>(
          this as FleetTypeModel, _$identity);

  /// Serializes this FleetTypeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FleetTypeModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.capacityKgDesc, capacityKgDesc) ||
                other.capacityKgDesc == capacityKgDesc) &&
            (identical(other.maxPayloadKg, maxPayloadKg) ||
                other.maxPayloadKg == maxPayloadKg) &&
            (identical(other.sizeRank, sizeRank) ||
                other.sizeRank == sizeRank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, capacityKgDesc, maxPayloadKg, sizeRank);

  @override
  String toString() {
    return 'FleetTypeModel(code: $code, name: $name, capacityKgDesc: $capacityKgDesc, maxPayloadKg: $maxPayloadKg, sizeRank: $sizeRank)';
  }
}

/// @nodoc
abstract mixin class $FleetTypeModelCopyWith<$Res> {
  factory $FleetTypeModelCopyWith(
          FleetTypeModel value, $Res Function(FleetTypeModel) _then) =
      _$FleetTypeModelCopyWithImpl;
  @useResult
  $Res call(
      {@StringJson() String code,
      @StringJson() String name,
      @StringOrNullJson()
      @JsonKey(name: 'capacity_kg_desc')
      String? capacityKgDesc,
      @DoubleOrNullJson() @JsonKey(name: 'max_payload_kg') double? maxPayloadKg,
      @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank});
}

/// @nodoc
class _$FleetTypeModelCopyWithImpl<$Res>
    implements $FleetTypeModelCopyWith<$Res> {
  _$FleetTypeModelCopyWithImpl(this._self, this._then);

  final FleetTypeModel _self;
  final $Res Function(FleetTypeModel) _then;

  /// Create a copy of FleetTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? capacityKgDesc = freezed,
    Object? maxPayloadKg = freezed,
    Object? sizeRank = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      capacityKgDesc: freezed == capacityKgDesc
          ? _self.capacityKgDesc
          : capacityKgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPayloadKg: freezed == maxPayloadKg
          ? _self.maxPayloadKg
          : maxPayloadKg // ignore: cast_nullable_to_non_nullable
              as double?,
      sizeRank: freezed == sizeRank
          ? _self.sizeRank
          : sizeRank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FleetTypeModel].
extension FleetTypeModelPatterns on FleetTypeModel {
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
    TResult Function(_FleetTypeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel() when $default != null:
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
    TResult Function(_FleetTypeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel():
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
    TResult? Function(_FleetTypeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel() when $default != null:
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
            @StringJson() String code,
            @StringJson() String name,
            @StringOrNullJson()
            @JsonKey(name: 'capacity_kg_desc')
            String? capacityKgDesc,
            @DoubleOrNullJson()
            @JsonKey(name: 'max_payload_kg')
            double? maxPayloadKg,
            @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel() when $default != null:
        return $default(_that.code, _that.name, _that.capacityKgDesc,
            _that.maxPayloadKg, _that.sizeRank);
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
            @StringJson() String code,
            @StringJson() String name,
            @StringOrNullJson()
            @JsonKey(name: 'capacity_kg_desc')
            String? capacityKgDesc,
            @DoubleOrNullJson()
            @JsonKey(name: 'max_payload_kg')
            double? maxPayloadKg,
            @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel():
        return $default(_that.code, _that.name, _that.capacityKgDesc,
            _that.maxPayloadKg, _that.sizeRank);
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
            @StringJson() String code,
            @StringJson() String name,
            @StringOrNullJson()
            @JsonKey(name: 'capacity_kg_desc')
            String? capacityKgDesc,
            @DoubleOrNullJson()
            @JsonKey(name: 'max_payload_kg')
            double? maxPayloadKg,
            @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FleetTypeModel() when $default != null:
        return $default(_that.code, _that.name, _that.capacityKgDesc,
            _that.maxPayloadKg, _that.sizeRank);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FleetTypeModel implements FleetTypeModel {
  const _FleetTypeModel(
      {@StringJson() required this.code,
      @StringJson() required this.name,
      @StringOrNullJson()
      @JsonKey(name: 'capacity_kg_desc')
      this.capacityKgDesc,
      @DoubleOrNullJson() @JsonKey(name: 'max_payload_kg') this.maxPayloadKg,
      @IntOrNullJson() @JsonKey(name: 'size_rank') this.sizeRank});
  factory _FleetTypeModel.fromJson(Map<String, dynamic> json) =>
      _$FleetTypeModelFromJson(json);

  @override
  @StringJson()
  final String code;
  @override
  @StringJson()
  final String name;

  /// Deskripsi kapasitas siap tampil, mis. `"± 5 ton"`.
  @override
  @StringOrNullJson()
  @JsonKey(name: 'capacity_kg_desc')
  final String? capacityKgDesc;

  /// Kapasitas muatan, dipakai backend untuk memblokir pengiriman yang
  /// melebihi kapasitas (`FLEET_PAYLOAD_EXCEEDED`).
  ///
  /// **Jangan di-hardcode di aplikasi** — nilainya masih DRAFT dan bisa
  /// diubah owner. Ambil dari endpoint ini.
  @override
  @DoubleOrNullJson()
  @JsonKey(name: 'max_payload_kg')
  final double? maxPayloadKg;

  /// Peringkat ukuran armada (1 = motor, 6 = tronton). Dipakai backend
  /// membandingkan dengan `access_type` alamat.
  @override
  @IntOrNullJson()
  @JsonKey(name: 'size_rank')
  final int? sizeRank;

  /// Create a copy of FleetTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FleetTypeModelCopyWith<_FleetTypeModel> get copyWith =>
      __$FleetTypeModelCopyWithImpl<_FleetTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FleetTypeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FleetTypeModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.capacityKgDesc, capacityKgDesc) ||
                other.capacityKgDesc == capacityKgDesc) &&
            (identical(other.maxPayloadKg, maxPayloadKg) ||
                other.maxPayloadKg == maxPayloadKg) &&
            (identical(other.sizeRank, sizeRank) ||
                other.sizeRank == sizeRank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, capacityKgDesc, maxPayloadKg, sizeRank);

  @override
  String toString() {
    return 'FleetTypeModel(code: $code, name: $name, capacityKgDesc: $capacityKgDesc, maxPayloadKg: $maxPayloadKg, sizeRank: $sizeRank)';
  }
}

/// @nodoc
abstract mixin class _$FleetTypeModelCopyWith<$Res>
    implements $FleetTypeModelCopyWith<$Res> {
  factory _$FleetTypeModelCopyWith(
          _FleetTypeModel value, $Res Function(_FleetTypeModel) _then) =
      __$FleetTypeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@StringJson() String code,
      @StringJson() String name,
      @StringOrNullJson()
      @JsonKey(name: 'capacity_kg_desc')
      String? capacityKgDesc,
      @DoubleOrNullJson() @JsonKey(name: 'max_payload_kg') double? maxPayloadKg,
      @IntOrNullJson() @JsonKey(name: 'size_rank') int? sizeRank});
}

/// @nodoc
class __$FleetTypeModelCopyWithImpl<$Res>
    implements _$FleetTypeModelCopyWith<$Res> {
  __$FleetTypeModelCopyWithImpl(this._self, this._then);

  final _FleetTypeModel _self;
  final $Res Function(_FleetTypeModel) _then;

  /// Create a copy of FleetTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? capacityKgDesc = freezed,
    Object? maxPayloadKg = freezed,
    Object? sizeRank = freezed,
  }) {
    return _then(_FleetTypeModel(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      capacityKgDesc: freezed == capacityKgDesc
          ? _self.capacityKgDesc
          : capacityKgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      maxPayloadKg: freezed == maxPayloadKg
          ? _self.maxPayloadKg
          : maxPayloadKg // ignore: cast_nullable_to_non_nullable
              as double?,
      sizeRank: freezed == sizeRank
          ? _self.sizeRank
          : sizeRank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ConfigParameterModel {
  @IntJson()
  int get id;
  @StringJson()
  @JsonKey(name: 'param_group')
  String get paramGroup;
  @StringJson()
  @JsonKey(name: 'param_key')
  String get paramKey;
  @StringJson()
  @JsonKey(name: 'param_value')
  String get paramValue;

  /// `DECIMAL`, `INT`, `STRING`, `BOOL`, … — menentukan cara membaca
  /// [paramValue].
  @StringOrNullJson()
  @JsonKey(name: 'value_type')
  String? get valueType;
  @ServerDateTimeJson()
  @JsonKey(name: 'effective_from')
  DateTime? get effectiveFrom;
  @ServerDateTimeJson()
  @JsonKey(name: 'effective_to')
  DateTime? get effectiveTo;
  @StringOrNullJson()
  String? get description;

  /// Create a copy of ConfigParameterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigParameterModelCopyWith<ConfigParameterModel> get copyWith =>
      _$ConfigParameterModelCopyWithImpl<ConfigParameterModel>(
          this as ConfigParameterModel, _$identity);

  /// Serializes this ConfigParameterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfigParameterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paramGroup, paramGroup) ||
                other.paramGroup == paramGroup) &&
            (identical(other.paramKey, paramKey) ||
                other.paramKey == paramKey) &&
            (identical(other.paramValue, paramValue) ||
                other.paramValue == paramValue) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            (identical(other.effectiveTo, effectiveTo) ||
                other.effectiveTo == effectiveTo) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paramGroup, paramKey,
      paramValue, valueType, effectiveFrom, effectiveTo, description);

  @override
  String toString() {
    return 'ConfigParameterModel(id: $id, paramGroup: $paramGroup, paramKey: $paramKey, paramValue: $paramValue, valueType: $valueType, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ConfigParameterModelCopyWith<$Res> {
  factory $ConfigParameterModelCopyWith(ConfigParameterModel value,
          $Res Function(ConfigParameterModel) _then) =
      _$ConfigParameterModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() @JsonKey(name: 'param_group') String paramGroup,
      @StringJson() @JsonKey(name: 'param_key') String paramKey,
      @StringJson() @JsonKey(name: 'param_value') String paramValue,
      @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,
      @ServerDateTimeJson()
      @JsonKey(name: 'effective_from')
      DateTime? effectiveFrom,
      @ServerDateTimeJson()
      @JsonKey(name: 'effective_to')
      DateTime? effectiveTo,
      @StringOrNullJson() String? description});
}

/// @nodoc
class _$ConfigParameterModelCopyWithImpl<$Res>
    implements $ConfigParameterModelCopyWith<$Res> {
  _$ConfigParameterModelCopyWithImpl(this._self, this._then);

  final ConfigParameterModel _self;
  final $Res Function(ConfigParameterModel) _then;

  /// Create a copy of ConfigParameterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paramGroup = null,
    Object? paramKey = null,
    Object? paramValue = null,
    Object? valueType = freezed,
    Object? effectiveFrom = freezed,
    Object? effectiveTo = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paramGroup: null == paramGroup
          ? _self.paramGroup
          : paramGroup // ignore: cast_nullable_to_non_nullable
              as String,
      paramKey: null == paramKey
          ? _self.paramKey
          : paramKey // ignore: cast_nullable_to_non_nullable
              as String,
      paramValue: null == paramValue
          ? _self.paramValue
          : paramValue // ignore: cast_nullable_to_non_nullable
              as String,
      valueType: freezed == valueType
          ? _self.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveFrom: freezed == effectiveFrom
          ? _self.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      effectiveTo: freezed == effectiveTo
          ? _self.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ConfigParameterModel].
extension ConfigParameterModelPatterns on ConfigParameterModel {
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
    TResult Function(_ConfigParameterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel() when $default != null:
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
    TResult Function(_ConfigParameterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel():
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
    TResult? Function(_ConfigParameterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel() when $default != null:
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
            @StringJson() @JsonKey(name: 'param_group') String paramGroup,
            @StringJson() @JsonKey(name: 'param_key') String paramKey,
            @StringJson() @JsonKey(name: 'param_value') String paramValue,
            @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_from')
            DateTime? effectiveFrom,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_to')
            DateTime? effectiveTo,
            @StringOrNullJson() String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel() when $default != null:
        return $default(
            _that.id,
            _that.paramGroup,
            _that.paramKey,
            _that.paramValue,
            _that.valueType,
            _that.effectiveFrom,
            _that.effectiveTo,
            _that.description);
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
            @StringJson() @JsonKey(name: 'param_group') String paramGroup,
            @StringJson() @JsonKey(name: 'param_key') String paramKey,
            @StringJson() @JsonKey(name: 'param_value') String paramValue,
            @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_from')
            DateTime? effectiveFrom,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_to')
            DateTime? effectiveTo,
            @StringOrNullJson() String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel():
        return $default(
            _that.id,
            _that.paramGroup,
            _that.paramKey,
            _that.paramValue,
            _that.valueType,
            _that.effectiveFrom,
            _that.effectiveTo,
            _that.description);
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
            @StringJson() @JsonKey(name: 'param_group') String paramGroup,
            @StringJson() @JsonKey(name: 'param_key') String paramKey,
            @StringJson() @JsonKey(name: 'param_value') String paramValue,
            @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_from')
            DateTime? effectiveFrom,
            @ServerDateTimeJson()
            @JsonKey(name: 'effective_to')
            DateTime? effectiveTo,
            @StringOrNullJson() String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConfigParameterModel() when $default != null:
        return $default(
            _that.id,
            _that.paramGroup,
            _that.paramKey,
            _that.paramValue,
            _that.valueType,
            _that.effectiveFrom,
            _that.effectiveTo,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ConfigParameterModel extends ConfigParameterModel {
  const _ConfigParameterModel(
      {@IntJson() required this.id,
      @StringJson() @JsonKey(name: 'param_group') required this.paramGroup,
      @StringJson() @JsonKey(name: 'param_key') required this.paramKey,
      @StringJson() @JsonKey(name: 'param_value') required this.paramValue,
      @StringOrNullJson() @JsonKey(name: 'value_type') this.valueType,
      @ServerDateTimeJson() @JsonKey(name: 'effective_from') this.effectiveFrom,
      @ServerDateTimeJson() @JsonKey(name: 'effective_to') this.effectiveTo,
      @StringOrNullJson() this.description})
      : super._();
  factory _ConfigParameterModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigParameterModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringJson()
  @JsonKey(name: 'param_group')
  final String paramGroup;
  @override
  @StringJson()
  @JsonKey(name: 'param_key')
  final String paramKey;
  @override
  @StringJson()
  @JsonKey(name: 'param_value')
  final String paramValue;

  /// `DECIMAL`, `INT`, `STRING`, `BOOL`, … — menentukan cara membaca
  /// [paramValue].
  @override
  @StringOrNullJson()
  @JsonKey(name: 'value_type')
  final String? valueType;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'effective_from')
  final DateTime? effectiveFrom;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'effective_to')
  final DateTime? effectiveTo;
  @override
  @StringOrNullJson()
  final String? description;

  /// Create a copy of ConfigParameterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfigParameterModelCopyWith<_ConfigParameterModel> get copyWith =>
      __$ConfigParameterModelCopyWithImpl<_ConfigParameterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfigParameterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfigParameterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paramGroup, paramGroup) ||
                other.paramGroup == paramGroup) &&
            (identical(other.paramKey, paramKey) ||
                other.paramKey == paramKey) &&
            (identical(other.paramValue, paramValue) ||
                other.paramValue == paramValue) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            (identical(other.effectiveTo, effectiveTo) ||
                other.effectiveTo == effectiveTo) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paramGroup, paramKey,
      paramValue, valueType, effectiveFrom, effectiveTo, description);

  @override
  String toString() {
    return 'ConfigParameterModel(id: $id, paramGroup: $paramGroup, paramKey: $paramKey, paramValue: $paramValue, valueType: $valueType, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ConfigParameterModelCopyWith<$Res>
    implements $ConfigParameterModelCopyWith<$Res> {
  factory _$ConfigParameterModelCopyWith(_ConfigParameterModel value,
          $Res Function(_ConfigParameterModel) _then) =
      __$ConfigParameterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringJson() @JsonKey(name: 'param_group') String paramGroup,
      @StringJson() @JsonKey(name: 'param_key') String paramKey,
      @StringJson() @JsonKey(name: 'param_value') String paramValue,
      @StringOrNullJson() @JsonKey(name: 'value_type') String? valueType,
      @ServerDateTimeJson()
      @JsonKey(name: 'effective_from')
      DateTime? effectiveFrom,
      @ServerDateTimeJson()
      @JsonKey(name: 'effective_to')
      DateTime? effectiveTo,
      @StringOrNullJson() String? description});
}

/// @nodoc
class __$ConfigParameterModelCopyWithImpl<$Res>
    implements _$ConfigParameterModelCopyWith<$Res> {
  __$ConfigParameterModelCopyWithImpl(this._self, this._then);

  final _ConfigParameterModel _self;
  final $Res Function(_ConfigParameterModel) _then;

  /// Create a copy of ConfigParameterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? paramGroup = null,
    Object? paramKey = null,
    Object? paramValue = null,
    Object? valueType = freezed,
    Object? effectiveFrom = freezed,
    Object? effectiveTo = freezed,
    Object? description = freezed,
  }) {
    return _then(_ConfigParameterModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paramGroup: null == paramGroup
          ? _self.paramGroup
          : paramGroup // ignore: cast_nullable_to_non_nullable
              as String,
      paramKey: null == paramKey
          ? _self.paramKey
          : paramKey // ignore: cast_nullable_to_non_nullable
              as String,
      paramValue: null == paramValue
          ? _self.paramValue
          : paramValue // ignore: cast_nullable_to_non_nullable
              as String,
      valueType: freezed == valueType
          ? _self.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveFrom: freezed == effectiveFrom
          ? _self.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      effectiveTo: freezed == effectiveTo
          ? _self.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
