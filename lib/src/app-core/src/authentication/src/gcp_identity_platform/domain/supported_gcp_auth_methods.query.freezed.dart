// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_gcp_auth_methods.query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportedGCPAuthMethodsQuery implements DiagnosticableTreeMixin {

 String get saasTenantDomain;
/// Create a copy of SupportedGCPAuthMethodsQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportedGCPAuthMethodsQueryCopyWith<SupportedGCPAuthMethodsQuery> get copyWith => _$SupportedGCPAuthMethodsQueryCopyWithImpl<SupportedGCPAuthMethodsQuery>(this as SupportedGCPAuthMethodsQuery, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupportedGCPAuthMethodsQuery'))
    ..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportedGCPAuthMethodsQuery&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantDomain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupportedGCPAuthMethodsQuery(saasTenantDomain: $saasTenantDomain)';
}


}

/// @nodoc
abstract mixin class $SupportedGCPAuthMethodsQueryCopyWith<$Res>  {
  factory $SupportedGCPAuthMethodsQueryCopyWith(SupportedGCPAuthMethodsQuery value, $Res Function(SupportedGCPAuthMethodsQuery) _then) = _$SupportedGCPAuthMethodsQueryCopyWithImpl;
@useResult
$Res call({
 String saasTenantDomain
});




}
/// @nodoc
class _$SupportedGCPAuthMethodsQueryCopyWithImpl<$Res>
    implements $SupportedGCPAuthMethodsQueryCopyWith<$Res> {
  _$SupportedGCPAuthMethodsQueryCopyWithImpl(this._self, this._then);

  final SupportedGCPAuthMethodsQuery _self;
  final $Res Function(SupportedGCPAuthMethodsQuery) _then;

/// Create a copy of SupportedGCPAuthMethodsQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? saasTenantDomain = null,}) {
  return _then(_self.copyWith(
saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportedGCPAuthMethodsQuery].
extension SupportedGCPAuthMethodsQueryPatterns on SupportedGCPAuthMethodsQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportedGCPAuthMethodsQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportedGCPAuthMethodsQuery value)  $default,){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportedGCPAuthMethodsQuery value)?  $default,){
final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String saasTenantDomain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery() when $default != null:
return $default(_that.saasTenantDomain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String saasTenantDomain)  $default,) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery():
return $default(_that.saasTenantDomain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String saasTenantDomain)?  $default,) {final _that = this;
switch (_that) {
case _SupportedGCPAuthMethodsQuery() when $default != null:
return $default(_that.saasTenantDomain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _SupportedGCPAuthMethodsQuery with DiagnosticableTreeMixin implements SupportedGCPAuthMethodsQuery {
  const _SupportedGCPAuthMethodsQuery({required this.saasTenantDomain});
  factory _SupportedGCPAuthMethodsQuery.fromJson(Map<String, dynamic> json) => _$SupportedGCPAuthMethodsQueryFromJson(json);

@override final  String saasTenantDomain;

/// Create a copy of SupportedGCPAuthMethodsQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportedGCPAuthMethodsQueryCopyWith<_SupportedGCPAuthMethodsQuery> get copyWith => __$SupportedGCPAuthMethodsQueryCopyWithImpl<_SupportedGCPAuthMethodsQuery>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SupportedGCPAuthMethodsQuery'))
    ..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportedGCPAuthMethodsQuery&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantDomain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SupportedGCPAuthMethodsQuery(saasTenantDomain: $saasTenantDomain)';
}


}

/// @nodoc
abstract mixin class _$SupportedGCPAuthMethodsQueryCopyWith<$Res> implements $SupportedGCPAuthMethodsQueryCopyWith<$Res> {
  factory _$SupportedGCPAuthMethodsQueryCopyWith(_SupportedGCPAuthMethodsQuery value, $Res Function(_SupportedGCPAuthMethodsQuery) _then) = __$SupportedGCPAuthMethodsQueryCopyWithImpl;
@override @useResult
$Res call({
 String saasTenantDomain
});




}
/// @nodoc
class __$SupportedGCPAuthMethodsQueryCopyWithImpl<$Res>
    implements _$SupportedGCPAuthMethodsQueryCopyWith<$Res> {
  __$SupportedGCPAuthMethodsQueryCopyWithImpl(this._self, this._then);

  final _SupportedGCPAuthMethodsQuery _self;
  final $Res Function(_SupportedGCPAuthMethodsQuery) _then;

/// Create a copy of SupportedGCPAuthMethodsQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? saasTenantDomain = null,}) {
  return _then(_SupportedGCPAuthMethodsQuery(
saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
