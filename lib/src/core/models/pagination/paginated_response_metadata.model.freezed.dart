// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_response_metadata.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedResponseMetadata implements DiagnosticableTreeMixin {

 CursorPaginationMetadata get pagination;
/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResponseMetadataCopyWith<PaginatedResponseMetadata> get copyWith => _$PaginatedResponseMetadataCopyWithImpl<PaginatedResponseMetadata>(this as PaginatedResponseMetadata, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginatedResponseMetadata'))
    ..add(DiagnosticsProperty('pagination', pagination));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResponseMetadata&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginatedResponseMetadata(pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $PaginatedResponseMetadataCopyWith<$Res>  {
  factory $PaginatedResponseMetadataCopyWith(PaginatedResponseMetadata value, $Res Function(PaginatedResponseMetadata) _then) = _$PaginatedResponseMetadataCopyWithImpl;
@useResult
$Res call({
 CursorPaginationMetadata pagination
});


$CursorPaginationMetadataCopyWith<$Res> get pagination;

}
/// @nodoc
class _$PaginatedResponseMetadataCopyWithImpl<$Res>
    implements $PaginatedResponseMetadataCopyWith<$Res> {
  _$PaginatedResponseMetadataCopyWithImpl(this._self, this._then);

  final PaginatedResponseMetadata _self;
  final $Res Function(PaginatedResponseMetadata) _then;

/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as CursorPaginationMetadata,
  ));
}
/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorPaginationMetadataCopyWith<$Res> get pagination {
  
  return $CursorPaginationMetadataCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginatedResponseMetadata].
extension PaginatedResponseMetadataPatterns on PaginatedResponseMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResponseMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResponseMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResponseMetadata value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResponseMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CursorPaginationMetadata pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResponseMetadata() when $default != null:
return $default(_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CursorPaginationMetadata pagination)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseMetadata():
return $default(_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CursorPaginationMetadata pagination)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseMetadata() when $default != null:
return $default(_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _PaginatedResponseMetadata with DiagnosticableTreeMixin implements PaginatedResponseMetadata {
  const _PaginatedResponseMetadata({required this.pagination});
  factory _PaginatedResponseMetadata.fromJson(Map<String, dynamic> json) => _$PaginatedResponseMetadataFromJson(json);

@override final  CursorPaginationMetadata pagination;

/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResponseMetadataCopyWith<_PaginatedResponseMetadata> get copyWith => __$PaginatedResponseMetadataCopyWithImpl<_PaginatedResponseMetadata>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginatedResponseMetadata'))
    ..add(DiagnosticsProperty('pagination', pagination));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResponseMetadata&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginatedResponseMetadata(pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResponseMetadataCopyWith<$Res> implements $PaginatedResponseMetadataCopyWith<$Res> {
  factory _$PaginatedResponseMetadataCopyWith(_PaginatedResponseMetadata value, $Res Function(_PaginatedResponseMetadata) _then) = __$PaginatedResponseMetadataCopyWithImpl;
@override @useResult
$Res call({
 CursorPaginationMetadata pagination
});


@override $CursorPaginationMetadataCopyWith<$Res> get pagination;

}
/// @nodoc
class __$PaginatedResponseMetadataCopyWithImpl<$Res>
    implements _$PaginatedResponseMetadataCopyWith<$Res> {
  __$PaginatedResponseMetadataCopyWithImpl(this._self, this._then);

  final _PaginatedResponseMetadata _self;
  final $Res Function(_PaginatedResponseMetadata) _then;

/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,}) {
  return _then(_PaginatedResponseMetadata(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as CursorPaginationMetadata,
  ));
}

/// Create a copy of PaginatedResponseMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorPaginationMetadataCopyWith<$Res> get pagination {
  
  return $CursorPaginationMetadataCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
