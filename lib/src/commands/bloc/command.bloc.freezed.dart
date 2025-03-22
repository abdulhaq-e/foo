// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommandState<Command, Response, Error, ValidationError> {
  CommandState<Command, Response, Error, ValidationError>? get previousState =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommandStateCopyWith<Command, Response, Error, ValidationError,
          CommandState<Command, Response, Error, ValidationError>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandStateCopyWith<Command, Response, Error, ValidationError,
    $Res> {
  factory $CommandStateCopyWith(
      CommandState<Command, Response, Error, ValidationError> value,
      $Res Function(CommandState<Command, Response, Error, ValidationError>)
          then) = _$CommandStateCopyWithImpl<
      Command,
      Response,
      Error,
      ValidationError,
      $Res,
      CommandState<Command, Response, Error, ValidationError>>;
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError> previousState});

  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState;
}

/// @nodoc
class _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        $Val extends CommandState<Command, Response, Error, ValidationError>>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  _$CommandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = null,
  }) {
    return _then(_value.copyWith(
      previousState: null == previousState
          ? _value.previousState!
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>,
    ) as $Val);
  }

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState {
    if (_value.previousState == null) {
      return null;
    }

    return $CommandStateCopyWith<Command, Response, Error, ValidationError,
        $Res>(_value.previousState!, (value) {
      return _then(_value.copyWith(previousState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommandInitialImplCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandInitialImplCopyWith(
      _$CommandInitialImpl<Command, Response, Error, ValidationError> value,
      $Res Function(
              _$CommandInitialImpl<Command, Response, Error, ValidationError>)
          then) = __$$CommandInitialImplCopyWithImpl<Command, Response, Error,
      ValidationError, $Res>;
  @override
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError>? previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>?
      get previousState;
}

/// @nodoc
class __$$CommandInitialImplCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandInitialImpl<Command, Response, Error, ValidationError>>
    implements
        _$$CommandInitialImplCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  __$$CommandInitialImplCopyWithImpl(
      _$CommandInitialImpl<Command, Response, Error, ValidationError> _value,
      $Res Function(
              _$CommandInitialImpl<Command, Response, Error, ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = freezed,
  }) {
    return _then(
        _$CommandInitialImpl<Command, Response, Error, ValidationError>(
      previousState: freezed == previousState
          ? _value.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as CommandState<Command, Response, Error, ValidationError>?,
    ));
  }
}

/// @nodoc

class _$CommandInitialImpl<Command, Response, Error, ValidationError>
    implements CommandInitial<Command, Response, Error, ValidationError> {
  _$CommandInitialImpl({required this.previousState});

  @override
  final CommandState<Command, Response, Error, ValidationError>? previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.initial(previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandInitialImpl<Command, Response, Error,
                ValidationError> &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandInitialImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandInitialImpl<Command, Response, Error, ValidationError>>
      get copyWith => __$$CommandInitialImplCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              _$CommandInitialImpl<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return initial(previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return initial?.call(previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CommandInitial<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandInitial(
      {required final CommandState<Command, Response, Error, ValidationError>?
          previousState}) = _$CommandInitialImpl<Command, Response, Error,
      ValidationError>;

  @override
  CommandState<Command, Response, Error, ValidationError>? get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandInitialImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandInitialImpl<Command, Response, Error, ValidationError>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandSucceededImplCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandSucceededImplCopyWith(
      _$CommandSucceededImpl<Command, Response, Error, ValidationError> value,
      $Res Function(
              _$CommandSucceededImpl<Command, Response, Error, ValidationError>)
          then) = __$$CommandSucceededImplCopyWithImpl<Command, Response, Error,
      ValidationError, $Res>;
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
class __$$CommandSucceededImplCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandSucceededImpl<Command, Response, Error, ValidationError>>
    implements
        _$$CommandSucceededImplCopyWith<Command, Response, Error,
            ValidationError, $Res> {
  __$$CommandSucceededImplCopyWithImpl(
      _$CommandSucceededImpl<Command, Response, Error, ValidationError> _value,
      $Res Function(
              _$CommandSucceededImpl<Command, Response, Error, ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? previousState = null,
  }) {
    return _then(
        _$CommandSucceededImpl<Command, Response, Error, ValidationError>(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
      previousState: null == previousState
          ? _value.previousState
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
        $Res>(_value.previousState, (value) {
      return _then(_value.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class _$CommandSucceededImpl<Command, Response, Error, ValidationError>
    implements CommandSucceeded<Command, Response, Error, ValidationError> {
  _$CommandSucceededImpl({required this.response, required this.previousState});

  @override
  final Response response;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.succeeded(response: $response, previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandSucceededImpl<Command, Response, Error,
                ValidationError> &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(response), previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandSucceededImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandSucceededImpl<Command, Response, Error, ValidationError>>
      get copyWith => __$$CommandSucceededImplCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          _$CommandSucceededImpl<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return succeeded(response, previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return succeeded?.call(response, previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(response, previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class CommandSucceeded<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandSucceeded(
          {required final Response response,
          required final CommandState<Command, Response, Error, ValidationError>
              previousState}) =
      _$CommandSucceededImpl<Command, Response, Error, ValidationError>;

  Response get response;
  @override
  CommandState<Command, Response, Error, ValidationError> get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandSucceededImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandSucceededImpl<Command, Response, Error, ValidationError>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandExecutionAskingForConfirmationImplCopyWith<Command,
        Response, Error, ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandExecutionAskingForConfirmationImplCopyWith(
      _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
              ValidationError>
          value,
      $Res Function(
              _$CommandExecutionAskingForConfirmationImpl<Command, Response,
                  Error, ValidationError>)
          then) = __$$CommandExecutionAskingForConfirmationImplCopyWithImpl<
      Command, Response, Error, ValidationError, $Res>;
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
class __$$CommandExecutionAskingForConfirmationImplCopyWithImpl<Command,
        Response, Error, ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
            ValidationError>>
    implements
        _$$CommandExecutionAskingForConfirmationImplCopyWith<Command, Response,
            Error, ValidationError, $Res> {
  __$$CommandExecutionAskingForConfirmationImplCopyWithImpl(
      _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
              ValidationError>
          _value,
      $Res Function(
              _$CommandExecutionAskingForConfirmationImpl<Command, Response,
                  Error, ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = freezed,
    Object? previousState = null,
  }) {
    return _then(_$CommandExecutionAskingForConfirmationImpl<Command, Response,
        Error, ValidationError>(
      command: freezed == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as Command,
      previousState: null == previousState
          ? _value.previousState
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
        $Res>(_value.previousState, (value) {
      return _then(_value.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
        ValidationError>
    implements
        CommandExecutionAskingForConfirmation<Command, Response, Error,
            ValidationError> {
  _$CommandExecutionAskingForConfirmationImpl(
      {required this.command, required this.previousState});

  @override
  final Command command;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.askingForConfirmation(command: $command, previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandExecutionAskingForConfirmationImpl<Command,
                Response, Error, ValidationError> &&
            const DeepCollectionEquality().equals(other.command, command) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(command), previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandExecutionAskingForConfirmationImplCopyWith<
      Command,
      Response,
      Error,
      ValidationError,
      _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
          ValidationError>> get copyWith =>
      __$$CommandExecutionAskingForConfirmationImplCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return askingForConfirmation(command, previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return askingForConfirmation?.call(command, previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (askingForConfirmation != null) {
      return askingForConfirmation(command, previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return askingForConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return askingForConfirmation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (askingForConfirmation != null) {
      return askingForConfirmation(this);
    }
    return orElse();
  }
}

abstract class CommandExecutionAskingForConfirmation<Command, Response, Error,
        ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandExecutionAskingForConfirmation(
      {required final Command command,
      required final CommandState<Command, Response, Error, ValidationError>
          previousState}) = _$CommandExecutionAskingForConfirmationImpl<Command,
      Response, Error, ValidationError>;

  Command get command;
  @override
  CommandState<Command, Response, Error, ValidationError> get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandExecutionAskingForConfirmationImplCopyWith<
      Command,
      Response,
      Error,
      ValidationError,
      _$CommandExecutionAskingForConfirmationImpl<Command, Response, Error,
          ValidationError>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandExecutingImplCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandExecutingImplCopyWith(
      _$CommandExecutingImpl<Command, Response, Error, ValidationError> value,
      $Res Function(
              _$CommandExecutingImpl<Command, Response, Error, ValidationError>)
          then) = __$$CommandExecutingImplCopyWithImpl<Command, Response, Error,
      ValidationError, $Res>;
  @override
  @useResult
  $Res call(
      {CommandState<Command, Response, Error, ValidationError> previousState});

  @override
  $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res>
      get previousState;
}

/// @nodoc
class __$$CommandExecutingImplCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandExecutingImpl<Command, Response, Error, ValidationError>>
    implements
        _$$CommandExecutingImplCopyWith<Command, Response, Error,
            ValidationError, $Res> {
  __$$CommandExecutingImplCopyWithImpl(
      _$CommandExecutingImpl<Command, Response, Error, ValidationError> _value,
      $Res Function(
              _$CommandExecutingImpl<Command, Response, Error, ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousState = null,
  }) {
    return _then(
        _$CommandExecutingImpl<Command, Response, Error, ValidationError>(
      previousState: null == previousState
          ? _value.previousState
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
        $Res>(_value.previousState, (value) {
      return _then(_value.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class _$CommandExecutingImpl<Command, Response, Error, ValidationError>
    implements CommandExecuting<Command, Response, Error, ValidationError> {
  _$CommandExecutingImpl({required this.previousState});

  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.executing(previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandExecutingImpl<Command, Response, Error,
                ValidationError> &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandExecutingImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandExecutingImpl<Command, Response, Error, ValidationError>>
      get copyWith => __$$CommandExecutingImplCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          _$CommandExecutingImpl<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return executing(previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return executing?.call(previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (executing != null) {
      return executing(previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return executing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return executing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (executing != null) {
      return executing(this);
    }
    return orElse();
  }
}

abstract class CommandExecuting<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandExecuting(
      {required final CommandState<Command, Response, Error, ValidationError>
          previousState}) = _$CommandExecutingImpl<Command, Response, Error,
      ValidationError>;

  @override
  CommandState<Command, Response, Error, ValidationError> get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandExecutingImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandExecutingImpl<Command, Response, Error, ValidationError>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandValidationFailedImplCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandValidationFailedImplCopyWith(
      _$CommandValidationFailedImpl<Command, Response, Error, ValidationError>
          value,
      $Res Function(
              _$CommandValidationFailedImpl<Command, Response, Error,
                  ValidationError>)
          then) = __$$CommandValidationFailedImplCopyWithImpl<Command, Response,
      Error, ValidationError, $Res>;
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
class __$$CommandValidationFailedImplCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandValidationFailedImpl<Command, Response, Error,
            ValidationError>>
    implements
        _$$CommandValidationFailedImplCopyWith<Command, Response, Error,
            ValidationError, $Res> {
  __$$CommandValidationFailedImplCopyWithImpl(
      _$CommandValidationFailedImpl<Command, Response, Error, ValidationError>
          _value,
      $Res Function(
              _$CommandValidationFailedImpl<Command, Response, Error,
                  ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validationError = freezed,
    Object? previousState = null,
  }) {
    return _then(_$CommandValidationFailedImpl<Command, Response, Error,
        ValidationError>(
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as ValidationError,
      previousState: null == previousState
          ? _value.previousState
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
        $Res>(_value.previousState, (value) {
      return _then(_value.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class _$CommandValidationFailedImpl<Command, Response, Error, ValidationError>
    implements
        CommandValidationFailed<Command, Response, Error, ValidationError> {
  _$CommandValidationFailedImpl(
      {required this.validationError, required this.previousState});

  @override
  final ValidationError validationError;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.validationFailed(validationError: $validationError, previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandValidationFailedImpl<Command, Response, Error,
                ValidationError> &&
            const DeepCollectionEquality()
                .equals(other.validationError, validationError) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(validationError), previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandValidationFailedImplCopyWith<
      Command,
      Response,
      Error,
      ValidationError,
      _$CommandValidationFailedImpl<Command, Response, Error,
          ValidationError>> get copyWith =>
      __$$CommandValidationFailedImplCopyWithImpl<
          Command,
          Response,
          Error,
          ValidationError,
          _$CommandValidationFailedImpl<Command, Response, Error,
              ValidationError>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return validationFailed(validationError, previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return validationFailed?.call(validationError, previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (validationFailed != null) {
      return validationFailed(validationError, previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return validationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return validationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (validationFailed != null) {
      return validationFailed(this);
    }
    return orElse();
  }
}

abstract class CommandValidationFailed<Command, Response, Error,
        ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandValidationFailed(
          {required final ValidationError validationError,
          required final CommandState<Command, Response, Error, ValidationError>
              previousState}) =
      _$CommandValidationFailedImpl<Command, Response, Error, ValidationError>;

  ValidationError get validationError;
  @override
  CommandState<Command, Response, Error, ValidationError> get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandValidationFailedImplCopyWith<
      Command,
      Response,
      Error,
      ValidationError,
      _$CommandValidationFailedImpl<Command, Response, Error,
          ValidationError>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandFailedImplCopyWith<Command, Response, Error,
        ValidationError, $Res>
    implements
        $CommandStateCopyWith<Command, Response, Error, ValidationError, $Res> {
  factory _$$CommandFailedImplCopyWith(
      _$CommandFailedImpl<Command, Response, Error, ValidationError> value,
      $Res Function(
              _$CommandFailedImpl<Command, Response, Error, ValidationError>)
          then) = __$$CommandFailedImplCopyWithImpl<Command, Response, Error,
      ValidationError, $Res>;
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
class __$$CommandFailedImplCopyWithImpl<Command, Response, Error,
        ValidationError, $Res>
    extends _$CommandStateCopyWithImpl<
        Command,
        Response,
        Error,
        ValidationError,
        $Res,
        _$CommandFailedImpl<Command, Response, Error, ValidationError>>
    implements
        _$$CommandFailedImplCopyWith<Command, Response, Error, ValidationError,
            $Res> {
  __$$CommandFailedImplCopyWithImpl(
      _$CommandFailedImpl<Command, Response, Error, ValidationError> _value,
      $Res Function(
              _$CommandFailedImpl<Command, Response, Error, ValidationError>)
          _then)
      : super(_value, _then);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? previousState = null,
  }) {
    return _then(_$CommandFailedImpl<Command, Response, Error, ValidationError>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
      previousState: null == previousState
          ? _value.previousState
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
        $Res>(_value.previousState, (value) {
      return _then(_value.copyWith(previousState: value));
    });
  }
}

/// @nodoc

class _$CommandFailedImpl<Command, Response, Error, ValidationError>
    implements CommandFailed<Command, Response, Error, ValidationError> {
  _$CommandFailedImpl({required this.error, required this.previousState});

  @override
  final Error error;
  @override
  final CommandState<Command, Response, Error, ValidationError> previousState;

  @override
  String toString() {
    return 'CommandState<$Command, $Response, $Error, $ValidationError>.failed(error: $error, previousState: $previousState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandFailedImpl<Command, Response, Error,
                ValidationError> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), previousState);

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandFailedImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandFailedImpl<Command, Response, Error, ValidationError>>
      get copyWith => __$$CommandFailedImplCopyWithImpl<
              Command,
              Response,
              Error,
              ValidationError,
              _$CommandFailedImpl<Command, Response, Error, ValidationError>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)
        initial,
    required TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        succeeded,
    required TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        askingForConfirmation,
    required TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        executing,
    required TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        validationFailed,
    required TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)
        failed,
  }) {
    return failed(error, previousState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult? Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult? Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult? Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult? Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult? Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
  }) {
    return failed?.call(error, previousState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>?
                previousState)?
        initial,
    TResult Function(
            Response response,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        succeeded,
    TResult Function(
            Command command,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        askingForConfirmation,
    TResult Function(
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        executing,
    TResult Function(
            ValidationError validationError,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        validationFailed,
    TResult Function(
            Error error,
            CommandState<Command, Response, Error, ValidationError>
                previousState)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error, previousState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)
        initial,
    required TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)
        succeeded,
    required TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)
        askingForConfirmation,
    required TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)
        executing,
    required TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)
        validationFailed,
    required TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)
        failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult? Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult? Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult? Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult? Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult? Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            CommandInitial<Command, Response, Error, ValidationError> value)?
        initial,
    TResult Function(
            CommandSucceeded<Command, Response, Error, ValidationError> value)?
        succeeded,
    TResult Function(
            CommandExecutionAskingForConfirmation<Command, Response, Error,
                    ValidationError>
                value)?
        askingForConfirmation,
    TResult Function(
            CommandExecuting<Command, Response, Error, ValidationError> value)?
        executing,
    TResult Function(
            CommandValidationFailed<Command, Response, Error, ValidationError>
                value)?
        validationFailed,
    TResult Function(
            CommandFailed<Command, Response, Error, ValidationError> value)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class CommandFailed<Command, Response, Error, ValidationError>
    implements CommandState<Command, Response, Error, ValidationError> {
  factory CommandFailed(
          {required final Error error,
          required final CommandState<Command, Response, Error, ValidationError>
              previousState}) =
      _$CommandFailedImpl<Command, Response, Error, ValidationError>;

  Error get error;
  @override
  CommandState<Command, Response, Error, ValidationError> get previousState;

  /// Create a copy of CommandState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandFailedImplCopyWith<Command, Response, Error, ValidationError,
          _$CommandFailedImpl<Command, Response, Error, ValidationError>>
      get copyWith => throw _privateConstructorUsedError;
}
