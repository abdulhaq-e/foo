// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_pagination_metadata.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CursorInput implements DiagnosticableTreeMixin {

 String get cursor; PaginationDirection get direction;
/// Create a copy of CursorInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorInputCopyWith<CursorInput> get copyWith => _$CursorInputCopyWithImpl<CursorInput>(this as CursorInput, _$identity);

  /// Serializes this CursorInput to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorInput'))
    ..add(DiagnosticsProperty('cursor', cursor))..add(DiagnosticsProperty('direction', direction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorInput&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.direction, direction) || other.direction == direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursor,direction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorInput(cursor: $cursor, direction: $direction)';
}


}

/// @nodoc
abstract mixin class $CursorInputCopyWith<$Res>  {
  factory $CursorInputCopyWith(CursorInput value, $Res Function(CursorInput) _then) = _$CursorInputCopyWithImpl;
@useResult
$Res call({
 String cursor, PaginationDirection direction
});




}
/// @nodoc
class _$CursorInputCopyWithImpl<$Res>
    implements $CursorInputCopyWith<$Res> {
  _$CursorInputCopyWithImpl(this._self, this._then);

  final CursorInput _self;
  final $Res Function(CursorInput) _then;

/// Create a copy of CursorInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursor = null,Object? direction = null,}) {
  return _then(_self.copyWith(
cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as PaginationDirection,
  ));
}

}


/// Adds pattern-matching-related methods to [CursorInput].
extension CursorInputPatterns on CursorInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursorInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursorInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursorInput value)  $default,){
final _that = this;
switch (_that) {
case _CursorInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursorInput value)?  $default,){
final _that = this;
switch (_that) {
case _CursorInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cursor,  PaginationDirection direction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursorInput() when $default != null:
return $default(_that.cursor,_that.direction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cursor,  PaginationDirection direction)  $default,) {final _that = this;
switch (_that) {
case _CursorInput():
return $default(_that.cursor,_that.direction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cursor,  PaginationDirection direction)?  $default,) {final _that = this;
switch (_that) {
case _CursorInput() when $default != null:
return $default(_that.cursor,_that.direction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CursorInput with DiagnosticableTreeMixin implements CursorInput {
  const _CursorInput({required this.cursor, required this.direction});
  factory _CursorInput.fromJson(Map<String, dynamic> json) => _$CursorInputFromJson(json);

@override final  String cursor;
@override final  PaginationDirection direction;

/// Create a copy of CursorInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorInputCopyWith<_CursorInput> get copyWith => __$CursorInputCopyWithImpl<_CursorInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursorInputToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorInput'))
    ..add(DiagnosticsProperty('cursor', cursor))..add(DiagnosticsProperty('direction', direction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursorInput&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.direction, direction) || other.direction == direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursor,direction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorInput(cursor: $cursor, direction: $direction)';
}


}

/// @nodoc
abstract mixin class _$CursorInputCopyWith<$Res> implements $CursorInputCopyWith<$Res> {
  factory _$CursorInputCopyWith(_CursorInput value, $Res Function(_CursorInput) _then) = __$CursorInputCopyWithImpl;
@override @useResult
$Res call({
 String cursor, PaginationDirection direction
});




}
/// @nodoc
class __$CursorInputCopyWithImpl<$Res>
    implements _$CursorInputCopyWith<$Res> {
  __$CursorInputCopyWithImpl(this._self, this._then);

  final _CursorInput _self;
  final $Res Function(_CursorInput) _then;

/// Create a copy of CursorInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursor = null,Object? direction = null,}) {
  return _then(_CursorInput(
cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as PaginationDirection,
  ));
}


}


/// @nodoc
mixin _$CursorPaginationMetadata implements DiagnosticableTreeMixin {

 CursorInput? get cursorInput; int get limit; String? get nextCursor; String? get previousCursor;
/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorPaginationMetadataCopyWith<CursorPaginationMetadata> get copyWith => _$CursorPaginationMetadataCopyWithImpl<CursorPaginationMetadata>(this as CursorPaginationMetadata, _$identity);

  /// Serializes this CursorPaginationMetadata to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorPaginationMetadata'))
    ..add(DiagnosticsProperty('cursorInput', cursorInput))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('nextCursor', nextCursor))..add(DiagnosticsProperty('previousCursor', previousCursor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorPaginationMetadata&&(identical(other.cursorInput, cursorInput) || other.cursorInput == cursorInput)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.previousCursor, previousCursor) || other.previousCursor == previousCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursorInput,limit,nextCursor,previousCursor);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorPaginationMetadata(cursorInput: $cursorInput, limit: $limit, nextCursor: $nextCursor, previousCursor: $previousCursor)';
}


}

/// @nodoc
abstract mixin class $CursorPaginationMetadataCopyWith<$Res>  {
  factory $CursorPaginationMetadataCopyWith(CursorPaginationMetadata value, $Res Function(CursorPaginationMetadata) _then) = _$CursorPaginationMetadataCopyWithImpl;
@useResult
$Res call({
 CursorInput? cursorInput, int limit, String? nextCursor, String? previousCursor
});


$CursorInputCopyWith<$Res>? get cursorInput;

}
/// @nodoc
class _$CursorPaginationMetadataCopyWithImpl<$Res>
    implements $CursorPaginationMetadataCopyWith<$Res> {
  _$CursorPaginationMetadataCopyWithImpl(this._self, this._then);

  final CursorPaginationMetadata _self;
  final $Res Function(CursorPaginationMetadata) _then;

/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursorInput = freezed,Object? limit = null,Object? nextCursor = freezed,Object? previousCursor = freezed,}) {
  return _then(_self.copyWith(
cursorInput: freezed == cursorInput ? _self.cursorInput : cursorInput // ignore: cast_nullable_to_non_nullable
as CursorInput?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,previousCursor: freezed == previousCursor ? _self.previousCursor : previousCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorInputCopyWith<$Res>? get cursorInput {
    if (_self.cursorInput == null) {
    return null;
  }

  return $CursorInputCopyWith<$Res>(_self.cursorInput!, (value) {
    return _then(_self.copyWith(cursorInput: value));
  });
}
}


/// Adds pattern-matching-related methods to [CursorPaginationMetadata].
extension CursorPaginationMetadataPatterns on CursorPaginationMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursorPaginationMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursorPaginationMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursorPaginationMetadata value)  $default,){
final _that = this;
switch (_that) {
case _CursorPaginationMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursorPaginationMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _CursorPaginationMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CursorInput? cursorInput,  int limit,  String? nextCursor,  String? previousCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursorPaginationMetadata() when $default != null:
return $default(_that.cursorInput,_that.limit,_that.nextCursor,_that.previousCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CursorInput? cursorInput,  int limit,  String? nextCursor,  String? previousCursor)  $default,) {final _that = this;
switch (_that) {
case _CursorPaginationMetadata():
return $default(_that.cursorInput,_that.limit,_that.nextCursor,_that.previousCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CursorInput? cursorInput,  int limit,  String? nextCursor,  String? previousCursor)?  $default,) {final _that = this;
switch (_that) {
case _CursorPaginationMetadata() when $default != null:
return $default(_that.cursorInput,_that.limit,_that.nextCursor,_that.previousCursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CursorPaginationMetadata with DiagnosticableTreeMixin implements CursorPaginationMetadata {
  const _CursorPaginationMetadata({required this.cursorInput, required this.limit, required this.nextCursor, required this.previousCursor});
  factory _CursorPaginationMetadata.fromJson(Map<String, dynamic> json) => _$CursorPaginationMetadataFromJson(json);

@override final  CursorInput? cursorInput;
@override final  int limit;
@override final  String? nextCursor;
@override final  String? previousCursor;

/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorPaginationMetadataCopyWith<_CursorPaginationMetadata> get copyWith => __$CursorPaginationMetadataCopyWithImpl<_CursorPaginationMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursorPaginationMetadataToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorPaginationMetadata'))
    ..add(DiagnosticsProperty('cursorInput', cursorInput))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('nextCursor', nextCursor))..add(DiagnosticsProperty('previousCursor', previousCursor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursorPaginationMetadata&&(identical(other.cursorInput, cursorInput) || other.cursorInput == cursorInput)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.previousCursor, previousCursor) || other.previousCursor == previousCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursorInput,limit,nextCursor,previousCursor);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorPaginationMetadata(cursorInput: $cursorInput, limit: $limit, nextCursor: $nextCursor, previousCursor: $previousCursor)';
}


}

/// @nodoc
abstract mixin class _$CursorPaginationMetadataCopyWith<$Res> implements $CursorPaginationMetadataCopyWith<$Res> {
  factory _$CursorPaginationMetadataCopyWith(_CursorPaginationMetadata value, $Res Function(_CursorPaginationMetadata) _then) = __$CursorPaginationMetadataCopyWithImpl;
@override @useResult
$Res call({
 CursorInput? cursorInput, int limit, String? nextCursor, String? previousCursor
});


@override $CursorInputCopyWith<$Res>? get cursorInput;

}
/// @nodoc
class __$CursorPaginationMetadataCopyWithImpl<$Res>
    implements _$CursorPaginationMetadataCopyWith<$Res> {
  __$CursorPaginationMetadataCopyWithImpl(this._self, this._then);

  final _CursorPaginationMetadata _self;
  final $Res Function(_CursorPaginationMetadata) _then;

/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursorInput = freezed,Object? limit = null,Object? nextCursor = freezed,Object? previousCursor = freezed,}) {
  return _then(_CursorPaginationMetadata(
cursorInput: freezed == cursorInput ? _self.cursorInput : cursorInput // ignore: cast_nullable_to_non_nullable
as CursorInput?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,previousCursor: freezed == previousCursor ? _self.previousCursor : previousCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CursorPaginationMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorInputCopyWith<$Res>? get cursorInput {
    if (_self.cursorInput == null) {
    return null;
  }

  return $CursorInputCopyWith<$Res>(_self.cursorInput!, (value) {
    return _then(_self.copyWith(cursorInput: value));
  });
}
}

// dart format on
