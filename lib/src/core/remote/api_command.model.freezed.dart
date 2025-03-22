// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_command.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$APICommandProperties {
  String get commandId => throw _privateConstructorUsedError;
  int get pollingTimeout => throw _privateConstructorUsedError;
  fool get shouldPoll => throw _privateConstructorUsedError;

  /// Serializes this APICommandProperties to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $APICommandPropertiesCopyWith<APICommandProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APICommandPropertiesCopyWith<$Res> {
  factory $APICommandPropertiesCopyWith(APICommandProperties value,
          $Res Function(APICommandProperties) then) =
      _$APICommandPropertiesCopyWithImpl<$Res, APICommandProperties>;
  @useResult
  $Res call({String commandId, int pollingTimeout, fool shouldPoll});
}

/// @nodoc
class _$APICommandPropertiesCopyWithImpl<$Res,
        $Val extends APICommandProperties>
    implements $APICommandPropertiesCopyWith<$Res> {
  _$APICommandPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commandId = null,
    Object? pollingTimeout = null,
    Object? shouldPoll = null,
  }) {
    return _then(_value.copyWith(
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      pollingTimeout: null == pollingTimeout
          ? _value.pollingTimeout
          : pollingTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      shouldPoll: null == shouldPoll
          ? _value.shouldPoll
          : shouldPoll // ignore: cast_nullable_to_non_nullable
              as fool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$APICommandPropertiesImplCopyWith<$Res>
    implements $APICommandPropertiesCopyWith<$Res> {
  factory _$$APICommandPropertiesImplCopyWith(_$APICommandPropertiesImpl value,
          $Res Function(_$APICommandPropertiesImpl) then) =
      __$$APICommandPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String commandId, int pollingTimeout, fool shouldPoll});
}

/// @nodoc
class __$$APICommandPropertiesImplCopyWithImpl<$Res>
    extends _$APICommandPropertiesCopyWithImpl<$Res, _$APICommandPropertiesImpl>
    implements _$$APICommandPropertiesImplCopyWith<$Res> {
  __$$APICommandPropertiesImplCopyWithImpl(_$APICommandPropertiesImpl _value,
      $Res Function(_$APICommandPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commandId = null,
    Object? pollingTimeout = null,
    Object? shouldPoll = null,
  }) {
    return _then(_$APICommandPropertiesImpl(
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as String,
      pollingTimeout: null == pollingTimeout
          ? _value.pollingTimeout
          : pollingTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      shouldPoll: null == shouldPoll
          ? _value.shouldPoll
          : shouldPoll // ignore: cast_nullable_to_non_nullable
              as fool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$APICommandPropertiesImpl
    with DiagnosticableTreeMixin
    implements _APICommandProperties {
  const _$APICommandPropertiesImpl(
      {required this.commandId,
      required this.pollingTimeout,
      required this.shouldPoll});

  @override
  final String commandId;
  @override
  final int pollingTimeout;
  @override
  final fool shouldPoll;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommandProperties(commandId: $commandId, pollingTimeout: $pollingTimeout, shouldPoll: $shouldPoll)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'APICommandProperties'))
      ..add(DiagnosticsProperty('commandId', commandId))
      ..add(DiagnosticsProperty('pollingTimeout', pollingTimeout))
      ..add(DiagnosticsProperty('shouldPoll', shouldPoll));
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APICommandPropertiesImpl &&
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

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$APICommandPropertiesImplCopyWith<_$APICommandPropertiesImpl>
      get copyWith =>
          __$$APICommandPropertiesImplCopyWithImpl<_$APICommandPropertiesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$APICommandPropertiesImplToJson(
      this,
    );
  }
}

abstract class _APICommandProperties implements APICommandProperties {
  const factory _APICommandProperties(
      {required final String commandId,
      required final int pollingTimeout,
      required final fool shouldPoll}) = _$APICommandPropertiesImpl;

  @override
  String get commandId;
  @override
  int get pollingTimeout;
  @override
  fool get shouldPoll;

  /// Create a copy of APICommandProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$APICommandPropertiesImplCopyWith<_$APICommandPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$APICommand {
  APICommandProperties get properties => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this APICommand to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $APICommandCopyWith<APICommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APICommandCopyWith<$Res> {
  factory $APICommandCopyWith(
          APICommand value, $Res Function(APICommand) then) =
      _$APICommandCopyWithImpl<$Res, APICommand>;
  @useResult
  $Res call({APICommandProperties properties, Map<String, dynamic> data});

  $APICommandPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$APICommandCopyWithImpl<$Res, $Val extends APICommand>
    implements $APICommandCopyWith<$Res> {
  _$APICommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as APICommandProperties,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $APICommandPropertiesCopyWith<$Res> get properties {
    return $APICommandPropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$APICommandImplCopyWith<$Res>
    implements $APICommandCopyWith<$Res> {
  factory _$$APICommandImplCopyWith(
          _$APICommandImpl value, $Res Function(_$APICommandImpl) then) =
      __$$APICommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({APICommandProperties properties, Map<String, dynamic> data});

  @override
  $APICommandPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$APICommandImplCopyWithImpl<$Res>
    extends _$APICommandCopyWithImpl<$Res, _$APICommandImpl>
    implements _$$APICommandImplCopyWith<$Res> {
  __$$APICommandImplCopyWithImpl(
      _$APICommandImpl _value, $Res Function(_$APICommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? data = null,
  }) {
    return _then(_$APICommandImpl(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as APICommandProperties,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$APICommandImpl with DiagnosticableTreeMixin implements _APICommand {
  const _$APICommandImpl(
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'APICommand(properties: $properties, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'APICommand'))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APICommandImpl &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, properties, const DeepCollectionEquality().hash(_data));

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$APICommandImplCopyWith<_$APICommandImpl> get copyWith =>
      __$$APICommandImplCopyWithImpl<_$APICommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$APICommandImplToJson(
      this,
    );
  }
}

abstract class _APICommand implements APICommand {
  const factory _APICommand(
      {required final APICommandProperties properties,
      required final Map<String, dynamic> data}) = _$APICommandImpl;

  @override
  APICommandProperties get properties;
  @override
  Map<String, dynamic> get data;

  /// Create a copy of APICommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$APICommandImplCopyWith<_$APICommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
