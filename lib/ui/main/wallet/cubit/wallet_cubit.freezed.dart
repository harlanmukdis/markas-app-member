// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletState {
  bool get isLoading;
  bool get isSubmitting;
  DataError? get error;
  int get balance;
  List<WalletEntryModel> get entries;

  /// Top-up yang baru dibuat dan instruksinya masih perlu ditampilkan.
  WalletTopupModel? get lastTopup;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WalletStateCopyWith<WalletState> get copyWith =>
      _$WalletStateCopyWithImpl<WalletState>(this as WalletState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other.entries, entries) &&
            (identical(other.lastTopup, lastTopup) ||
                other.lastTopup == lastTopup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSubmitting, error,
      balance, const DeepCollectionEquality().hash(entries), lastTopup);

  @override
  String toString() {
    return 'WalletState(isLoading: $isLoading, isSubmitting: $isSubmitting, error: $error, balance: $balance, entries: $entries, lastTopup: $lastTopup)';
  }
}

/// @nodoc
abstract mixin class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) _then) =
      _$WalletStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSubmitting,
      DataError? error,
      int balance,
      List<WalletEntryModel> entries,
      WalletTopupModel? lastTopup});

  $WalletTopupModelCopyWith<$Res>? get lastTopup;
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res> implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._self, this._then);

  final WalletState _self;
  final $Res Function(WalletState) _then;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? balance = null,
    Object? entries = null,
    Object? lastTopup = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<WalletEntryModel>,
      lastTopup: freezed == lastTopup
          ? _self.lastTopup
          : lastTopup // ignore: cast_nullable_to_non_nullable
              as WalletTopupModel?,
    ));
  }

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletTopupModelCopyWith<$Res>? get lastTopup {
    if (_self.lastTopup == null) {
      return null;
    }

    return $WalletTopupModelCopyWith<$Res>(_self.lastTopup!, (value) {
      return _then(_self.copyWith(lastTopup: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WalletState].
extension WalletStatePatterns on WalletState {
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
    TResult Function(_WalletState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletState() when $default != null:
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
    TResult Function(_WalletState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletState():
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
    TResult? Function(_WalletState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletState() when $default != null:
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
            bool isSubmitting,
            DataError? error,
            int balance,
            List<WalletEntryModel> entries,
            WalletTopupModel? lastTopup)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WalletState() when $default != null:
        return $default(_that.isLoading, _that.isSubmitting, _that.error,
            _that.balance, _that.entries, _that.lastTopup);
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
            bool isSubmitting,
            DataError? error,
            int balance,
            List<WalletEntryModel> entries,
            WalletTopupModel? lastTopup)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletState():
        return $default(_that.isLoading, _that.isSubmitting, _that.error,
            _that.balance, _that.entries, _that.lastTopup);
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
            bool isSubmitting,
            DataError? error,
            int balance,
            List<WalletEntryModel> entries,
            WalletTopupModel? lastTopup)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WalletState() when $default != null:
        return $default(_that.isLoading, _that.isSubmitting, _that.error,
            _that.balance, _that.entries, _that.lastTopup);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WalletState extends WalletState {
  const _WalletState(
      {this.isLoading = true,
      this.isSubmitting = false,
      this.error,
      this.balance = 0,
      final List<WalletEntryModel> entries = const <WalletEntryModel>[],
      this.lastTopup})
      : _entries = entries,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final DataError? error;
  @override
  @JsonKey()
  final int balance;
  final List<WalletEntryModel> _entries;
  @override
  @JsonKey()
  List<WalletEntryModel> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Top-up yang baru dibuat dan instruksinya masih perlu ditampilkan.
  @override
  final WalletTopupModel? lastTopup;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WalletStateCopyWith<_WalletState> get copyWith =>
      __$WalletStateCopyWithImpl<_WalletState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.lastTopup, lastTopup) ||
                other.lastTopup == lastTopup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSubmitting, error,
      balance, const DeepCollectionEquality().hash(_entries), lastTopup);

  @override
  String toString() {
    return 'WalletState(isLoading: $isLoading, isSubmitting: $isSubmitting, error: $error, balance: $balance, entries: $entries, lastTopup: $lastTopup)';
  }
}

/// @nodoc
abstract mixin class _$WalletStateCopyWith<$Res>
    implements $WalletStateCopyWith<$Res> {
  factory _$WalletStateCopyWith(
          _WalletState value, $Res Function(_WalletState) _then) =
      __$WalletStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSubmitting,
      DataError? error,
      int balance,
      List<WalletEntryModel> entries,
      WalletTopupModel? lastTopup});

  @override
  $WalletTopupModelCopyWith<$Res>? get lastTopup;
}

/// @nodoc
class __$WalletStateCopyWithImpl<$Res> implements _$WalletStateCopyWith<$Res> {
  __$WalletStateCopyWithImpl(this._self, this._then);

  final _WalletState _self;
  final $Res Function(_WalletState) _then;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? balance = null,
    Object? entries = null,
    Object? lastTopup = freezed,
  }) {
    return _then(_WalletState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError?,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<WalletEntryModel>,
      lastTopup: freezed == lastTopup
          ? _self.lastTopup
          : lastTopup // ignore: cast_nullable_to_non_nullable
              as WalletTopupModel?,
    ));
  }

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletTopupModelCopyWith<$Res>? get lastTopup {
    if (_self.lastTopup == null) {
      return null;
    }

    return $WalletTopupModelCopyWith<$Res>(_self.lastTopup!, (value) {
      return _then(_self.copyWith(lastTopup: value));
    });
  }
}

// dart format on
