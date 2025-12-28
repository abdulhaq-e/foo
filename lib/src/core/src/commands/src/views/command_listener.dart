import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/core.dart';

typedef CommandSucceededCallback<Response> =
    FutureOr<void> Function(BuildContext context, Response response);
typedef CommandFailedCallback<Error> =
    FutureOr<void> Function(BuildContext context, Error error);
typedef CommandValidationErrorCallback<ValidationError> =
    FutureOr<void> Function(BuildContext context, ValidationError error);
typedef CommandConfirmationCallback<Command> =
    FutureOr<void> Function(BuildContext context, Command command);

class CommandListener<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget child;
  final CommandSucceededCallback<Response>? onSucceeded;
  final CommandFailedCallback<Error>? onError;
  final CommandValidationErrorCallback<ValidationError>? onValidationError;
  final CommandConfirmationCallback<Command>? onConfirmationRequested;
  // Add other callbacks as needed (onValidationFailed, onCancel, etc.)

  const CommandListener({
    Key? key,
    required this.child,
    this.onSucceeded,
    this.onError,
    this.onValidationError,
    this.onConfirmationRequested,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      CommandBloc<Command, Response, Error, ValidationError>,
      CommandState<Command, Response, Error, ValidationError>
    >(
      listener: (context, state) {
        switch (state) {
          case CommandSucceeded(response: final response):
            onSucceeded?.call(context, response);
            break;
          case CommandFailed(error: final error):
            onError?.call(context, error);
            break;
          case CommandValidationFailed(validationError: final validationError):
            onValidationError?.call(context, validationError);
            break;
          case CommandExecutionAskingForConfirmation(command: final command):
            onConfirmationRequested?.call(context, command);
            break;
          default:
            break;
        }
      },
      child: child,
    );
  }
}
