import 'package:bloc/bloc.dart';
import 'package:foo/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.state.dart';
part 'command.events.dart';

part 'command.bloc.freezed.dart';

typedef ErrorHandling<Error> = Future<Error> Function(Object);
typedef ValidationHandling<Command, ValidationError> = Future<ValidationError?>
    Function(Command);

class CommandBloc<Command, Response, Error, ValidationError> extends Bloc<
    CommandEvent, CommandState<Command, Response, Error, ValidationError>> {
  final CommandHandling<Command, Response> _commandHandler;
  final ErrorHandling<Error> _errorHandler;
  final ValidationHandling<Command, ValidationError> _validationHandler;

  CommandBloc(
      {required CommandHandling<Command, Response> commandHandler,
      required ErrorHandling<Error> errorHandler,
      ValidationHandling<Command, ValidationError>? validationHandler})
      : _commandHandler = commandHandler,
        _errorHandler = errorHandler,
        _validationHandler =
            validationHandler != null ? validationHandler : ((_) async {}),
        super(CommandState.initial(previousState: null)) {
    on<CommandExecutionStarted<Command>>(
        (event, emit) => _executeCommand(event, emit));
    on<CommandExecutionRequested<Command>>(
        (event, emit) => _executionRequestedCommand(event, emit));
    on<CommandReset<Command>>((event, emit) => _resetCommand(event, emit));
  }

  Future<void> _resetCommand(CommandReset<Command> event, emit) async {
    emit(CommandState<Command, Response, Error, ValidationError>.initial(
        previousState: state));
  }

  Future<void> _executionRequestedCommand(
      CommandExecutionRequested<Command> event, emit) async {
    emit(CommandState<Command, Response, Error,
            ValidationError>.askingForConfirmation(
        command: event.command, previousState: state));
  }

  Future<void> _executeCommand(
      CommandExecutionStarted<Command> event, emit) async {
    final validationError = await _validationHandler(event.command);
    if (validationError != null) {
      emit(CommandState<Command, Response, Error,
              ValidationError>.validationFailed(
          validationError: validationError, previousState: state));
      return;
    }
    emit(CommandState<Command, Response, Error, ValidationError>.executing(
        previousState: state));
    try {
      var response = await _runCommandHandler(event.command);
      emit(CommandState<Command, Response, Error, ValidationError>.succeeded(
          response: response, previousState: state));
    } catch (e) {
      final error = await _errorHandler(e);
      emit(CommandState<Command, Response, Error, ValidationError>.failed(
          error: error, previousState: state));
    }
  }

  Future<Response> _runCommandHandler(Command command) async {
    return this._commandHandler(command);
  }
}
