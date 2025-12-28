// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_query_data.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedQueryDataState<Item> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryDataState<Item>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedQueryDataState<$Item>()';
}


}

/// @nodoc
class $PaginatedQueryDataStateCopyWith<Item,$Res>  {
$PaginatedQueryDataStateCopyWith(PaginatedQueryDataState<Item> _, $Res Function(PaginatedQueryDataState<Item>) __);
}


/// Adds pattern-matching-related methods to [PaginatedQueryDataState].
extension PaginatedQueryDataStatePatterns<Item> on PaginatedQueryDataState<Item> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaginatedQueryDataInitial<Item> value)?  initial,TResult Function( PaginatedQueryDataLoading<Item> value)?  loading,TResult Function( PaginatedQueryDataLoaded<Item> value)?  loaded,TResult Function( PaginatedQueryDataError<Item> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaginatedQueryDataInitial() when initial != null:
return initial(_that);case PaginatedQueryDataLoading() when loading != null:
return loading(_that);case PaginatedQueryDataLoaded() when loaded != null:
return loaded(_that);case PaginatedQueryDataError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaginatedQueryDataInitial<Item> value)  initial,required TResult Function( PaginatedQueryDataLoading<Item> value)  loading,required TResult Function( PaginatedQueryDataLoaded<Item> value)  loaded,required TResult Function( PaginatedQueryDataError<Item> value)  error,}){
final _that = this;
switch (_that) {
case PaginatedQueryDataInitial():
return initial(_that);case PaginatedQueryDataLoading():
return loading(_that);case PaginatedQueryDataLoaded():
return loaded(_that);case PaginatedQueryDataError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaginatedQueryDataInitial<Item> value)?  initial,TResult? Function( PaginatedQueryDataLoading<Item> value)?  loading,TResult? Function( PaginatedQueryDataLoaded<Item> value)?  loaded,TResult? Function( PaginatedQueryDataError<Item> value)?  error,}){
final _that = this;
switch (_that) {
case PaginatedQueryDataInitial() when initial != null:
return initial(_that);case PaginatedQueryDataLoading() when loading != null:
return loading(_that);case PaginatedQueryDataLoaded() when loaded != null:
return loaded(_that);case PaginatedQueryDataError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Item> items,  String? nextPagingKey,  String? previousPagingKey,  bool hasNextPage,  bool hasPreviousPage,  bool isFetchingNextPage,  bool isFetchingPreviousPage,  Object? nextPageError,  Object? previousPageError)?  loaded,TResult Function( Object error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaginatedQueryDataInitial() when initial != null:
return initial();case PaginatedQueryDataLoading() when loading != null:
return loading();case PaginatedQueryDataLoaded() when loaded != null:
return loaded(_that.items,_that.nextPagingKey,_that.previousPagingKey,_that.hasNextPage,_that.hasPreviousPage,_that.isFetchingNextPage,_that.isFetchingPreviousPage,_that.nextPageError,_that.previousPageError);case PaginatedQueryDataError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Item> items,  String? nextPagingKey,  String? previousPagingKey,  bool hasNextPage,  bool hasPreviousPage,  bool isFetchingNextPage,  bool isFetchingPreviousPage,  Object? nextPageError,  Object? previousPageError)  loaded,required TResult Function( Object error)  error,}) {final _that = this;
switch (_that) {
case PaginatedQueryDataInitial():
return initial();case PaginatedQueryDataLoading():
return loading();case PaginatedQueryDataLoaded():
return loaded(_that.items,_that.nextPagingKey,_that.previousPagingKey,_that.hasNextPage,_that.hasPreviousPage,_that.isFetchingNextPage,_that.isFetchingPreviousPage,_that.nextPageError,_that.previousPageError);case PaginatedQueryDataError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Item> items,  String? nextPagingKey,  String? previousPagingKey,  bool hasNextPage,  bool hasPreviousPage,  bool isFetchingNextPage,  bool isFetchingPreviousPage,  Object? nextPageError,  Object? previousPageError)?  loaded,TResult? Function( Object error)?  error,}) {final _that = this;
switch (_that) {
case PaginatedQueryDataInitial() when initial != null:
return initial();case PaginatedQueryDataLoading() when loading != null:
return loading();case PaginatedQueryDataLoaded() when loaded != null:
return loaded(_that.items,_that.nextPagingKey,_that.previousPagingKey,_that.hasNextPage,_that.hasPreviousPage,_that.isFetchingNextPage,_that.isFetchingPreviousPage,_that.nextPageError,_that.previousPageError);case PaginatedQueryDataError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PaginatedQueryDataInitial<Item> implements PaginatedQueryDataState<Item> {
  const PaginatedQueryDataInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryDataInitial<Item>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedQueryDataState<$Item>.initial()';
}


}




/// @nodoc


class PaginatedQueryDataLoading<Item> implements PaginatedQueryDataState<Item> {
  const PaginatedQueryDataLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryDataLoading<Item>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedQueryDataState<$Item>.loading()';
}


}




/// @nodoc


class PaginatedQueryDataLoaded<Item> implements PaginatedQueryDataState<Item> {
  const PaginatedQueryDataLoaded({required final  List<Item> items, required this.nextPagingKey, required this.previousPagingKey, required this.hasNextPage, required this.hasPreviousPage, this.isFetchingNextPage = false, this.isFetchingPreviousPage = false, this.nextPageError, this.previousPageError}): _items = items;
  

 final  List<Item> _items;
 List<Item> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  String? nextPagingKey;
 final  String? previousPagingKey;
 final  bool hasNextPage;
 final  bool hasPreviousPage;
@JsonKey() final  bool isFetchingNextPage;
@JsonKey() final  bool isFetchingPreviousPage;
 final  Object? nextPageError;
 final  Object? previousPageError;

/// Create a copy of PaginatedQueryDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedQueryDataLoadedCopyWith<Item, PaginatedQueryDataLoaded<Item>> get copyWith => _$PaginatedQueryDataLoadedCopyWithImpl<Item, PaginatedQueryDataLoaded<Item>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryDataLoaded<Item>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextPagingKey, nextPagingKey) || other.nextPagingKey == nextPagingKey)&&(identical(other.previousPagingKey, previousPagingKey) || other.previousPagingKey == previousPagingKey)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.isFetchingNextPage, isFetchingNextPage) || other.isFetchingNextPage == isFetchingNextPage)&&(identical(other.isFetchingPreviousPage, isFetchingPreviousPage) || other.isFetchingPreviousPage == isFetchingPreviousPage)&&const DeepCollectionEquality().equals(other.nextPageError, nextPageError)&&const DeepCollectionEquality().equals(other.previousPageError, previousPageError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextPagingKey,previousPagingKey,hasNextPage,hasPreviousPage,isFetchingNextPage,isFetchingPreviousPage,const DeepCollectionEquality().hash(nextPageError),const DeepCollectionEquality().hash(previousPageError));

@override
String toString() {
  return 'PaginatedQueryDataState<$Item>.loaded(items: $items, nextPagingKey: $nextPagingKey, previousPagingKey: $previousPagingKey, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage, isFetchingNextPage: $isFetchingNextPage, isFetchingPreviousPage: $isFetchingPreviousPage, nextPageError: $nextPageError, previousPageError: $previousPageError)';
}


}

/// @nodoc
abstract mixin class $PaginatedQueryDataLoadedCopyWith<Item,$Res> implements $PaginatedQueryDataStateCopyWith<Item, $Res> {
  factory $PaginatedQueryDataLoadedCopyWith(PaginatedQueryDataLoaded<Item> value, $Res Function(PaginatedQueryDataLoaded<Item>) _then) = _$PaginatedQueryDataLoadedCopyWithImpl;
@useResult
$Res call({
 List<Item> items, String? nextPagingKey, String? previousPagingKey, bool hasNextPage, bool hasPreviousPage, bool isFetchingNextPage, bool isFetchingPreviousPage, Object? nextPageError, Object? previousPageError
});




}
/// @nodoc
class _$PaginatedQueryDataLoadedCopyWithImpl<Item,$Res>
    implements $PaginatedQueryDataLoadedCopyWith<Item, $Res> {
  _$PaginatedQueryDataLoadedCopyWithImpl(this._self, this._then);

  final PaginatedQueryDataLoaded<Item> _self;
  final $Res Function(PaginatedQueryDataLoaded<Item>) _then;

/// Create a copy of PaginatedQueryDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextPagingKey = freezed,Object? previousPagingKey = freezed,Object? hasNextPage = null,Object? hasPreviousPage = null,Object? isFetchingNextPage = null,Object? isFetchingPreviousPage = null,Object? nextPageError = freezed,Object? previousPageError = freezed,}) {
  return _then(PaginatedQueryDataLoaded<Item>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Item>,nextPagingKey: freezed == nextPagingKey ? _self.nextPagingKey : nextPagingKey // ignore: cast_nullable_to_non_nullable
as String?,previousPagingKey: freezed == previousPagingKey ? _self.previousPagingKey : previousPagingKey // ignore: cast_nullable_to_non_nullable
as String?,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,isFetchingNextPage: null == isFetchingNextPage ? _self.isFetchingNextPage : isFetchingNextPage // ignore: cast_nullable_to_non_nullable
as bool,isFetchingPreviousPage: null == isFetchingPreviousPage ? _self.isFetchingPreviousPage : isFetchingPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,nextPageError: freezed == nextPageError ? _self.nextPageError : nextPageError ,previousPageError: freezed == previousPageError ? _self.previousPageError : previousPageError ,
  ));
}


}

/// @nodoc


class PaginatedQueryDataError<Item> implements PaginatedQueryDataState<Item> {
  const PaginatedQueryDataError({required this.error});
  

 final  Object error;

/// Create a copy of PaginatedQueryDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedQueryDataErrorCopyWith<Item, PaginatedQueryDataError<Item>> get copyWith => _$PaginatedQueryDataErrorCopyWithImpl<Item, PaginatedQueryDataError<Item>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryDataError<Item>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'PaginatedQueryDataState<$Item>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PaginatedQueryDataErrorCopyWith<Item,$Res> implements $PaginatedQueryDataStateCopyWith<Item, $Res> {
  factory $PaginatedQueryDataErrorCopyWith(PaginatedQueryDataError<Item> value, $Res Function(PaginatedQueryDataError<Item>) _then) = _$PaginatedQueryDataErrorCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$PaginatedQueryDataErrorCopyWithImpl<Item,$Res>
    implements $PaginatedQueryDataErrorCopyWith<Item, $Res> {
  _$PaginatedQueryDataErrorCopyWithImpl(this._self, this._then);

  final PaginatedQueryDataError<Item> _self;
  final $Res Function(PaginatedQueryDataError<Item>) _then;

/// Create a copy of PaginatedQueryDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PaginatedQueryDataError<Item>(
error: null == error ? _self.error : error ,
  ));
}


}

// dart format on
