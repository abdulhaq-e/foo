// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_pagination.query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CursorPaginationQuery implements DiagnosticableTreeMixin {

 CursorInput? get cursorInput; int get limit;
/// Create a copy of CursorPaginationQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorPaginationQueryCopyWith<CursorPaginationQuery> get copyWith => _$CursorPaginationQueryCopyWithImpl<CursorPaginationQuery>(this as CursorPaginationQuery, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorPaginationQuery'))
    ..add(DiagnosticsProperty('cursorInput', cursorInput))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorPaginationQuery&&(identical(other.cursorInput, cursorInput) || other.cursorInput == cursorInput)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,cursorInput,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorPaginationQuery(cursorInput: $cursorInput, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $CursorPaginationQueryCopyWith<$Res>  {
  factory $CursorPaginationQueryCopyWith(CursorPaginationQuery value, $Res Function(CursorPaginationQuery) _then) = _$CursorPaginationQueryCopyWithImpl;
@useResult
$Res call({
 CursorInput? cursorInput, int limit
});


$CursorInputCopyWith<$Res>? get cursorInput;

}
/// @nodoc
class _$CursorPaginationQueryCopyWithImpl<$Res>
    implements $CursorPaginationQueryCopyWith<$Res> {
  _$CursorPaginationQueryCopyWithImpl(this._self, this._then);

  final CursorPaginationQuery _self;
  final $Res Function(CursorPaginationQuery) _then;

/// Create a copy of CursorPaginationQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursorInput = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
cursorInput: freezed == cursorInput ? _self.cursorInput : cursorInput // ignore: cast_nullable_to_non_nullable
as CursorInput?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CursorPaginationQuery
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


/// Adds pattern-matching-related methods to [CursorPaginationQuery].
extension CursorPaginationQueryPatterns on CursorPaginationQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursorPaginationQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursorPaginationQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursorPaginationQuery value)  $default,){
final _that = this;
switch (_that) {
case _CursorPaginationQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursorPaginationQuery value)?  $default,){
final _that = this;
switch (_that) {
case _CursorPaginationQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CursorInput? cursorInput,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursorPaginationQuery() when $default != null:
return $default(_that.cursorInput,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CursorInput? cursorInput,  int limit)  $default,) {final _that = this;
switch (_that) {
case _CursorPaginationQuery():
return $default(_that.cursorInput,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CursorInput? cursorInput,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _CursorPaginationQuery() when $default != null:
return $default(_that.cursorInput,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _CursorPaginationQuery with DiagnosticableTreeMixin implements CursorPaginationQuery {
  const _CursorPaginationQuery({this.cursorInput = null, this.limit = 30});
  

@override@JsonKey() final  CursorInput? cursorInput;
@override@JsonKey() final  int limit;

/// Create a copy of CursorPaginationQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorPaginationQueryCopyWith<_CursorPaginationQuery> get copyWith => __$CursorPaginationQueryCopyWithImpl<_CursorPaginationQuery>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CursorPaginationQuery'))
    ..add(DiagnosticsProperty('cursorInput', cursorInput))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursorPaginationQuery&&(identical(other.cursorInput, cursorInput) || other.cursorInput == cursorInput)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,cursorInput,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CursorPaginationQuery(cursorInput: $cursorInput, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$CursorPaginationQueryCopyWith<$Res> implements $CursorPaginationQueryCopyWith<$Res> {
  factory _$CursorPaginationQueryCopyWith(_CursorPaginationQuery value, $Res Function(_CursorPaginationQuery) _then) = __$CursorPaginationQueryCopyWithImpl;
@override @useResult
$Res call({
 CursorInput? cursorInput, int limit
});


@override $CursorInputCopyWith<$Res>? get cursorInput;

}
/// @nodoc
class __$CursorPaginationQueryCopyWithImpl<$Res>
    implements _$CursorPaginationQueryCopyWith<$Res> {
  __$CursorPaginationQueryCopyWithImpl(this._self, this._then);

  final _CursorPaginationQuery _self;
  final $Res Function(_CursorPaginationQuery) _then;

/// Create a copy of CursorPaginationQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursorInput = freezed,Object? limit = null,}) {
  return _then(_CursorPaginationQuery(
cursorInput: freezed == cursorInput ? _self.cursorInput : cursorInput // ignore: cast_nullable_to_non_nullable
as CursorInput?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CursorPaginationQuery
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
