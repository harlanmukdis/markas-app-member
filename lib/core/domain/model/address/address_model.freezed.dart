// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {
  @IntJson()
  int get id;
  @StringOrNullJson()
  @JsonKey(name: 'owner_type')
  String? get ownerType;
  @StringOrNullJson()
  String? get label;
  @StringJson()
  @JsonKey(name: 'recipient_name')
  String get recipientName;
  @StringJson()
  String get phone;
  @StringJson()
  String get province;
  @StringJson()
  String get city;
  @StringOrNullJson()
  String? get district;
  @StringJson()
  @JsonKey(name: 'full_address')
  String get fullAddress;

  /// Koordinat **wajib** saat membuat alamat: server memakainya untuk
  /// menentukan zona ongkir (aturan USR-09). Dikirim balik sebagai string
  /// desimal (`"-6.2383000"`).
  @DoubleOrNullJson()
  double? get lat;
  @DoubleOrNullJson()
  double? get lng;
  @IntOrNullJson()
  @JsonKey(name: 'zone_id')
  int? get zoneId;
  @BoolJson()
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<AddressModel> get copyWith =>
      _$AddressModelCopyWithImpl<AddressModel>(
          this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerType, ownerType) ||
                other.ownerType == ownerType) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerType,
      label,
      recipientName,
      phone,
      province,
      city,
      district,
      fullAddress,
      lat,
      lng,
      zoneId,
      isDefault,
      createdDate);

  @override
  String toString() {
    return 'AddressModel(id: $id, ownerType: $ownerType, label: $label, recipientName: $recipientName, phone: $phone, province: $province, city: $city, district: $district, fullAddress: $fullAddress, lat: $lat, lng: $lng, zoneId: $zoneId, isDefault: $isDefault, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) _then) =
      _$AddressModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
      @StringOrNullJson() String? label,
      @StringJson() @JsonKey(name: 'recipient_name') String recipientName,
      @StringJson() String phone,
      @StringJson() String province,
      @StringJson() String city,
      @StringOrNullJson() String? district,
      @StringJson() @JsonKey(name: 'full_address') String fullAddress,
      @DoubleOrNullJson() double? lat,
      @DoubleOrNullJson() double? lng,
      @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
      @BoolJson() @JsonKey(name: 'is_default') bool isDefault,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerType = freezed,
    Object? label = freezed,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? city = null,
    Object? district = freezed,
    Object? fullAddress = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? zoneId = freezed,
    Object? isDefault = null,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerType: freezed == ownerType
          ? _self.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: null == recipientName
          ? _self.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _self.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: freezed == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAddress: null == fullAddress
          ? _self.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      zoneId: freezed == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddressModel].
extension AddressModelPatterns on AddressModel {
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
    TResult Function(_AddressModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressModel() when $default != null:
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
    TResult Function(_AddressModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressModel():
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
    TResult? Function(_AddressModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressModel() when $default != null:
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
            @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
            @StringOrNullJson() String? label,
            @StringJson() @JsonKey(name: 'recipient_name') String recipientName,
            @StringJson() String phone,
            @StringJson() String province,
            @StringJson() String city,
            @StringOrNullJson() String? district,
            @StringJson() @JsonKey(name: 'full_address') String fullAddress,
            @DoubleOrNullJson() double? lat,
            @DoubleOrNullJson() double? lng,
            @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
            @BoolJson() @JsonKey(name: 'is_default') bool isDefault,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressModel() when $default != null:
        return $default(
            _that.id,
            _that.ownerType,
            _that.label,
            _that.recipientName,
            _that.phone,
            _that.province,
            _that.city,
            _that.district,
            _that.fullAddress,
            _that.lat,
            _that.lng,
            _that.zoneId,
            _that.isDefault,
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
            @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
            @StringOrNullJson() String? label,
            @StringJson() @JsonKey(name: 'recipient_name') String recipientName,
            @StringJson() String phone,
            @StringJson() String province,
            @StringJson() String city,
            @StringOrNullJson() String? district,
            @StringJson() @JsonKey(name: 'full_address') String fullAddress,
            @DoubleOrNullJson() double? lat,
            @DoubleOrNullJson() double? lng,
            @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
            @BoolJson() @JsonKey(name: 'is_default') bool isDefault,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressModel():
        return $default(
            _that.id,
            _that.ownerType,
            _that.label,
            _that.recipientName,
            _that.phone,
            _that.province,
            _that.city,
            _that.district,
            _that.fullAddress,
            _that.lat,
            _that.lng,
            _that.zoneId,
            _that.isDefault,
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
            @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
            @StringOrNullJson() String? label,
            @StringJson() @JsonKey(name: 'recipient_name') String recipientName,
            @StringJson() String phone,
            @StringJson() String province,
            @StringJson() String city,
            @StringOrNullJson() String? district,
            @StringJson() @JsonKey(name: 'full_address') String fullAddress,
            @DoubleOrNullJson() double? lat,
            @DoubleOrNullJson() double? lng,
            @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
            @BoolJson() @JsonKey(name: 'is_default') bool isDefault,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressModel() when $default != null:
        return $default(
            _that.id,
            _that.ownerType,
            _that.label,
            _that.recipientName,
            _that.phone,
            _that.province,
            _that.city,
            _that.district,
            _that.fullAddress,
            _that.lat,
            _that.lng,
            _that.zoneId,
            _that.isDefault,
            _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AddressModel extends AddressModel {
  const _AddressModel(
      {@IntJson() required this.id,
      @StringOrNullJson() @JsonKey(name: 'owner_type') this.ownerType,
      @StringOrNullJson() this.label,
      @StringJson()
      @JsonKey(name: 'recipient_name')
      required this.recipientName,
      @StringJson() required this.phone,
      @StringJson() required this.province,
      @StringJson() required this.city,
      @StringOrNullJson() this.district,
      @StringJson() @JsonKey(name: 'full_address') required this.fullAddress,
      @DoubleOrNullJson() this.lat,
      @DoubleOrNullJson() this.lng,
      @IntOrNullJson() @JsonKey(name: 'zone_id') this.zoneId,
      @BoolJson() @JsonKey(name: 'is_default') this.isDefault = false,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : super._();
  factory _AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'owner_type')
  final String? ownerType;
  @override
  @StringOrNullJson()
  final String? label;
  @override
  @StringJson()
  @JsonKey(name: 'recipient_name')
  final String recipientName;
  @override
  @StringJson()
  final String phone;
  @override
  @StringJson()
  final String province;
  @override
  @StringJson()
  final String city;
  @override
  @StringOrNullJson()
  final String? district;
  @override
  @StringJson()
  @JsonKey(name: 'full_address')
  final String fullAddress;

  /// Koordinat **wajib** saat membuat alamat: server memakainya untuk
  /// menentukan zona ongkir (aturan USR-09). Dikirim balik sebagai string
  /// desimal (`"-6.2383000"`).
  @override
  @DoubleOrNullJson()
  final double? lat;
  @override
  @DoubleOrNullJson()
  final double? lng;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'zone_id')
  final int? zoneId;
  @override
  @BoolJson()
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerType, ownerType) ||
                other.ownerType == ownerType) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerType,
      label,
      recipientName,
      phone,
      province,
      city,
      district,
      fullAddress,
      lat,
      lng,
      zoneId,
      isDefault,
      createdDate);

  @override
  String toString() {
    return 'AddressModel(id: $id, ownerType: $ownerType, label: $label, recipientName: $recipientName, phone: $phone, province: $province, city: $city, district: $district, fullAddress: $fullAddress, lat: $lat, lng: $lng, zoneId: $zoneId, isDefault: $isDefault, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) _then) =
      __$AddressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @StringOrNullJson() @JsonKey(name: 'owner_type') String? ownerType,
      @StringOrNullJson() String? label,
      @StringJson() @JsonKey(name: 'recipient_name') String recipientName,
      @StringJson() String phone,
      @StringJson() String province,
      @StringJson() String city,
      @StringOrNullJson() String? district,
      @StringJson() @JsonKey(name: 'full_address') String fullAddress,
      @DoubleOrNullJson() double? lat,
      @DoubleOrNullJson() double? lng,
      @IntOrNullJson() @JsonKey(name: 'zone_id') int? zoneId,
      @BoolJson() @JsonKey(name: 'is_default') bool isDefault,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerType = freezed,
    Object? label = freezed,
    Object? recipientName = null,
    Object? phone = null,
    Object? province = null,
    Object? city = null,
    Object? district = freezed,
    Object? fullAddress = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? zoneId = freezed,
    Object? isDefault = null,
    Object? createdDate = freezed,
  }) {
    return _then(_AddressModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerType: freezed == ownerType
          ? _self.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientName: null == recipientName
          ? _self.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _self.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: freezed == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAddress: null == fullAddress
          ? _self.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      zoneId: freezed == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
