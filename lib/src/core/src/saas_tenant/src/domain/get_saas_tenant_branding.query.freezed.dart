// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_saas_tenant_branding.query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetSaasTenantBrandingQuery implements DiagnosticableTreeMixin {

 String get saasTenantDomain;
/// Create a copy of GetSaasTenantBrandingQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSaasTenantBrandingQueryCopyWith<GetSaasTenantBrandingQuery> get copyWith => _$GetSaasTenantBrandingQueryCopyWithImpl<GetSaasTenantBrandingQuery>(this as GetSaasTenantBrandingQuery, _$identity);

  /// Serializes this GetSaasTenantBrandingQuery to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetSaasTenantBrandingQuery'))
    ..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSaasTenantBrandingQuery&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantDomain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetSaasTenantBrandingQuery(saasTenantDomain: $saasTenantDomain)';
}


}

/// @nodoc
abstract mixin class $GetSaasTenantBrandingQueryCopyWith<$Res>  {
  factory $GetSaasTenantBrandingQueryCopyWith(GetSaasTenantBrandingQuery value, $Res Function(GetSaasTenantBrandingQuery) _then) = _$GetSaasTenantBrandingQueryCopyWithImpl;
@useResult
$Res call({
 String saasTenantDomain
});




}
/// @nodoc
class _$GetSaasTenantBrandingQueryCopyWithImpl<$Res>
    implements $GetSaasTenantBrandingQueryCopyWith<$Res> {
  _$GetSaasTenantBrandingQueryCopyWithImpl(this._self, this._then);

  final GetSaasTenantBrandingQuery _self;
  final $Res Function(GetSaasTenantBrandingQuery) _then;

/// Create a copy of GetSaasTenantBrandingQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? saasTenantDomain = null,}) {
  return _then(_self.copyWith(
saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSaasTenantBrandingQuery].
extension GetSaasTenantBrandingQueryPatterns on GetSaasTenantBrandingQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSaasTenantBrandingQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSaasTenantBrandingQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSaasTenantBrandingQuery value)  $default,){
final _that = this;
switch (_that) {
case _GetSaasTenantBrandingQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSaasTenantBrandingQuery value)?  $default,){
final _that = this;
switch (_that) {
case _GetSaasTenantBrandingQuery() when $default != null:
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
case _GetSaasTenantBrandingQuery() when $default != null:
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
case _GetSaasTenantBrandingQuery():
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
case _GetSaasTenantBrandingQuery() when $default != null:
return $default(_that.saasTenantDomain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetSaasTenantBrandingQuery with DiagnosticableTreeMixin implements GetSaasTenantBrandingQuery {
  const _GetSaasTenantBrandingQuery({required this.saasTenantDomain});
  factory _GetSaasTenantBrandingQuery.fromJson(Map<String, dynamic> json) => _$GetSaasTenantBrandingQueryFromJson(json);

@override final  String saasTenantDomain;

/// Create a copy of GetSaasTenantBrandingQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSaasTenantBrandingQueryCopyWith<_GetSaasTenantBrandingQuery> get copyWith => __$GetSaasTenantBrandingQueryCopyWithImpl<_GetSaasTenantBrandingQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSaasTenantBrandingQueryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetSaasTenantBrandingQuery'))
    ..add(DiagnosticsProperty('saasTenantDomain', saasTenantDomain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSaasTenantBrandingQuery&&(identical(other.saasTenantDomain, saasTenantDomain) || other.saasTenantDomain == saasTenantDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,saasTenantDomain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetSaasTenantBrandingQuery(saasTenantDomain: $saasTenantDomain)';
}


}

/// @nodoc
abstract mixin class _$GetSaasTenantBrandingQueryCopyWith<$Res> implements $GetSaasTenantBrandingQueryCopyWith<$Res> {
  factory _$GetSaasTenantBrandingQueryCopyWith(_GetSaasTenantBrandingQuery value, $Res Function(_GetSaasTenantBrandingQuery) _then) = __$GetSaasTenantBrandingQueryCopyWithImpl;
@override @useResult
$Res call({
 String saasTenantDomain
});




}
/// @nodoc
class __$GetSaasTenantBrandingQueryCopyWithImpl<$Res>
    implements _$GetSaasTenantBrandingQueryCopyWith<$Res> {
  __$GetSaasTenantBrandingQueryCopyWithImpl(this._self, this._then);

  final _GetSaasTenantBrandingQuery _self;
  final $Res Function(_GetSaasTenantBrandingQuery) _then;

/// Create a copy of GetSaasTenantBrandingQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? saasTenantDomain = null,}) {
  return _then(_GetSaasTenantBrandingQuery(
saasTenantDomain: null == saasTenantDomain ? _self.saasTenantDomain : saasTenantDomain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
