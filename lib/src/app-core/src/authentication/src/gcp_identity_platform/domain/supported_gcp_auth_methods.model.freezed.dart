// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_gcp_auth_methods.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OIDCProvider implements DiagnosticableTreeMixin {

 String get id; String get name; String get type; Map<String, String> get parameters;
/// Create a copy of OIDCProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OIDCProviderCopyWith<OIDCProvider> get copyWith => _$OIDCProviderCopyWithImpl<OIDCProvider>(this as OIDCProvider, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OIDCProvider'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parameters', parameters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OIDCProvider&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(parameters));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OIDCProvider(id: $id, name: $name, type: $type, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $OIDCProviderCopyWith<$Res>  {
  factory $OIDCProviderCopyWith(OIDCProvider value, $Res Function(OIDCProvider) _then) = _$OIDCProviderCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, Map<String, String> parameters
});




}
/// @nodoc
class _$OIDCProviderCopyWithImpl<$Res>
    implements $OIDCProviderCopyWith<$Res> {
  _$OIDCProviderCopyWithImpl(this._self, this._then);

  final OIDCProvider _self;
  final $Res Function(OIDCProvider) _then;

/// Create a copy of OIDCProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? parameters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [OIDCProvider].
extension OIDCProviderPatterns on OIDCProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OIDCProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OIDCProvider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OIDCProvider value)  $default,){
final _that = this;
switch (_that) {
case _OIDCProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OIDCProvider value)?  $default,){
final _that = this;
switch (_that) {
case _OIDCProvider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  Map<String, String> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OIDCProvider() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  Map<String, String> parameters)  $default,) {final _that = this;
switch (_that) {
case _OIDCProvider():
return $default(_that.id,_that.name,_that.type,_that.parameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  Map<String, String> parameters)?  $default,) {final _that = this;
switch (_that) {
case _OIDCProvider() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _OIDCProvider with DiagnosticableTreeMixin implements OIDCProvider {
  const _OIDCProvider({required this.id, required this.name, required this.type, required final  Map<String, String> parameters}): _parameters = parameters;
  factory _OIDCProvider.fromJson(Map<String, dynamic> json) => _$OIDCProviderFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
 final  Map<String, String> _parameters;
@override Map<String, String> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of OIDCProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OIDCProviderCopyWith<_OIDCProvider> get copyWith => __$OIDCProviderCopyWithImpl<_OIDCProvider>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OIDCProvider'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('parameters', parameters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OIDCProvider&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(_parameters));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OIDCProvider(id: $id, name: $name, type: $type, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$OIDCProviderCopyWith<$Res> implements $OIDCProviderCopyWith<$Res> {
  factory _$OIDCProviderCopyWith(_OIDCProvider value, $Res Function(_OIDCProvider) _then) = __$OIDCProviderCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, Map<String, String> parameters
});




}
/// @nodoc
class __$OIDCProviderCopyWithImpl<$Res>
    implements _$OIDCProviderCopyWith<$Res> {
  __$OIDCProviderCopyWithImpl(this._self, this._then);

  final _OIDCProvider _self;
  final $Res Function(_OIDCProvider) _then;

/// Create a copy of OIDCProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? parameters = null,}) {
  return _then(_OIDCProvider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$SupportedGCPAuthMethods implements DiagnosticableTreeMixin {

 bool get emailPasswordEnabled; List<OIDCProvider> get oidcProviders; String get tenantId;
/// Create a copy of SupportedGCPAuthMethods
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportedGCPAuthMethodsCopyWith<SupportedGCPAuthMethods> get copyWith => _$SupportedGCPAuthMethodsCopyWithImpl<SupportedGCPAuthMethods>(this as SupportedGCPAuthMethods, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupportedGCPAuthMethods'))
    ..add(DiagnosticsProperty('emailPasswordEnabled', emailPasswordEnabled))..add(DiagnosticsProperty('oidcProviders', oidcProviders))..add(DiagnosticsProperty('tenantId', tenantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportedGCPAuthMethods&&(identical(other.emailPasswordEnabled, emailPasswordEnabled) || other.emailPasswordEnabled == emailPasswordEnabled)&&const DeepCollectionEquality().equals(other.oidcProviders, oidcProviders)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailPasswordEnabled,const DeepCollectionEquality().hash(oidcProviders),tenantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupportedGCPAuthMethods(emailPasswordEnabled: $emailPasswordEnabled, oidcProviders: $oidcProviders, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $SupportedGCPAuthMethodsCopyWith<$Res>  {
  factory $SupportedGCPAuthMethodsCopyWith(SupportedGCPAuthMethods value, $Res Function(SupportedGCPAuthMethods) _then) = _$SupportedGCPAuthMethodsCopyWithImpl;
@useResult
$Res call({
 bool emailPasswordEnabled, List<OIDCProvider> oidcProviders, String tenantId
});




}
/// @nodoc
class _$SupportedGCPAuthMethodsCopyWithImpl<$Res>
    implements $SupportedGCPAuthMethodsCopyWith<$Res> {
  _$SupportedGCPAuthMethodsCopyWithImpl(this._self, this._then);

  final SupportedGCPAuthMethods _self;
  final $Res Function(SupportedGCPAuthMethods) _then;

/// Create a copy of SupportedGCPAuthMethods
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailPasswordEnabled = null,Object? oidcProviders = null,Object? tenantId = null,}) {
  return _then(_self.copyWith(
emailPasswordEnabled: null == emailPasswordEnabled ? _self.emailPasswordEnabled : emailPasswordEnabled // ignore: cast_nullable_to_non_nullable
as bool,oidcProviders: null == oidcProviders ? _self.oidcProviders : oidcProviders // ignore: cast_nullable_to_non_nullable
as List<OIDCProvider>,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportedGCPAuthMethods].
extension SupportedGCPAuthMethodsPatterns on SupportedGCPAuthMethods {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportedGCPAuthMethods value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportedGCPAuthMethods value)  $default,){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportedGCPAuthMethods value)?  $default,){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool emailPasswordEnabled,  List<OIDCProvider> oidcProviders,  String tenantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods() when $default != null:
return $default(_that.emailPasswordEnabled,_that.oidcProviders,_that.tenantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool emailPasswordEnabled,  List<OIDCProvider> oidcProviders,  String tenantId)  $default,) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods():
return $default(_that.emailPasswordEnabled,_that.oidcProviders,_that.tenantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool emailPasswordEnabled,  List<OIDCProvider> oidcProviders,  String tenantId)?  $default,) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethods() when $default != null:
return $default(_that.emailPasswordEnabled,_that.oidcProviders,_that.tenantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _SupportedGCPAuthMethods with DiagnosticableTreeMixin implements SupportedGCPAuthMethods {
  const _SupportedGCPAuthMethods({required this.emailPasswordEnabled, required final  List<OIDCProvider> oidcProviders, required this.tenantId}): _oidcProviders = oidcProviders;
  factory _SupportedGCPAuthMethods.fromJson(Map<String, dynamic> json) => _$SupportedGCPAuthMethodsFromJson(json);

@override final  bool emailPasswordEnabled;
 final  List<OIDCProvider> _oidcProviders;
@override List<OIDCProvider> get oidcProviders {
  if (_oidcProviders is EqualUnmodifiableListView) return _oidcProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_oidcProviders);
}

@override final  String tenantId;

/// Create a copy of SupportedGCPAuthMethods
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportedGCPAuthMethodsCopyWith<_SupportedGCPAuthMethods> get copyWith => __$SupportedGCPAuthMethodsCopyWithImpl<_SupportedGCPAuthMethods>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupportedGCPAuthMethods'))
    ..add(DiagnosticsProperty('emailPasswordEnabled', emailPasswordEnabled))..add(DiagnosticsProperty('oidcProviders', oidcProviders))..add(DiagnosticsProperty('tenantId', tenantId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportedGCPAuthMethods&&(identical(other.emailPasswordEnabled, emailPasswordEnabled) || other.emailPasswordEnabled == emailPasswordEnabled)&&const DeepCollectionEquality().equals(other._oidcProviders, _oidcProviders)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailPasswordEnabled,const DeepCollectionEquality().hash(_oidcProviders),tenantId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupportedGCPAuthMethods(emailPasswordEnabled: $emailPasswordEnabled, oidcProviders: $oidcProviders, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$SupportedGCPAuthMethodsCopyWith<$Res> implements $SupportedGCPAuthMethodsCopyWith<$Res> {
  factory _$SupportedGCPAuthMethodsCopyWith(_SupportedGCPAuthMethods value, $Res Function(_SupportedGCPAuthMethods) _then) = __$SupportedGCPAuthMethodsCopyWithImpl;
@override @useResult
$Res call({
 bool emailPasswordEnabled, List<OIDCProvider> oidcProviders, String tenantId
});




}
/// @nodoc
class __$SupportedGCPAuthMethodsCopyWithImpl<$Res>
    implements _$SupportedGCPAuthMethodsCopyWith<$Res> {
  __$SupportedGCPAuthMethodsCopyWithImpl(this._self, this._then);

  final _SupportedGCPAuthMethods _self;
  final $Res Function(_SupportedGCPAuthMethods) _then;

/// Create a copy of SupportedGCPAuthMethods
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailPasswordEnabled = null,Object? oidcProviders = null,Object? tenantId = null,}) {
  return _then(_SupportedGCPAuthMethods(
emailPasswordEnabled: null == emailPasswordEnabled ? _self.emailPasswordEnabled : emailPasswordEnabled // ignore: cast_nullable_to_non_nullable
as bool,oidcProviders: null == oidcProviders ? _self._oidcProviders : oidcProviders // ignore: cast_nullable_to_non_nullable
as List<OIDCProvider>,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
