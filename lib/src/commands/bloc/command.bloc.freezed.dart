// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandState<Command, Response, Error, ValidationError> {
  CommandState<Command, Response, Error, ValidationError>? get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError,
          CommandState<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandStateCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              CommandState<Command, Response, Error, ValidationError>>(
          this as CommandState<Command, Response, Error, ValidationError>,
          _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandState<Command, Response, Error, ValidationError> &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>(previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandStateCopyWith<Command, Response, Error,
    ValidationError, $Res> {
  factory $CommandStateCopyWith(
      CommandState<Command, Response, Error, ValidationError> value,
      $Res Function(CommandState<Command, Response, Error, ValidationError>)
          _then) = _$CommandStateCopyWithImpl;
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError> previousState});

  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState;
}

/// @nodoc
class _$CommandStateCopyWithImpl<Command, Response, Error, ValidationError,
        $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  _$CommandStateCopyWithImpl(this._self, this._then);

  final CommandState<Command, Response, Error, ValidationError> _self;
  final $Res Function(CommandState<Command, Response, Error, ValidationError>)
      _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = null,
  }) {
    return _then(_self.copyWith(
      previousState: null == previousState
          ? _self.previousState!
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState {
    if (_self.previousState == null) {
      return null;
    }

    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState!, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandInitial<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandInitial({required this.previousState});

  @override
  final CommandState<Command, Response, Error, ValidationError>? previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandInitialCopyWith<Command, Response, Error, ValidationError,
          CommandInitial<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandInitialCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              CommandInitial<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is CommandInitial<Command, Response, Error, ValidationError> &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.initial(previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandInitialCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandInitialCopyWith(
      CommandInitial<Command, Response, Error, ValidationError> value,
      $Res Function(CommandInitial<Command, Response, Error, ValidationError>)
          _then) = _$CommandInitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError>? previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState;
}

/// @nodoc
class _$CommandInitialCopyWithImpl<Command, Response, Error, ValidationError,
        $Res>
    implements
        $CommandInitialCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  _$CommandInitialCopyWithImpl(this._self, this._then);

  final CommandInitial<Command, Response, Error, ValidationError> _self;
  final $Res Function(CommandInitial<Command, Response, Error, ValidationError>)
      _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? previousState = freezed,
  }) {
    return _then(CommandInitial<Command, Response, Error, ValidationError>(
      previousState: freezed == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>?,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState {
    if (_self.previousState == null) {
      return null;
    }

    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState!, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandSucceeded<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandSucceeded({required this.response, required this.previousState});

  final Response response;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandSucceededCopyWith<Command, Response, Error, ValidationError,
          CommandSucceeded<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandSucceededCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              CommandSucceeded<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandSucceeded<Command, Response, Error,
                ValidationError> &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(response), previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.succeeded(response: $response, previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandSucceededCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandSucceededCopyWith(
      CommandSucceeded<Command, Response, Error, ValidationError> value,
      $Res Function(CommandSucceeded<Command, Response, Error, ValidationError>)
          _then) = _$CommandSucceededCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Response response,
      CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class _$CommandSucceededCopyWithImpl<Command, Response, Error, ValidationError,
        $Res>
    implements
        $CommandSucceededCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  _$CommandSucceededCopyWithImpl(this._self, this._then);

  final CommandSucceeded<Command, Response, Error, ValidationError> _self;
  final $Res Function(
      CommandSucceeded<Command, Response, Error, ValidationError>) _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = freezed,
    Object? previousState = null,
  }) {
    return _then(CommandSucceeded<Command, Response, Error, ValidationError>(
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState {
    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandExecutionAskingForConfirmation<Command, Response, Error,
        ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandExecutionAskingForConfirmation(
      {required this.command, required this.previousState});

  final Command command;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandExecutionAskingForConfirmationCopyWith<
      Command,
      Response,
      Error,
      ValidationError,
      CommandExecutionAskingForConfirmation<Command, Response, Error,
          ValidationError>> get copyWith =>
      _$CommandExecutionAskingForConfirmationCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          CommandExecutionAskingForConfirmation<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandExecutionAskingForConfirmation<Command, Response,
                Error, ValidationError> &&
            const DeepCollectionEquality().equals(other.command, command) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(command), previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.askingForConfirmation(command: $command, previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandExecutionAskingForConfirmationCopyWith<Command,
        Response, Error, ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandExecutionAskingForConfirmationCopyWith(
      CommandExecutionAskingForConfirmation<Command, Response, Error,
              ValidationError>
          value,
      $Res Function(
              CommandExecutionAskingForConfirmation<Command, Response, Error,
                  ValidationError>)
          _then) = _$CommandExecutionAskingForConfirmationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Command command,
      CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class _$CommandExecutionAskingForConfirmationCopyWithImpl<Command, Response,
        Error, ValidationError, $Res>
    implements
        $CommandExecutionAskingForConfirmationCopyWith<Command, Response, Error,
            ValidationError, $Res> {
  _$CommandExecutionAskingForConfirmationCopyWithImpl(this._self, this._then);

  final CommandExecutionAskingForConfirmation<Command, Response, Error,
      ValidationError> _self;
  final $Res Function(
      CommandExecutionAskingForConfirmation<Command, Response, Error,
          ValidationError>) _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? command = freezed,
    Object? previousState = null,
  }) {
    return _then(CommandExecutionAskingForConfirmation<Command, Response, Error,
        ValidationError>(
      command: freezed == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as Command,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState {
    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandExecuting<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandExecuting({required this.previousState});

  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandExecutingCopyWith<Command, Response, Error, ValidationError,
          CommandExecuting<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandExecutingCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              CommandExecuting<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandExecuting<Command, Response, Error,
                ValidationError> &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.executing(previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandExecutingCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandExecutingCopyWith(
      CommandExecuting<Command, Response, Error, ValidationError> value,
      $Res Function(CommandExecuting<Command, Response, Error, ValidationError>)
          _then) = _$CommandExecutingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class _$CommandExecutingCopyWithImpl<Command, Response, Error, ValidationError,
        $Res>
    implements
        $CommandExecutingCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  _$CommandExecutingCopyWithImpl(this._self, this._then);

  final CommandExecuting<Command, Response, Error, ValidationError> _self;
  final $Res Function(
      CommandExecuting<Command, Response, Error, ValidationError>) _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? previousState = null,
  }) {
    return _then(CommandExecuting<Command, Response, Error, ValidationError>(
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState {
    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandValidationFailed<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandValidationFailed(
      {required this.validationError, required this.previousState});

  final ValidationError validationError;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandValidationFailedCopyWith<Command, Response, Error, ValidationError,
          CommandValidationFailed<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandValidationFailedCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          CommandValidationFailed<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandValidationFailed<Command, Response, Error,
                ValidationError> &&
            const DeepCollectionEquality()
                .equals(other.validationError, validationError) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(validationError), previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.validationFailed(validationError: $validationError, previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandValidationFailedCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandValidationFailedCopyWith(
      CommandValidationFailed<Command, Response, Error, ValidationError> value,
      $Res Function(
              CommandValidationFailed<Command, Response, Error,
                  ValidationError>)
          _then) = _$CommandValidationFailedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ValidationError validationError,
      CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class _$CommandValidationFailedCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandValidationFailedCopyWith<Command, Response, Error,
            ValidationError, $Res> {
  _$CommandValidationFailedCopyWithImpl(this._self, this._then);

  final CommandValidationFailed<Command, Response, Error, ValidationError>
      _self;
  final $Res Function(
      CommandValidationFailed<Command, Response, Error, ValidationError>) _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? validationError = freezed,
    Object? previousState = null,
  }) {
    return _then(
        CommandValidationFailed<Command, Response, Error, ValidationError>(
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as ValidationError,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState {
    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class CommandFailed<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  CommandFailed({required this.error, required this.previousState});

  final Error error;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandFailedCopyWith<Command, Response, Error, ValidationError,
          CommandFailed<Command, Response, Error, ValidationError>>
      get copyWith => _$CommandFailedCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              CommandFailed<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandFailed<Command, Response, Error, ValidationError> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), previousState);

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.failed(error: $error, previousState: $previousState)';
  }
}

/// @nodoc
abstract mixin class $CommandFailedCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory $CommandFailedCopyWith(
      CommandFailed<Command, Response, Error, ValidationError> value,
      $Res Function(CommandFailed<Command, Response, Error, ValidationError>)
          _then) = _$CommandFailedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Error error,
      CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class _$CommandFailedCopyWithImpl<Command, Response, Error, ValidationError,
        $Res>
    implements
        $CommandFailedCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  _$CommandFailedCopyWithImpl(this._self, this._then);

  final CommandFailed<Command, Response, Error, ValidationError> _self;
  final $Res Function(CommandFailed<Command, Response, Error, ValidationError>)
      _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
    Object? previousState = null,
  }) {
    return _then(CommandFailed<Command, Response, Error, ValidationError>(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ));
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState {
    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }
}

// dart format on
