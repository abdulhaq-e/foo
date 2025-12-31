// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend_auth_callback.command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackendAuthCallbackCommand implements DiagnosticableTreeMixin {

 String get token; String get authProvider; String get saasTenantDomain;@JsonKey(includeToJson: false) String get clientType;
/// Create a copy of BackendAuthCallbackCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackendAuthCallbackCommandCopyWith<BackendAuthCallbackCommand> get copyWith => _$BackendAuthCallbackCommandCopyWithImpl<BackendAuthCallbackCommand>(this as BackendAuthCallbackCommand, _$identity);

  /// Serializes this BackendAuthCallbackCommand to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BackendAuthCallbackCommand'))
    ..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('authProvider', authProvider))..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain))..add(DiagnosticsProperty('clientType', clientType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackendAuthCallbackCommand&&(identical(other.token, token) || other.token == token)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain)&&(identical(other.clientType, clientType) || other.clientType == clientType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,authProvider,saasTenantDomain,clientType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BackendAuthCallbackCommand(token: $token, authProvider: $authProvider, saasTenantDomain: $saasTenantDomain, clientType: $clientType)';
}


}

/// @nodoc
abstract mixin class $BackendAuthCallbackCommandCopyWith<$Res>  {
  factory $BackendAuthCallbackCommandCopyWith(BackendAuthCallbackCommand value, $Res Function(BackendAuthCallbackCommand) _then) = _$BackendAuthCallbackCommandCopyWithImpl;
@useResult
$Res call({
 String token, String authProvider, String saasTenantDomain,@JsonKey(includeToJson: false) String clientType
});




}
/// @nodoc
class _$BackendAuthCallbackCommandCopyWithImpl<$Res>
    implements $BackendAuthCallbackCommandCopyWith<$Res> {
  _$BackendAuthCallbackCommandCopyWithImpl(this._self, this._then);

  final BackendAuthCallbackCommand _self;
  final $Res Function(BackendAuthCallbackCommand) _then;

/// Create a copy of BackendAuthCallbackCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? authProvider = null,Object? saasTenantDomain = null,Object? clientType = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String,saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,clientType: null == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BackendAuthCallbackCommand].
extension BackendAuthCallbackCommandPatterns on BackendAuthCallbackCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackendAuthCallbackCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackendAuthCallbackCommand value)  $default,){
final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackendAuthCallbackCommand value)?  $default,){
final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String authProvider,  String saasTenantDomain, @JsonKey(includeToJson: false)  String clientType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand() when $default != null:
return $default(_that.token,_that.authProvider,_that.saasTenantDomain,_that.clientType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String authProvider,  String saasTenantDomain, @JsonKey(includeToJson: false)  String clientType)  $default,) {final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand():
return $default(_that.token,_that.authProvider,_that.saasTenantDomain,_that.clientType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String authProvider,  String saasTenantDomain, @JsonKey(includeToJson: false)  String clientType)?  $default,) {final _that = this;
switch (_that) {
case _BackendAuthCallbackCommand() when $default != null:
return $default(_that.token,_that.authProvider,_that.saasTenantDomain,_that.clientType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _BackendAuthCallbackCommand with DiagnosticableTreeMixin implements BackendAuthCallbackCommand {
  const _BackendAuthCallbackCommand({required this.token, required this.authProvider, required this.saasTenantDomain, @JsonKey(includeToJson: false) required this.clientType});
  

@override final  String token;
@override final  String authProvider;
@override final  String saasTenantDomain;
@override@JsonKey(includeToJson: false) final  String clientType;

/// Create a copy of BackendAuthCallbackCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackendAuthCallbackCommandCopyWith<_BackendAuthCallbackCommand> get copyWith => __$BackendAuthCallbackCommandCopyWithImpl<_BackendAuthCallbackCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackendAuthCallbackCommandToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BackendAuthCallbackCommand'))
    ..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('authProvider', authProvider))..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain))..add(DiagnosticsProperty('clientType', clientType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackendAuthCallbackCommand&&(identical(other.token, token) || other.token == token)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain)&&(identical(other.clientType, clientType) || other.clientType == clientType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,authProvider,saasTenantDomain,clientType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BackendAuthCallbackCommand(token: $token, authProvider: $authProvider, saasTenantDomain: $saasTenantDomain, clientType: $clientType)';
}


}

/// @nodoc
abstract mixin class _$BackendAuthCallbackCommandCopyWith<$Res> implements $BackendAuthCallbackCommandCopyWith<$Res> {
  factory _$BackendAuthCallbackCommandCopyWith(_BackendAuthCallbackCommand value, $Res Function(_BackendAuthCallbackCommand) _then) = __$BackendAuthCallbackCommandCopyWithImpl;
@override @useResult
$Res call({
 String token, String authProvider, String saasTenantDomain,@JsonKey(includeToJson: false) String clientType
});




}
/// @nodoc
class __$BackendAuthCallbackCommandCopyWithImpl<$Res>
    implements _$BackendAuthCallbackCommandCopyWith<$Res> {
  __$BackendAuthCallbackCommandCopyWithImpl(this._self, this._then);

  final _BackendAuthCallbackCommand _self;
  final $Res Function(_BackendAuthCallbackCommand) _then;

/// Create a copy of BackendAuthCallbackCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? authProvider = null,Object? saasTenantDomain = null,Object? clientType = null,}) {
  return _then(_BackendAuthCallbackCommand(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String,saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,clientType: null == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
