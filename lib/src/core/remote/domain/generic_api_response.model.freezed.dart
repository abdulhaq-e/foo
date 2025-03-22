// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_api_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GenericAPIResponse<T> _$GenericAPIResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return GenericAPIResponseData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GenericAPIResponse<T> {
  T get data;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericAPIResponseCopyWith<T, GenericAPIResponse<T>> get copyWith =>
      _$GenericAPIResponseCopyWithImpl<T, GenericAPIResponse<T>>(
          this as GenericAPIResponse<T>, _$identity);

  /// Serializes this GenericAPIResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericAPIResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'GenericAPIResponse<$T>(data: $data)';
  }
}

/// @nodoc
abstract mixin class $GenericAPIResponseCopyWith<T, $Res> {
  factory $GenericAPIResponseCopyWith(GenericAPIResponse<T> value,
          $Res Function(GenericAPIResponse<T>) _then) =
      _$GenericAPIResponseCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$GenericAPIResponseCopyWithImpl<T, $Res>
    implements $GenericAPIResponseCopyWith<T, $Res> {
  _$GenericAPIResponseCopyWithImpl(this._self, this._then);

  final GenericAPIResponse<T> _self;
  final $Res Function(GenericAPIResponse<T>) _then;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class GenericAPIResponseData<T> implements GenericAPIResponse<T> {
  const GenericAPIResponseData(this.data);
  factory GenericAPIResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$GenericAPIResponseDataFromJson(json, fromJsonT);

  @override
  final T data;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericAPIResponseDataCopyWith<T, GenericAPIResponseData<T>> get copyWith =>
      _$GenericAPIResponseDataCopyWithImpl<T, GenericAPIResponseData<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$GenericAPIResponseDataToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericAPIResponseData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'GenericAPIResponse<$T>(data: $data)';
  }
}

/// @nodoc
abstract mixin class $GenericAPIResponseDataCopyWith<T, $Res>
    implements $GenericAPIResponseCopyWith<T, $Res> {
  factory $GenericAPIResponseDataCopyWith(GenericAPIResponseData<T> value,
          $Res Function(GenericAPIResponseData<T>) _then) =
      _$GenericAPIResponseDataCopyWithImpl;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$GenericAPIResponseDataCopyWithImpl<T, $Res>
    implements $GenericAPIResponseDataCopyWith<T, $Res> {
  _$GenericAPIResponseDataCopyWithImpl(this._self, this._then);

  final GenericAPIResponseData<T> _self;
  final $Res Function(GenericAPIResponseData<T>) _then;

  /// Create a copy of GenericAPIResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(GenericAPIResponseData<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

// dart format on
