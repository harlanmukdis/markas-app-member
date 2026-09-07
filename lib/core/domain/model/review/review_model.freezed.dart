// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewSummaryModel {
  @IntJson()
  @JsonKey(name: 'review_count')
  int get reviewCount;

  /// Dikirim sebagai string desimal (`"5.00"`), termasuk `"0.00"` untuk
  /// penawaran yang belum punya ulasan.
  @DoubleJson()
  @JsonKey(name: 'avg_rating')
  double get avgRating;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewSummaryModelCopyWith<ReviewSummaryModel> get copyWith =>
      _$ReviewSummaryModelCopyWithImpl<ReviewSummaryModel>(
          this as ReviewSummaryModel, _$identity);

  /// Serializes this ReviewSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewSummaryModel &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewCount, avgRating);

  @override
  String toString() {
    return 'ReviewSummaryModel(reviewCount: $reviewCount, avgRating: $avgRating)';
  }
}

/// @nodoc
abstract mixin class $ReviewSummaryModelCopyWith<$Res> {
  factory $ReviewSummaryModelCopyWith(
          ReviewSummaryModel value, $Res Function(ReviewSummaryModel) _then) =
      _$ReviewSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'review_count') int reviewCount,
      @DoubleJson() @JsonKey(name: 'avg_rating') double avgRating});
}

/// @nodoc
class _$ReviewSummaryModelCopyWithImpl<$Res>
    implements $ReviewSummaryModelCopyWith<$Res> {
  _$ReviewSummaryModelCopyWithImpl(this._self, this._then);

  final ReviewSummaryModel _self;
  final $Res Function(ReviewSummaryModel) _then;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewCount = null,
    Object? avgRating = null,
  }) {
    return _then(_self.copyWith(
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgRating: null == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewSummaryModel].
extension ReviewSummaryModelPatterns on ReviewSummaryModel {
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
    TResult Function(_ReviewSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
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
    TResult Function(_ReviewSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel():
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
    TResult? Function(_ReviewSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
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
    TResult Function(@IntJson() @JsonKey(name: 'review_count') int reviewCount,
            @DoubleJson() @JsonKey(name: 'avg_rating') double avgRating)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
        return $default(_that.reviewCount, _that.avgRating);
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
    TResult Function(@IntJson() @JsonKey(name: 'review_count') int reviewCount,
            @DoubleJson() @JsonKey(name: 'avg_rating') double avgRating)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel():
        return $default(_that.reviewCount, _that.avgRating);
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
    TResult? Function(@IntJson() @JsonKey(name: 'review_count') int reviewCount,
            @DoubleJson() @JsonKey(name: 'avg_rating') double avgRating)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
        return $default(_that.reviewCount, _that.avgRating);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewSummaryModel extends ReviewSummaryModel {
  const _ReviewSummaryModel(
      {@IntJson() @JsonKey(name: 'review_count') this.reviewCount = 0,
      @DoubleJson() @JsonKey(name: 'avg_rating') this.avgRating = 0})
      : super._();
  factory _ReviewSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewSummaryModelFromJson(json);

  @override
  @IntJson()
  @JsonKey(name: 'review_count')
  final int reviewCount;

  /// Dikirim sebagai string desimal (`"5.00"`), termasuk `"0.00"` untuk
  /// penawaran yang belum punya ulasan.
  @override
  @DoubleJson()
  @JsonKey(name: 'avg_rating')
  final double avgRating;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewSummaryModelCopyWith<_ReviewSummaryModel> get copyWith =>
      __$ReviewSummaryModelCopyWithImpl<_ReviewSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewSummaryModel &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewCount, avgRating);

  @override
  String toString() {
    return 'ReviewSummaryModel(reviewCount: $reviewCount, avgRating: $avgRating)';
  }
}

/// @nodoc
abstract mixin class _$ReviewSummaryModelCopyWith<$Res>
    implements $ReviewSummaryModelCopyWith<$Res> {
  factory _$ReviewSummaryModelCopyWith(
          _ReviewSummaryModel value, $Res Function(_ReviewSummaryModel) _then) =
      __$ReviewSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() @JsonKey(name: 'review_count') int reviewCount,
      @DoubleJson() @JsonKey(name: 'avg_rating') double avgRating});
}

/// @nodoc
class __$ReviewSummaryModelCopyWithImpl<$Res>
    implements _$ReviewSummaryModelCopyWith<$Res> {
  __$ReviewSummaryModelCopyWithImpl(this._self, this._then);

  final _ReviewSummaryModel _self;
  final $Res Function(_ReviewSummaryModel) _then;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviewCount = null,
    Object? avgRating = null,
  }) {
    return _then(_ReviewSummaryModel(
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgRating: null == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$ReviewModel {
  @IntJson()
  int get id;
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  int? get offerId;
  @IntOrNullJson()
  @JsonKey(name: 'buyer_id')
  int? get buyerId;
  @IntJson()
  int get rating;
  @StringOrNullJson()
  String? get comment;
  @StringOrNullJson()
  @JsonKey(name: 'buyer_name')
  String? get buyerName;
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, offerId, buyerId, rating,
      comment, buyerName, createdDate);

  @override
  String toString() {
    return 'ReviewModel(id: $id, offerId: $offerId, buyerId: $buyerId, rating: $rating, comment: $comment, buyerName: $buyerName, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) _then) =
      _$ReviewModelCopyWithImpl;
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
      @IntJson() int rating,
      @StringOrNullJson() String? comment,
      @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offerId = freezed,
    Object? buyerId = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? buyerName = freezed,
    Object? createdDate = freezed,
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
      buyerId: freezed == buyerId
          ? _self.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerName: freezed == buyerName
          ? _self.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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
    TResult Function(_ReviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
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
    TResult Function(_ReviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel():
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
    TResult? Function(_ReviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
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
            @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
            @IntJson() int rating,
            @StringOrNullJson() String? comment,
            @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that.id, _that.offerId, _that.buyerId, _that.rating,
            _that.comment, _that.buyerName, _that.createdDate);
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
            @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
            @IntJson() int rating,
            @StringOrNullJson() String? comment,
            @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel():
        return $default(_that.id, _that.offerId, _that.buyerId, _that.rating,
            _that.comment, _that.buyerName, _that.createdDate);
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
            @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
            @IntJson() int rating,
            @StringOrNullJson() String? comment,
            @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
            @ServerDateTimeJson()
            @JsonKey(name: 'created_date')
            DateTime? createdDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that.id, _that.offerId, _that.buyerId, _that.rating,
            _that.comment, _that.buyerName, _that.createdDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewModel extends ReviewModel {
  const _ReviewModel(
      {@IntJson() required this.id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') this.offerId,
      @IntOrNullJson() @JsonKey(name: 'buyer_id') this.buyerId,
      @IntJson() required this.rating,
      @StringOrNullJson() this.comment,
      @StringOrNullJson() @JsonKey(name: 'buyer_name') this.buyerName,
      @ServerDateTimeJson() @JsonKey(name: 'created_date') this.createdDate})
      : super._();
  factory _ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  @override
  @IntJson()
  final int id;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'offer_id')
  final int? offerId;
  @override
  @IntOrNullJson()
  @JsonKey(name: 'buyer_id')
  final int? buyerId;
  @override
  @IntJson()
  final int rating;
  @override
  @StringOrNullJson()
  final String? comment;
  @override
  @StringOrNullJson()
  @JsonKey(name: 'buyer_name')
  final String? buyerName;
  @override
  @ServerDateTimeJson()
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewModelCopyWith<_ReviewModel> get copyWith =>
      __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, offerId, buyerId, rating,
      comment, buyerName, createdDate);

  @override
  String toString() {
    return 'ReviewModel(id: $id, offerId: $offerId, buyerId: $buyerId, rating: $rating, comment: $comment, buyerName: $buyerName, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(
          _ReviewModel value, $Res Function(_ReviewModel) _then) =
      __$ReviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntJson() int id,
      @IntOrNullJson() @JsonKey(name: 'offer_id') int? offerId,
      @IntOrNullJson() @JsonKey(name: 'buyer_id') int? buyerId,
      @IntJson() int rating,
      @StringOrNullJson() String? comment,
      @StringOrNullJson() @JsonKey(name: 'buyer_name') String? buyerName,
      @ServerDateTimeJson()
      @JsonKey(name: 'created_date')
      DateTime? createdDate});
}

/// @nodoc
class __$ReviewModelCopyWithImpl<$Res> implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? offerId = freezed,
    Object? buyerId = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? buyerName = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_ReviewModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: freezed == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      buyerId: freezed == buyerId
          ? _self.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerName: freezed == buyerName
          ? _self.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ReviewPageModel {
  ReviewSummaryModel get summary;
  List<ReviewModel> get items;

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewPageModelCopyWith<ReviewPageModel> get copyWith =>
      _$ReviewPageModelCopyWithImpl<ReviewPageModel>(
          this as ReviewPageModel, _$identity);

  /// Serializes this ReviewPageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewPageModel &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, summary, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ReviewPageModel(summary: $summary, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ReviewPageModelCopyWith<$Res> {
  factory $ReviewPageModelCopyWith(
          ReviewPageModel value, $Res Function(ReviewPageModel) _then) =
      _$ReviewPageModelCopyWithImpl;
  @useResult
  $Res call({ReviewSummaryModel summary, List<ReviewModel> items});

  $ReviewSummaryModelCopyWith<$Res> get summary;
}

/// @nodoc
class _$ReviewPageModelCopyWithImpl<$Res>
    implements $ReviewPageModelCopyWith<$Res> {
  _$ReviewPageModelCopyWithImpl(this._self, this._then);

  final ReviewPageModel _self;
  final $Res Function(ReviewPageModel) _then;

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ReviewSummaryModel,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
    ));
  }

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewSummaryModelCopyWith<$Res> get summary {
    return $ReviewSummaryModelCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReviewPageModel].
extension ReviewPageModelPatterns on ReviewPageModel {
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
    TResult Function(_ReviewPageModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel() when $default != null:
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
    TResult Function(_ReviewPageModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel():
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
    TResult? Function(_ReviewPageModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel() when $default != null:
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
    TResult Function(ReviewSummaryModel summary, List<ReviewModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel() when $default != null:
        return $default(_that.summary, _that.items);
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
    TResult Function(ReviewSummaryModel summary, List<ReviewModel> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel():
        return $default(_that.summary, _that.items);
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
    TResult? Function(ReviewSummaryModel summary, List<ReviewModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewPageModel() when $default != null:
        return $default(_that.summary, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewPageModel implements ReviewPageModel {
  const _ReviewPageModel(
      {this.summary = const ReviewSummaryModel(),
      final List<ReviewModel> items = const <ReviewModel>[]})
      : _items = items;
  factory _ReviewPageModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewPageModelFromJson(json);

  @override
  @JsonKey()
  final ReviewSummaryModel summary;
  final List<ReviewModel> _items;
  @override
  @JsonKey()
  List<ReviewModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewPageModelCopyWith<_ReviewPageModel> get copyWith =>
      __$ReviewPageModelCopyWithImpl<_ReviewPageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewPageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewPageModel &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, summary, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ReviewPageModel(summary: $summary, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ReviewPageModelCopyWith<$Res>
    implements $ReviewPageModelCopyWith<$Res> {
  factory _$ReviewPageModelCopyWith(
          _ReviewPageModel value, $Res Function(_ReviewPageModel) _then) =
      __$ReviewPageModelCopyWithImpl;
  @override
  @useResult
  $Res call({ReviewSummaryModel summary, List<ReviewModel> items});

  @override
  $ReviewSummaryModelCopyWith<$Res> get summary;
}

/// @nodoc
class __$ReviewPageModelCopyWithImpl<$Res>
    implements _$ReviewPageModelCopyWith<$Res> {
  __$ReviewPageModelCopyWithImpl(this._self, this._then);

  final _ReviewPageModel _self;
  final $Res Function(_ReviewPageModel) _then;

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? items = null,
  }) {
    return _then(_ReviewPageModel(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ReviewSummaryModel,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
    ));
  }

  /// Create a copy of ReviewPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewSummaryModelCopyWith<$Res> get summary {
    return $ReviewSummaryModelCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

// dart format on
