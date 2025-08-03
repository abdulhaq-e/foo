// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_command.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$APICommandProperties implements DiagnosticableTreeMixin {
  String get commandId;
  int get pollingTimeout;
  bool get shouldPoll;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $APICommandPropertiesCopyWith<APICommandProperties> get copyWith =>
      _$APICommandPropertiesCopyWithImpl<APICommandProperties>(
          this as APICommandProperties, _$identity);

  /// Serializes this APICommandProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'APICommandProperties'))
      ..add(DiagnosticsProperty('commandId', commandId))
      ..add(DiagnosticsProperty('pollingTimeout', pollingTimeout))
      ..add(DiagnosticsProperty('shouldPoll', shouldPoll));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is APICommandProperties &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.pollingTimeout, pollingTimeout) ||
                other.pollingTimeout == pollingTimeout) &&
            (identical(other.shouldPoll, shouldPoll) ||
                other.shouldPoll == shouldPoll));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commandId, pollingTimeout, shouldPoll);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommandProperties(commandId: $commandId, pollingTimeout: $pollingTimeout, shouldPoll: $shouldPoll)';
  }
}

/// @nodoc
abstract mixin class $APICommandPropertiesCopyWith<$Res> {
  factory $APICommandPropertiesCopyWith(APICommandProperties value,
          $Res Function(APICommandProperties) _then) =
      _$APICommandPropertiesCopyWithImpl;
  @useResult
  $Res call({String commandId, int pollingTimeout, bool shouldPoll});
}

/// @nodoc
class _$APICommandPropertiesCopyWithImpl<$Res>
    implements $APICommandPropertiesCopyWith<$Res> {
  _$APICommandPropertiesCopyWithImpl(this._self, this._then);

  final APICommandProperties _self;
  final $Res Function(APICommandProperties) _then;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commandId = null,
    Object? pollingTimeout = null,
    Object? shouldPoll = null,
  }) {
    return _then(_self.copyWith(
      commandId: null == commandId
          ? _self.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      pollingTimeout: null == pollingTimeout
          ? _self.pollingTimeout
          : pollingTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      shouldPoll: null == shouldPoll
          ? _self.shouldPoll
          : shouldPoll // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [APICommandProperties].
extension APICommandPropertiesPatterns on APICommandProperties {
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
    TResult Function(_APICommandProperties value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties() when $default != null:
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
    TResult Function(_APICommandProperties value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_APICommandProperties value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties() when $default != null:
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
    TResult Function(String commandId, int pollingTimeout, bool shouldPoll)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties() when $default != null:
        return $default(
            _that.commandId, _that.pollingTimeout, _that.shouldPoll);
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
    TResult Function(String commandId, int pollingTimeout, bool shouldPoll)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties():
        return $default(
            _that.commandId, _that.pollingTimeout, _that.shouldPoll);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String commandId, int pollingTimeout, bool shouldPoll)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommandProperties() when $default != null:
        return $default(
            _that.commandId, _that.pollingTimeout, _that.shouldPoll);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _APICommandProperties
    with DiagnosticableTreeMixin
    implements APICommandProperties {
  const _APICommandProperties(
      {required this.commandId,
      required this.pollingTimeout,
      required this.shouldPoll});

  @override
  final String commandId;
  @override
  final int pollingTimeout;
  @override
  final bool shouldPoll;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$APICommandPropertiesCopyWith<_APICommandProperties> get copyWith =>
      __$APICommandPropertiesCopyWithImpl<_APICommandProperties>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$APICommandPropertiesToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'APICommandProperties'))
      ..add(DiagnosticsProperty('commandId', commandId))
      ..add(DiagnosticsProperty('pollingTimeout', pollingTimeout))
      ..add(DiagnosticsProperty('shouldPoll', shouldPoll));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _APICommandProperties &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.pollingTimeout, pollingTimeout) ||
                other.pollingTimeout == pollingTimeout) &&
            (identical(other.shouldPoll, shouldPoll) ||
                other.shouldPoll == shouldPoll));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commandId, pollingTimeout, shouldPoll);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommandProperties(commandId: $commandId, pollingTimeout: $pollingTimeout, shouldPoll: $shouldPoll)';
  }
}

/// @nodoc
abstract mixin class _$APICommandPropertiesCopyWith<$Res>
    implements $APICommandPropertiesCopyWith<$Res> {
  factory _$APICommandPropertiesCopyWith(_APICommandProperties value,
          $Res Function(_APICommandProperties) _then) =
      __$APICommandPropertiesCopyWithImpl;
  @override
  @useResult
  $Res call({String commandId, int pollingTimeout, bool shouldPoll});
}

/// @nodoc
class __$APICommandPropertiesCopyWithImpl<$Res>
    implements _$APICommandPropertiesCopyWith<$Res> {
  __$APICommandPropertiesCopyWithImpl(this._self, this._then);

  final _APICommandProperties _self;
  final $Res Function(_APICommandProperties) _then;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? commandId = null,
    Object? pollingTimeout = null,
    Object? shouldPoll = null,
  }) {
    return _then(_APICommandProperties(
      commandId: null == commandId
          ? _self.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      pollingTimeout: null == pollingTimeout
          ? _self.pollingTimeout
          : pollingTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      shouldPoll: null == shouldPoll
          ? _self.shouldPoll
          : shouldPoll // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$APICommand implements DiagnosticableTreeMixin {
  APICommandProperties get properties;
  Map<String, dynamic> get data;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $APICommandCopyWith<APICommand> get copyWith =>
      _$APICommandCopyWithImpl<APICommand>(this as APICommand, _$identity);

  /// Serializes this APICommand to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'APICommand'))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is APICommand &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, properties, const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommand(properties: $properties, data: $data)';
  }
}

/// @nodoc
abstract mixin class $APICommandCopyWith<$Res> {
  factory $APICommandCopyWith(
          APICommand value, $Res Function(APICommand) _then) =
      _$APICommandCopyWithImpl;
  @useResult
  $Res call({APICommandProperties properties, Map<String, dynamic> data});

  $APICommandPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$APICommandCopyWithImpl<$Res> implements $APICommandCopyWith<$Res> {
  _$APICommandCopyWithImpl(this._self, this._then);

  final APICommand _self;
  final $Res Function(APICommand) _then;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as APICommandProperties,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $APICommandPropertiesCopyWith<$Res> get properties {
    return $APICommandPropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
  }
}

/// Adds pattern-matching-related methods to [APICommand].
extension APICommandPatterns on APICommand {
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
    TResult Function(_APICommand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _APICommand() when $default != null:
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
    TResult Function(_APICommand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommand():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_APICommand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommand() when $default != null:
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
    TResult Function(
            APICommandProperties properties, Map<String, dynamic> data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _APICommand() when $default != null:
        return $default(_that.properties, _that.data);
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
    TResult Function(APICommandProperties properties, Map<String, dynamic> data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommand():
        return $default(_that.properties, _that.data);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            APICommandProperties properties, Map<String, dynamic> data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _APICommand() when $default != null:
        return $default(_that.properties, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _APICommand with DiagnosticableTreeMixin implements APICommand {
  const _APICommand(
      {required this.properties, required final Map<String, dynamic> data})
      : _data = data;

  @override
  final APICommandProperties properties;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$APICommandCopyWith<_APICommand> get copyWith =>
      __$APICommandCopyWithImpl<_APICommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$APICommandToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'APICommand'))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _APICommand &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, properties, const DeepCollectionEquality().hash(_data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommand(properties: $properties, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$APICommandCopyWith<$Res>
    implements $APICommandCopyWith<$Res> {
  factory _$APICommandCopyWith(
          _APICommand value, $Res Function(_APICommand) _then) =
      __$APICommandCopyWithImpl;
  @override
  @useResult
  $Res call({APICommandProperties properties, Map<String, dynamic> data});

  @override
  $APICommandPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$APICommandCopyWithImpl<$Res> implements _$APICommandCopyWith<$Res> {
  __$APICommandCopyWithImpl(this._self, this._then);

  final _APICommand _self;
  final $Res Function(_APICommand) _then;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? properties = null,
    Object? data = null,
  }) {
    return _then(_APICommand(
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as APICommandProperties,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $APICommandPropertiesCopyWith<$Res> get properties {
    return $APICommandPropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
  }
}

// dart format on
