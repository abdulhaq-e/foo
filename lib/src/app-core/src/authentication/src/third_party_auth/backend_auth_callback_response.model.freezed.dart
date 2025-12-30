// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend_auth_callback_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackendAuthCallbackResponse implements DiagnosticableTreeMixin {

 String get saasTenantEntityId;
/// Create a copy of BackendAuthCallbackResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackendAuthCallbackResponseCopyWith<BackendAuthCallbackResponse> get copyWith => _$BackendAuthCallbackResponseCopyWithImpl<BackendAuthCallbackResponse>(this as BackendAuthCallbackResponse, _$identity);

  /// Serializes this BackendAuthCallbackResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BackendAuthCallbackResponse'))
    ..add(DiagnosticsProperty('saasTenantEntityId', saasTenantEntityId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackendAuthCallbackResponse&&(identical(other.saasTenantEntityId, saasTenantEntityId) || other.saasTenantEntityId == saasTenantEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantEntityId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BackendAuthCallbackResponse(saasTenantEntityId: $saasTenantEntityId)';
}


}

/// @nodoc
abstract mixin class $BackendAuthCallbackResponseCopyWith<$Res>  {
  factory $BackendAuthCallbackResponseCopyWith(BackendAuthCallbackResponse value, $Res Function(BackendAuthCallbackResponse) _then) = _$BackendAuthCallbackResponseCopyWithImpl;
@useResult
$Res call({
 String saasTenantEntityId
});




}
/// @nodoc
class _$BackendAuthCallbackResponseCopyWithImpl<$Res>
    implements $BackendAuthCallbackResponseCopyWith<$Res> {
  _$BackendAuthCallbackResponseCopyWithImpl(this._self, this._then);

  final BackendAuthCallbackResponse _self;
  final $Res Function(BackendAuthCallbackResponse) _then;

/// Create a copy of BackendAuthCallbackResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? saasTenantEntityId = null,}) {
  return _then(_self.copyWith(
saasTenantEntityId: null == saasTenantEntityId ? _self.saasTenantEntityId : saasTenantEntityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BackendAuthCallbackResponse].
extension BackendAuthCallbackResponsePatterns on BackendAuthCallbackResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackendAuthCallbackResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackendAuthCallbackResponse value)  $default,){
final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackendAuthCallbackResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String saasTenantEntityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse() when $default != null:
return $default(_that.saasTenantEntityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String saasTenantEntityId)  $default,) {final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse():
return $default(_that.saasTenantEntityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String saasTenantEntityId)?  $default,) {final _that = this;
switch (_that) {
case _BackendAuthCallbackResponse() when $default != null:
return $default(_that.saasTenantEntityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackendAuthCallbackResponse with DiagnosticableTreeMixin implements BackendAuthCallbackResponse {
  const _BackendAuthCallbackResponse({required this.saasTenantEntityId});
  factory _BackendAuthCallbackResponse.fromJson(Map<String, dynamic> json) => _$BackendAuthCallbackResponseFromJson(json);

@override final  String saasTenantEntityId;

/// Create a copy of BackendAuthCallbackResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackendAuthCallbackResponseCopyWith<_BackendAuthCallbackResponse> get copyWith => __$BackendAuthCallbackResponseCopyWithImpl<_BackendAuthCallbackResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackendAuthCallbackResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BackendAuthCallbackResponse'))
    ..add(DiagnosticsProperty('saasTenantEntityId', saasTenantEntityId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackendAuthCallbackResponse&&(identical(other.saasTenantEntityId, saasTenantEntityId) || other.saasTenantEntityId == saasTenantEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantEntityId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BackendAuthCallbackResponse(saasTenantEntityId: $saasTenantEntityId)';
}


}

/// @nodoc
abstract mixin class _$BackendAuthCallbackResponseCopyWith<$Res> implements $BackendAuthCallbackResponseCopyWith<$Res> {
  factory _$BackendAuthCallbackResponseCopyWith(_BackendAuthCallbackResponse value, $Res Function(_BackendAuthCallbackResponse) _then) = __$BackendAuthCallbackResponseCopyWithImpl;
@override @useResult
$Res call({
 String saasTenantEntityId
});




}
/// @nodoc
class __$BackendAuthCallbackResponseCopyWithImpl<$Res>
    implements _$BackendAuthCallbackResponseCopyWith<$Res> {
  __$BackendAuthCallbackResponseCopyWithImpl(this._self, this._then);

  final _BackendAuthCallbackResponse _self;
  final $Res Function(_BackendAuthCallbackResponse) _then;

/// Create a copy of BackendAuthCallbackResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? saasTenantEntityId = null,}) {
  return _then(_BackendAuthCallbackResponse(
saasTenantEntityId: null == saasTenantEntityId ? _self.saasTenantEntityId : saasTenantEntityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
