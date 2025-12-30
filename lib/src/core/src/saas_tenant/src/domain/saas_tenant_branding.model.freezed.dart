// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saas_tenant_branding.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaasTenantBrandingColors implements DiagnosticableTreeMixin {

@ColorJsonConverter() Color? get primary;
/// Create a copy of SaasTenantBrandingColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaasTenantBrandingColorsCopyWith<SaasTenantBrandingColors> get copyWith => _$SaasTenantBrandingColorsCopyWithImpl<SaasTenantBrandingColors>(this as SaasTenantBrandingColors, _$identity);

  /// Serializes this SaasTenantBrandingColors to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantBrandingColors'))
    ..add(DiagnosticsProperty('primary', primary));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaasTenantBrandingColors&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantBrandingColors(primary: $primary)';
}


}

/// @nodoc
abstract mixin class $SaasTenantBrandingColorsCopyWith<$Res>  {
  factory $SaasTenantBrandingColorsCopyWith(SaasTenantBrandingColors value, $Res Function(SaasTenantBrandingColors) _then) = _$SaasTenantBrandingColorsCopyWithImpl;
@useResult
$Res call({
@ColorJsonConverter() Color? primary
});




}
/// @nodoc
class _$SaasTenantBrandingColorsCopyWithImpl<$Res>
    implements $SaasTenantBrandingColorsCopyWith<$Res> {
  _$SaasTenantBrandingColorsCopyWithImpl(this._self, this._then);

  final SaasTenantBrandingColors _self;
  final $Res Function(SaasTenantBrandingColors) _then;

/// Create a copy of SaasTenantBrandingColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaasTenantBrandingColors].
extension SaasTenantBrandingColorsPatterns on SaasTenantBrandingColors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaasTenantBrandingColors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaasTenantBrandingColors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaasTenantBrandingColors value)  $default,){
final _that = this;
switch (_that) {
case _SaasTenantBrandingColors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaasTenantBrandingColors value)?  $default,){
final _that = this;
switch (_that) {
case _SaasTenantBrandingColors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ColorJsonConverter()  Color? primary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaasTenantBrandingColors() when $default != null:
return $default(_that.primary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ColorJsonConverter()  Color? primary)  $default,) {final _that = this;
switch (_that) {
case _SaasTenantBrandingColors():
return $default(_that.primary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ColorJsonConverter()  Color? primary)?  $default,) {final _that = this;
switch (_that) {
case _SaasTenantBrandingColors() when $default != null:
return $default(_that.primary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaasTenantBrandingColors with DiagnosticableTreeMixin implements SaasTenantBrandingColors {
  const _SaasTenantBrandingColors({@ColorJsonConverter() this.primary});
  factory _SaasTenantBrandingColors.fromJson(Map<String, dynamic> json) => _$SaasTenantBrandingColorsFromJson(json);

@override@ColorJsonConverter() final  Color? primary;

/// Create a copy of SaasTenantBrandingColors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaasTenantBrandingColorsCopyWith<_SaasTenantBrandingColors> get copyWith => __$SaasTenantBrandingColorsCopyWithImpl<_SaasTenantBrandingColors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaasTenantBrandingColorsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantBrandingColors'))
    ..add(DiagnosticsProperty('primary', primary));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaasTenantBrandingColors&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primary);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantBrandingColors(primary: $primary)';
}


}

/// @nodoc
abstract mixin class _$SaasTenantBrandingColorsCopyWith<$Res> implements $SaasTenantBrandingColorsCopyWith<$Res> {
  factory _$SaasTenantBrandingColorsCopyWith(_SaasTenantBrandingColors value, $Res Function(_SaasTenantBrandingColors) _then) = __$SaasTenantBrandingColorsCopyWithImpl;
@override @useResult
$Res call({
@ColorJsonConverter() Color? primary
});




}
/// @nodoc
class __$SaasTenantBrandingColorsCopyWithImpl<$Res>
    implements _$SaasTenantBrandingColorsCopyWith<$Res> {
  __$SaasTenantBrandingColorsCopyWithImpl(this._self, this._then);

  final _SaasTenantBrandingColors _self;
  final $Res Function(_SaasTenantBrandingColors) _then;

/// Create a copy of SaasTenantBrandingColors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,}) {
  return _then(_SaasTenantBrandingColors(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}


/// @nodoc
mixin _$SaasTenantBranding implements DiagnosticableTreeMixin {

 String get tenantName; String get description; String? get logoUrl; SaasTenantBrandingColors? get colors;
/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaasTenantBrandingCopyWith<SaasTenantBranding> get copyWith => _$SaasTenantBrandingCopyWithImpl<SaasTenantBranding>(this as SaasTenantBranding, _$identity);

  /// Serializes this SaasTenantBranding to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantBranding'))
    ..add(DiagnosticsProperty('tenantName', tenantName))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('logoUrl', logoUrl))..add(DiagnosticsProperty('colors', colors));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaasTenantBranding&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.description, description) || other.description == description)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.colors, colors) || other.colors == colors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantName,description,logoUrl,colors);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantBranding(tenantName: $tenantName, description: $description, logoUrl: $logoUrl, colors: $colors)';
}


}

/// @nodoc
abstract mixin class $SaasTenantBrandingCopyWith<$Res>  {
  factory $SaasTenantBrandingCopyWith(SaasTenantBranding value, $Res Function(SaasTenantBranding) _then) = _$SaasTenantBrandingCopyWithImpl;
@useResult
$Res call({
 String tenantName, String description, String? logoUrl, SaasTenantBrandingColors? colors
});


$SaasTenantBrandingColorsCopyWith<$Res>? get colors;

}
/// @nodoc
class _$SaasTenantBrandingCopyWithImpl<$Res>
    implements $SaasTenantBrandingCopyWith<$Res> {
  _$SaasTenantBrandingCopyWithImpl(this._self, this._then);

  final SaasTenantBranding _self;
  final $Res Function(SaasTenantBranding) _then;

/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantName = null,Object? description = null,Object? logoUrl = freezed,Object? colors = freezed,}) {
  return _then(_self.copyWith(
tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,colors: freezed == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as SaasTenantBrandingColors?,
  ));
}
/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaasTenantBrandingColorsCopyWith<$Res>? get colors {
    if (_self.colors == null) {
    return null;
  }

  return $SaasTenantBrandingColorsCopyWith<$Res>(_self.colors!, (value) {
    return _then(_self.copyWith(colors: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaasTenantBranding].
extension SaasTenantBrandingPatterns on SaasTenantBranding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaasTenantBranding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaasTenantBranding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaasTenantBranding value)  $default,){
final _that = this;
switch (_that) {
case _SaasTenantBranding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaasTenantBranding value)?  $default,){
final _that = this;
switch (_that) {
case _SaasTenantBranding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantName,  String description,  String? logoUrl,  SaasTenantBrandingColors? colors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaasTenantBranding() when $default != null:
return $default(_that.tenantName,_that.description,_that.logoUrl,_that.colors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantName,  String description,  String? logoUrl,  SaasTenantBrandingColors? colors)  $default,) {final _that = this;
switch (_that) {
case _SaasTenantBranding():
return $default(_that.tenantName,_that.description,_that.logoUrl,_that.colors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantName,  String description,  String? logoUrl,  SaasTenantBrandingColors? colors)?  $default,) {final _that = this;
switch (_that) {
case _SaasTenantBranding() when $default != null:
return $default(_that.tenantName,_that.description,_that.logoUrl,_that.colors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaasTenantBranding with DiagnosticableTreeMixin implements SaasTenantBranding {
  const _SaasTenantBranding({required this.tenantName, required this.description, this.logoUrl, this.colors});
  factory _SaasTenantBranding.fromJson(Map<String, dynamic> json) => _$SaasTenantBrandingFromJson(json);

@override final  String tenantName;
@override final  String description;
@override final  String? logoUrl;
@override final  SaasTenantBrandingColors? colors;

/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaasTenantBrandingCopyWith<_SaasTenantBranding> get copyWith => __$SaasTenantBrandingCopyWithImpl<_SaasTenantBranding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaasTenantBrandingToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SaasTenantBranding'))
    ..add(DiagnosticsProperty('tenantName', tenantName))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('logoUrl', logoUrl))..add(DiagnosticsProperty('colors', colors));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaasTenantBranding&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.description, description) || other.description == description)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.colors, colors) || other.colors == colors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantName,description,logoUrl,colors);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SaasTenantBranding(tenantName: $tenantName, description: $description, logoUrl: $logoUrl, colors: $colors)';
}


}

/// @nodoc
abstract mixin class _$SaasTenantBrandingCopyWith<$Res> implements $SaasTenantBrandingCopyWith<$Res> {
  factory _$SaasTenantBrandingCopyWith(_SaasTenantBranding value, $Res Function(_SaasTenantBranding) _then) = __$SaasTenantBrandingCopyWithImpl;
@override @useResult
$Res call({
 String tenantName, String description, String? logoUrl, SaasTenantBrandingColors? colors
});


@override $SaasTenantBrandingColorsCopyWith<$Res>? get colors;

}
/// @nodoc
class __$SaasTenantBrandingCopyWithImpl<$Res>
    implements _$SaasTenantBrandingCopyWith<$Res> {
  __$SaasTenantBrandingCopyWithImpl(this._self, this._then);

  final _SaasTenantBranding _self;
  final $Res Function(_SaasTenantBranding) _then;

/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantName = null,Object? description = null,Object? logoUrl = freezed,Object? colors = freezed,}) {
  return _then(_SaasTenantBranding(
tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,colors: freezed == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as SaasTenantBrandingColors?,
  ));
}

/// Create a copy of SaasTenantBranding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaasTenantBrandingColorsCopyWith<$Res>? get colors {
    if (_self.colors == null) {
    return null;
  }

  return $SaasTenantBrandingColorsCopyWith<$Res>(_self.colors!, (value) {
    return _then(_self.copyWith(colors: value));
  });
}
}

// dart format on
