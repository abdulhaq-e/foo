// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
