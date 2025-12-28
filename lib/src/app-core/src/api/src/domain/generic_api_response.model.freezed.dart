// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_api_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GenericAPIResponse<T, M> _$GenericAPIResponseFromJson<T,M>(
  Map<String, dynamic> json,T Function(Object?) fromJsonT,M Function(Object?) fromJsonM
) {
    return GenericAPIResponseData<T, M>.fromJson(
      json,fromJsonT,fromJsonM
    );
}

/// @nodoc
mixin _$GenericAPIResponse<T,M> {

 T get data; M get metadata;
/// Create a copy of GenericAPIResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericAPIResponseCopyWith<T, M, GenericAPIResponse<T, M>> get copyWith => _$GenericAPIResponseCopyWithImpl<T, M, GenericAPIResponse<T, M>>(this as GenericAPIResponse<T, M>, _$identity);

  /// Serializes this GenericAPIResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT,Object? Function(M) toJsonM);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericAPIResponse<T, M>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GenericAPIResponse<$T, $M>(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GenericAPIResponseCopyWith<T,M,$Res>  {
  factory $GenericAPIResponseCopyWith(GenericAPIResponse<T, M> value, $Res Function(GenericAPIResponse<T, M>) _then) = _$GenericAPIResponseCopyWithImpl;
@useResult
$Res call({
 T data, M metadata
});




}
/// @nodoc
class _$GenericAPIResponseCopyWithImpl<T,M,$Res>
    implements $GenericAPIResponseCopyWith<T, M, $Res> {
  _$GenericAPIResponseCopyWithImpl(this._self, this._then);

  final GenericAPIResponse<T, M> _self;
  final $Res Function(GenericAPIResponse<T, M>) _then;

/// Create a copy of GenericAPIResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as M,
  ));
}

}


/// Adds pattern-matching-related methods to [GenericAPIResponse].
extension GenericAPIResponsePatterns<T,M> on GenericAPIResponse<T, M> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GenericAPIResponseData<T, M> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenericAPIResponseData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GenericAPIResponseData<T, M> value)  $default,){
final _that = this;
switch (_that) {
case GenericAPIResponseData():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GenericAPIResponseData<T, M> value)?  $default,){
final _that = this;
switch (_that) {
case GenericAPIResponseData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  M metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenericAPIResponseData() when $default != null:
return $default(_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  M metadata)  $default,) {final _that = this;
switch (_that) {
case GenericAPIResponseData():
return $default(_that.data,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  M metadata)?  $default,) {final _that = this;
switch (_that) {
case GenericAPIResponseData() when $default != null:
return $default(_that.data,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class GenericAPIResponseData<T,M> implements GenericAPIResponse<T, M> {
  const GenericAPIResponseData(this.data, this.metadata);
  factory GenericAPIResponseData.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT,M Function(Object?) fromJsonM) => _$GenericAPIResponseDataFromJson(json,fromJsonT,fromJsonM);

@override final  T data;
@override final  M metadata;

/// Create a copy of GenericAPIResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericAPIResponseDataCopyWith<T, M, GenericAPIResponseData<T, M>> get copyWith => _$GenericAPIResponseDataCopyWithImpl<T, M, GenericAPIResponseData<T, M>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT,Object? Function(M) toJsonM) {
  return _$GenericAPIResponseDataToJson<T, M>(this, toJsonT,toJsonM);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericAPIResponseData<T, M>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GenericAPIResponse<$T, $M>(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GenericAPIResponseDataCopyWith<T,M,$Res> implements $GenericAPIResponseCopyWith<T, M, $Res> {
  factory $GenericAPIResponseDataCopyWith(GenericAPIResponseData<T, M> value, $Res Function(GenericAPIResponseData<T, M>) _then) = _$GenericAPIResponseDataCopyWithImpl;
@override @useResult
$Res call({
 T data, M metadata
});




}
/// @nodoc
class _$GenericAPIResponseDataCopyWithImpl<T,M,$Res>
    implements $GenericAPIResponseDataCopyWith<T, M, $Res> {
  _$GenericAPIResponseDataCopyWithImpl(this._self, this._then);

  final GenericAPIResponseData<T, M> _self;
  final $Res Function(GenericAPIResponseData<T, M>) _then;

/// Create a copy of GenericAPIResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(GenericAPIResponseData<T, M>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as M,
  ));
}


}

// dart format on
