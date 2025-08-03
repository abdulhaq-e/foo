part of 'command.bloc.dart';

@Freezed(genericArgumentFactories: true)
sealed class CommandState<Command, Response, Error, ValidationError>
    with _$CommandState<Command, Response, Error, ValidationError> {
  factory CommandState.initial(
      {required CommandState<Command, Response, Error, ValidationError>?
          previousState}) = CommandInitial;
  factory CommandState.succeeded(
      {required Response response,
      required CommandState<Command, Response, Error, ValidationError>
          previousState}) = CommandSucceeded;
  factory CommandState.askingForConfirmation(
      {required Command command,
      required CommandState<Command, Response, Error, ValidationError>
          previousState}) = CommandExecutionAskingForConfirmation;
  factory CommandState.executing(
      {required CommandState<Command, Response, Error, ValidationError>
          previousState}) = CommandExecuting;
  factory CommandState.validationFailed(
      {required ValidationError validationError,
      required CommandState<Command, Response, Error, ValidationError>
          previousState}) = CommandValidationFailed;
  factory CommandState.failed(
      {required Error error,
      required CommandState<Command, Response, Error, ValidationError>
          previousState}) = CommandFailed;
}
