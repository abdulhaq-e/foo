// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_status.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OperationStatus {

 OperationStatusValue get status; Map<String, dynamic>? get data; Map<String, dynamic>? get error;
/// Create a copy of OperationStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationStatusCopyWith<OperationStatus> get copyWith => _$OperationStatusCopyWithImpl<OperationStatus>(this as OperationStatus, _$identity);

  /// Serializes this OperationStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationStatus&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'OperationStatus(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $OperationStatusCopyWith<$Res>  {
  factory $OperationStatusCopyWith(OperationStatus value, $Res Function(OperationStatus) _then) = _$OperationStatusCopyWithImpl;
@useResult
$Res call({
 OperationStatusValue status, Map<String, dynamic>? data, Map<String, dynamic>? error
});




}
/// @nodoc
class _$OperationStatusCopyWithImpl<$Res>
    implements $OperationStatusCopyWith<$Res> {
  _$OperationStatusCopyWithImpl(this._self, this._then);

  final OperationStatus _self;
  final $Res Function(OperationStatus) _then;

/// Create a copy of OperationStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatusValue,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationStatus].
extension OperationStatusPatterns on OperationStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationStatus value)  $default,){
final _that = this;
switch (_that) {
case _OperationStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationStatus value)?  $default,){
final _that = this;
switch (_that) {
case _OperationStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OperationStatusValue status,  Map<String, dynamic>? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationStatus() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OperationStatusValue status,  Map<String, dynamic>? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _OperationStatus():
return $default(_that.status,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OperationStatusValue status,  Map<String, dynamic>? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _OperationStatus() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OperationStatus implements OperationStatus {
  const _OperationStatus({required this.status, final  Map<String, dynamic>? data, final  Map<String, dynamic>? error}): _data = data,_error = error;
  factory _OperationStatus.fromJson(Map<String, dynamic> json) => _$OperationStatusFromJson(json);

@override final  OperationStatusValue status;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OperationStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationStatusCopyWith<_OperationStatus> get copyWith => __$OperationStatusCopyWithImpl<_OperationStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OperationStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationStatus&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'OperationStatus(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OperationStatusCopyWith<$Res> implements $OperationStatusCopyWith<$Res> {
  factory _$OperationStatusCopyWith(_OperationStatus value, $Res Function(_OperationStatus) _then) = __$OperationStatusCopyWithImpl;
@override @useResult
$Res call({
 OperationStatusValue status, Map<String, dynamic>? data, Map<String, dynamic>? error
});




}
/// @nodoc
class __$OperationStatusCopyWithImpl<$Res>
    implements _$OperationStatusCopyWith<$Res> {
  __$OperationStatusCopyWithImpl(this._self, this._then);

  final _OperationStatus _self;
  final $Res Function(_OperationStatus) _then;

/// Create a copy of OperationStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_OperationStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatusValue,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
