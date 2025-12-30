// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saas_tenant_auth_platform.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaasTenantAuthPlatform implements DiagnosticableTreeMixin {

 Map<String, Object?> get config; String get platformName;
/// Create a copy of SaasTenantAuthPlatform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaasTenantAuthPlatformCopyWith<SaasTenantAuthPlatform> get copyWith => _$SaasTenantAuthPlatformCopyWithImpl<SaasTenantAuthPlatform>(this as SaasTenantAuthPlatform, _$identity);

  /// Serializes this SaasTenantAuthPlatform to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantAuthPlatform'))
    ..add(DiagnosticsProperty('config', config))..add(DiagnosticsProperty('platformName', platformName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaasTenantAuthPlatform&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.platformName, platformName) || other.platformName == platformName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(config),platformName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantAuthPlatform(config: $config, platformName: $platformName)';
}


}

/// @nodoc
abstract mixin class $SaasTenantAuthPlatformCopyWith<$Res>  {
  factory $SaasTenantAuthPlatformCopyWith(SaasTenantAuthPlatform value, $Res Function(SaasTenantAuthPlatform) _then) = _$SaasTenantAuthPlatformCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> config, String platformName
});




}
/// @nodoc
class _$SaasTenantAuthPlatformCopyWithImpl<$Res>
    implements $SaasTenantAuthPlatformCopyWith<$Res> {
  _$SaasTenantAuthPlatformCopyWithImpl(this._self, this._then);

  final SaasTenantAuthPlatform _self;
  final $Res Function(SaasTenantAuthPlatform) _then;

/// Create a copy of SaasTenantAuthPlatform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = null,Object? platformName = null,}) {
  return _then(_self.copyWith(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,platformName: null == platformName ? _self.platformName : platformName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaasTenantAuthPlatform].
extension SaasTenantAuthPlatformPatterns on SaasTenantAuthPlatform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaasTenantAuthPlatform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaasTenantAuthPlatform value)  $default,){
final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaasTenantAuthPlatform value)?  $default,){
final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Object?> config,  String platformName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform() when $default != null:
return $default(_that.config,_that.platformName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Object?> config,  String platformName)  $default,) {final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform():
return $default(_that.config,_that.platformName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Object?> config,  String platformName)?  $default,) {final _that = this;
switch (_that) {
case _SaasTenantAuthPlatform() when $default != null:
return $default(_that.config,_that.platformName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaasTenantAuthPlatform with DiagnosticableTreeMixin implements SaasTenantAuthPlatform {
  const _SaasTenantAuthPlatform({required final  Map<String, Object?> config, required this.platformName}): _config = config;
  factory _SaasTenantAuthPlatform.fromJson(Map<String, dynamic> json) => _$SaasTenantAuthPlatformFromJson(json);

 final  Map<String, Object?> _config;
@override Map<String, Object?> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  String platformName;

/// Create a copy of SaasTenantAuthPlatform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaasTenantAuthPlatformCopyWith<_SaasTenantAuthPlatform> get copyWith => __$SaasTenantAuthPlatformCopyWithImpl<_SaasTenantAuthPlatform>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaasTenantAuthPlatformToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantAuthPlatform'))
    ..add(DiagnosticsProperty('config', config))..add(DiagnosticsProperty('platformName', platformName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaasTenantAuthPlatform&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.platformName, platformName) || other.platformName == platformName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_config),platformName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantAuthPlatform(config: $config, platformName: $platformName)';
}


}

/// @nodoc
abstract mixin class _$SaasTenantAuthPlatformCopyWith<$Res> implements $SaasTenantAuthPlatformCopyWith<$Res> {
  factory _$SaasTenantAuthPlatformCopyWith(_SaasTenantAuthPlatform value, $Res Function(_SaasTenantAuthPlatform) _then) = __$SaasTenantAuthPlatformCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Object?> config, String platformName
});




}
/// @nodoc
class __$SaasTenantAuthPlatformCopyWithImpl<$Res>
    implements _$SaasTenantAuthPlatformCopyWith<$Res> {
  __$SaasTenantAuthPlatformCopyWithImpl(this._self, this._then);

  final _SaasTenantAuthPlatform _self;
  final $Res Function(_SaasTenantAuthPlatform) _then;

/// Create a copy of SaasTenantAuthPlatform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = null,Object? platformName = null,}) {
  return _then(_SaasTenantAuthPlatform(
config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,platformName: null == platformName ? _self.platformName : platformName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
