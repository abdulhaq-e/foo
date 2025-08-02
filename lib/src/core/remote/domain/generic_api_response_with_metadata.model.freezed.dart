// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_api_response_with_metadata.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GenericAPIResponseWithMetadata<T, M>
    _$GenericAPIResponseWithMetadataFromJson<T, M>(Map<String, dynamic> json,
        T Function(Object?) fromJsonT, M Function(Object?) fromJsonM) {
  return GenericAPIResponseWithMetadataData<T, M>.fromJson(
      json, fromJsonT, fromJsonM);
}

/// @nodoc
mixin _$GenericAPIResponseWithMetadata<T, M> {
  T get data;
  M get metadata;

  /// Create a copy of GenericAPIResponseWithMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericAPIResponseWithMetadataCopyWith<T, M,
          GenericAPIResponseWithMetadata<T, M>>
      get copyWith => _$GenericAPIResponseWithMetadataCopyWithImpl<T, M,
              GenericAPIResponseWithMetadata<T, M>>(
          this as GenericAPIResponseWithMetadata<T, M>, _$identity);

  /// Serializes this GenericAPIResponseWithMetadata to a JSON map.
  Map<String, dynamic> toJson(
      Object? Function(T) toJsonT, Object? Function(M) toJsonM);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericAPIResponseWithMetadata<T, M> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'GenericAPIResponseWithMetadata<$T, $M>(data: $data, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $GenericAPIResponseWithMetadataCopyWith<T, M, $Res> {
  factory $GenericAPIResponseWithMetadataCopyWith(
          GenericAPIResponseWithMetadata<T, M> value,
          $Res Function(GenericAPIResponseWithMetadata<T, M>) _then) =
      _$GenericAPIResponseWithMetadataCopyWithImpl;
  @useResult
  $Res call({T data, M metadata});
}

/// @nodoc
class _$GenericAPIResponseWithMetadataCopyWithImpl<T, M, $Res>
    implements $GenericAPIResponseWithMetadataCopyWith<T, M, $Res> {
  _$GenericAPIResponseWithMetadataCopyWithImpl(this._self, this._then);

  final GenericAPIResponseWithMetadata<T, M> _self;
  final $Res Function(GenericAPIResponseWithMetadata<T, M>) _then;

  /// Create a copy of GenericAPIResponseWithMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as M,
    ));
  }
}

/// Adds pattern-matching-related methods to [GenericAPIResponseWithMetadata].
extension GenericAPIResponseWithMetadataPatterns<T, M>
    on GenericAPIResponseWithMetadata<T, M> {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GenericAPIResponseWithMetadataData<T, M> value)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GenericAPIResponseWithMetadataData<T, M> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData():
        return $default(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(GenericAPIResponseWithMetadataData<T, M> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T data, M metadata)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData() when $default != null:
        return $default(_that.data, _that.metadata);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T data, M metadata) $default,
  ) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData():
        return $default(_that.data, _that.metadata);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(T data, M metadata)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case GenericAPIResponseWithMetadataData() when $default != null:
        return $default(_that.data, _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class GenericAPIResponseWithMetadataData<T, M>
    implements GenericAPIResponseWithMetadata<T, M> {
  const GenericAPIResponseWithMetadataData(this.data, this.metadata);
  factory GenericAPIResponseWithMetadataData.fromJson(Map<String, dynamic> json,
          T Function(Object?) fromJsonT, M Function(Object?) fromJsonM) =>
      _$GenericAPIResponseWithMetadataDataFromJson(json, fromJsonT, fromJsonM);

  @override
  final T data;
  @override
  final M metadata;

  /// Create a copy of GenericAPIResponseWithMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericAPIResponseWithMetadataDataCopyWith<T, M,
          GenericAPIResponseWithMetadataData<T, M>>
      get copyWith => _$GenericAPIResponseWithMetadataDataCopyWithImpl<T, M,
          GenericAPIResponseWithMetadataData<T, M>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(T) toJsonT, Object? Function(M) toJsonM) {
    return _$GenericAPIResponseWithMetadataDataToJson<T, M>(
        this, toJsonT, toJsonM);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericAPIResponseWithMetadataData<T, M> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'GenericAPIResponseWithMetadata<$T, $M>(data: $data, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $GenericAPIResponseWithMetadataDataCopyWith<T, M, $Res>
    implements $GenericAPIResponseWithMetadataCopyWith<T, M, $Res> {
  factory $GenericAPIResponseWithMetadataDataCopyWith(
          GenericAPIResponseWithMetadataData<T, M> value,
          $Res Function(GenericAPIResponseWithMetadataData<T, M>) _then) =
      _$GenericAPIResponseWithMetadataDataCopyWithImpl;
  @override
  @useResult
  $Res call({T data, M metadata});
}

/// @nodoc
class _$GenericAPIResponseWithMetadataDataCopyWithImpl<T, M, $Res>
    implements $GenericAPIResponseWithMetadataDataCopyWith<T, M, $Res> {
  _$GenericAPIResponseWithMetadataDataCopyWithImpl(this._self, this._then);

  final GenericAPIResponseWithMetadataData<T, M> _self;
  final $Res Function(GenericAPIResponseWithMetadataData<T, M>) _then;

  /// Create a copy of GenericAPIResponseWithMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? metadata = freezed,
  }) {
    return _then(GenericAPIResponseWithMetadataData<T, M>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as M,
    ));
  }
}

// dart format on
