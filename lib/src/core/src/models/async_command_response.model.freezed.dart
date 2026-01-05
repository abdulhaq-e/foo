// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_command_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsyncCommandResponse {

 String get operationId;
/// Create a copy of AsyncCommandResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncCommandResponseCopyWith<AsyncCommandResponse> get copyWith => _$AsyncCommandResponseCopyWithImpl<AsyncCommandResponse>(this as AsyncCommandResponse, _$identity);

  /// Serializes this AsyncCommandResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncCommandResponse&&(identical(other.operationId, operationId) || other.operationId == operationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,operationId);

@override
String toString() {
  return 'AsyncCommandResponse(operationId: $operationId)';
}


}

/// @nodoc
abstract mixin class $AsyncCommandResponseCopyWith<$Res>  {
  factory $AsyncCommandResponseCopyWith(AsyncCommandResponse value, $Res Function(AsyncCommandResponse) _then) = _$AsyncCommandResponseCopyWithImpl;
@useResult
$Res call({
 String operationId
});




}
/// @nodoc
class _$AsyncCommandResponseCopyWithImpl<$Res>
    implements $AsyncCommandResponseCopyWith<$Res> {
  _$AsyncCommandResponseCopyWithImpl(this._self, this._then);

  final AsyncCommandResponse _self;
  final $Res Function(AsyncCommandResponse) _then;

/// Create a copy of AsyncCommandResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operationId = null,}) {
  return _then(_self.copyWith(
operationId: null == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AsyncCommandResponse].
extension AsyncCommandResponsePatterns on AsyncCommandResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsyncCommandResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsyncCommandResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsyncCommandResponse value)  $default,){
final _that = this;
switch (_that) {
case _AsyncCommandResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsyncCommandResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AsyncCommandResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String operationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsyncCommandResponse() when $default != null:
return $default(_that.operationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String operationId)  $default,) {final _that = this;
switch (_that) {
case _AsyncCommandResponse():
return $default(_that.operationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String operationId)?  $default,) {final _that = this;
switch (_that) {
case _AsyncCommandResponse() when $default != null:
return $default(_that.operationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AsyncCommandResponse implements AsyncCommandResponse {
  const _AsyncCommandResponse({required this.operationId});
  factory _AsyncCommandResponse.fromJson(Map<String, dynamic> json) => _$AsyncCommandResponseFromJson(json);

@override final  String operationId;

/// Create a copy of AsyncCommandResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsyncCommandResponseCopyWith<_AsyncCommandResponse> get copyWith => __$AsyncCommandResponseCopyWithImpl<_AsyncCommandResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsyncCommandResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsyncCommandResponse&&(identical(other.operationId, operationId) || other.operationId == operationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,operationId);

@override
String toString() {
  return 'AsyncCommandResponse(operationId: $operationId)';
}


}

/// @nodoc
abstract mixin class _$AsyncCommandResponseCopyWith<$Res> implements $AsyncCommandResponseCopyWith<$Res> {
  factory _$AsyncCommandResponseCopyWith(_AsyncCommandResponse value, $Res Function(_AsyncCommandResponse) _then) = __$AsyncCommandResponseCopyWithImpl;
@override @useResult
$Res call({
 String operationId
});




}
/// @nodoc
class __$AsyncCommandResponseCopyWithImpl<$Res>
    implements _$AsyncCommandResponseCopyWith<$Res> {
  __$AsyncCommandResponseCopyWithImpl(this._self, this._then);

  final _AsyncCommandResponse _self;
  final $Res Function(_AsyncCommandResponse) _then;

/// Create a copy of AsyncCommandResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operationId = null,}) {
  return _then(_AsyncCommandResponse(
operationId: null == operationId ? _self.operationId : operationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
