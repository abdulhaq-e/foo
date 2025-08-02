// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_data.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryDataState<Data> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QueryDataState<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QueryDataState<$Data>()';
  }
}

/// @nodoc
class $QueryDataStateCopyWith<Data, $Res> {
  $QueryDataStateCopyWith(
      QueryDataState<Data> _, $Res Function(QueryDataState<Data>) __);
}

/// Adds pattern-matching-related methods to [QueryDataState].
extension QueryDataStatePatterns<Data> on QueryDataState<Data> {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryDataInitial<Data> value)? initial,
    TResult Function(QueryDataLoading<Data> value)? loading,
    TResult Function(QueryDataLoaded<Data> value)? loaded,
    TResult Function(QueryDataFailedLoading<Data> value)? failedLoading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial() when initial != null:
        return initial(_that);
      case QueryDataLoading() when loading != null:
        return loading(_that);
      case QueryDataLoaded() when loaded != null:
        return loaded(_that);
      case QueryDataFailedLoading() when failedLoading != null:
        return failedLoading(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(QueryDataInitial<Data> value) initial,
    required TResult Function(QueryDataLoading<Data> value) loading,
    required TResult Function(QueryDataLoaded<Data> value) loaded,
    required TResult Function(QueryDataFailedLoading<Data> value) failedLoading,
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial():
        return initial(_that);
      case QueryDataLoading():
        return loading(_that);
      case QueryDataLoaded():
        return loaded(_that);
      case QueryDataFailedLoading():
        return failedLoading(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryDataInitial<Data> value)? initial,
    TResult? Function(QueryDataLoading<Data> value)? loading,
    TResult? Function(QueryDataLoaded<Data> value)? loaded,
    TResult? Function(QueryDataFailedLoading<Data> value)? failedLoading,
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial() when initial != null:
        return initial(_that);
      case QueryDataLoading() when loading != null:
        return loading(_that);
      case QueryDataLoaded() when loaded != null:
        return loaded(_that);
      case QueryDataFailedLoading() when failedLoading != null:
        return failedLoading(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Data data)? loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial() when initial != null:
        return initial();
      case QueryDataLoading() when loading != null:
        return loading();
      case QueryDataLoaded() when loaded != null:
        return loaded(_that.data);
      case QueryDataFailedLoading() when failedLoading != null:
        return failedLoading();
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Data data) loaded,
    required TResult Function() failedLoading,
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial():
        return initial();
      case QueryDataLoading():
        return loading();
      case QueryDataLoaded():
        return loaded(_that.data);
      case QueryDataFailedLoading():
        return failedLoading();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Data data)? loaded,
    TResult? Function()? failedLoading,
  }) {
    final _that = this;
    switch (_that) {
      case QueryDataInitial() when initial != null:
        return initial();
      case QueryDataLoading() when loading != null:
        return loading();
      case QueryDataLoaded() when loaded != null:
        return loaded(_that.data);
      case QueryDataFailedLoading() when failedLoading != null:
        return failedLoading();
      case _:
        return null;
    }
  }
}

/// @nodoc

class QueryDataInitial<Data> implements QueryDataState<Data> {
  QueryDataInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QueryDataInitial<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QueryDataState<$Data>.initial()';
  }
}

/// @nodoc

class QueryDataLoading<Data> implements QueryDataState<Data> {
  QueryDataLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QueryDataLoading<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QueryDataState<$Data>.loading()';
  }
}

/// @nodoc

class QueryDataLoaded<Data> implements QueryDataState<Data> {
  QueryDataLoaded({required this.data});

  final Data data;

  /// Create a copy of QueryDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryDataLoadedCopyWith<Data, QueryDataLoaded<Data>> get copyWith =>
      _$QueryDataLoadedCopyWithImpl<Data, QueryDataLoaded<Data>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryDataLoaded<Data> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'QueryDataState<$Data>.loaded(data: $data)';
  }
}

/// @nodoc
abstract mixin class $QueryDataLoadedCopyWith<Data, $Res>
    implements $QueryDataStateCopyWith<Data, $Res> {
  factory $QueryDataLoadedCopyWith(QueryDataLoaded<Data> value,
          $Res Function(QueryDataLoaded<Data>) _then) =
      _$QueryDataLoadedCopyWithImpl;
  @useResult
  $Res call({Data data});
}

/// @nodoc
class _$QueryDataLoadedCopyWithImpl<Data, $Res>
    implements $QueryDataLoadedCopyWith<Data, $Res> {
  _$QueryDataLoadedCopyWithImpl(this._self, this._then);

  final QueryDataLoaded<Data> _self;
  final $Res Function(QueryDataLoaded<Data>) _then;

  /// Create a copy of QueryDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(QueryDataLoaded<Data>(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class QueryDataFailedLoading<Data> implements QueryDataState<Data> {
  QueryDataFailedLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryDataFailedLoading<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QueryDataState<$Data>.failedLoading()';
  }
}

// dart format on
