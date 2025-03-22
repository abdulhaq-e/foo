// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_api_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenericAPIResponse<T> _$GenericAPIResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return GenericAPIResponseData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GenericAPIResponse<T> {
  T get data => throw _privateConstructorUsedError;

  /// Serializes this GenericAPIResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenericAPIResponseCopyWith<T, GenericAPIResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericAPIResponseCopyWith<T, $Res> {
  factory $GenericAPIResponseCopyWith(GenericAPIResponse<T> value,
          $Res Function(GenericAPIResponse<T>) then) =
      _$GenericAPIResponseCopyWithImpl<T, $Res, GenericAPIResponse<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$GenericAPIResponseCopyWithImpl<T, $Res,
        $Val extends GenericAPIResponse<T>>
    implements $GenericAPIResponseCopyWith<T, $Res> {
  _$GenericAPIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericAPIResponseDataImplCopyWith<T, $Res>
    implements $GenericAPIResponseCopyWith<T, $Res> {
  factory _$$GenericAPIResponseDataImplCopyWith(
          _$GenericAPIResponseDataImpl<T> value,
          $Res Function(_$GenericAPIResponseDataImpl<T>) then) =
      __$$GenericAPIResponseDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$GenericAPIResponseDataImplCopyWithImpl<T, $Res>
    extends _$GenericAPIResponseCopyWithImpl<T, $Res,
        _$GenericAPIResponseDataImpl<T>>
    implements _$$GenericAPIResponseDataImplCopyWith<T, $Res> {
  __$$GenericAPIResponseDataImplCopyWithImpl(
      _$GenericAPIResponseDataImpl<T> _value,
      $Res Function(_$GenericAPIResponseDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GenericAPIResponseDataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$GenericAPIResponseDataImpl<T> implements GenericAPIResponseData<T> {
  const _$GenericAPIResponseDataImpl(this.data);

  factory _$GenericAPIResponseDataImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$GenericAPIResponseDataImplFromJson(json, fromJsonT);

  @override
  final T data;

  @override
  String toString() {
    return 'GenericAPIResponse<$T>(data: $data)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericAPIResponseDataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericAPIResponseDataImplCopyWith<T, _$GenericAPIResponseDataImpl<T>>
      get copyWith => __$$GenericAPIResponseDataImplCopyWithImpl<T,
          _$GenericAPIResponseDataImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$GenericAPIResponseDataImplToJson<T>(this, toJsonT);
  }
}

abstract class GenericAPIResponseData<T> implements GenericAPIResponse<T> {
  const factory GenericAPIResponseData(final T data) =
      _$GenericAPIResponseDataImpl<T>;

  factory GenericAPIResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$GenericAPIResponseDataImpl<T>.fromJson;

  @override
  T get data;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericAPIResponseDataImplCopyWith<T, _$GenericAPIResponseDataImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
