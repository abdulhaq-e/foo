import 'dart:async';

import 'package:foo/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommandView2<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget Function(BuildContext, Widget)? containerBuilder;
  final Widget Function(
    BuildContext,
    CommandState<Command, Response, Error, ValidationError>,
  )
  childBuilder;
  final Widget Function(BuildContext)? executingChildBuilder;
  final Future<void> Function(BuildContext) _onExecuting;
  final Future<void> Function(BuildContext) _onInit;
  final Future<void> Function(BuildContext) _onCancel;
  final Future<void> Function(BuildContext, Response) _onSucceeded;
  final Future<void> Function(BuildContext, Error) _onError;
  final Future<void> Function(BuildContext, ValidationError) _onValidationError;
  final Future<void> Function(
    BuildContext,
    CommandState<Command, Response, Error, ValidationError>? previusState,
    CommandState<Command, Response, Error, ValidationError> newState,
  )
  _onStateChange;
  final String _confirmationDialogTitle;
  final String _confirmationDialogContent;

  CommandView2({
    Key? key,
    required this.childBuilder,
    this.executingChildBuilder,
    this.containerBuilder,
    Future<void> Function(BuildContext)? onExecuting,
    Future<void> Function(BuildContext)? onInit,
    Future<void> Function(BuildContext)? onCancel,
    Future<void> Function(BuildContext, Response)? onSucceeded,
    Future<void> Function(BuildContext, Error)? onError,
    Future<void> Function(BuildContext, ValidationError)? onValidationError,
    Future<void> Function(
      BuildContext,
      CommandState<Command, Response, Error, ValidationError>? previusState,
      CommandState<Command, Response, Error, ValidationError> newState,
    )?
    onStateChange,
    String? confirmationDialogTitle,
    String? confirmationDialogContent,
  }) : _onExecuting = onExecuting ?? ((_) async {}),
       _onInit = onInit ?? ((_) async {}),
       _onCancel = onCancel ?? ((_) async {}),
       _onSucceeded = onSucceeded ?? ((_, __) async {}),
       _onError = onError ?? ((_, __) async {}),
       _onValidationError = onValidationError ?? ((_, __) async {}),
       _onStateChange = onStateChange ?? ((_, __, ___) async {}),
       _confirmationDialogTitle =
           confirmationDialogTitle ?? "Operation Confirmation",
       _confirmationDialogContent =
           confirmationDialogContent ?? "Do you want to process the operation?";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      CommandBloc<Command, Response, Error, ValidationError>,
      CommandState<Command, Response, Error, ValidationError>
    >(
      listener: (context, state) async {
        await _onStateChange(context, state.previousState, state);
        switch (state) {
          case CommandInitial():
            await _onInit(context);
          case CommandExecuting<Command, Response, Error, ValidationError>():
            await _onExecuting(context);
          case CommandFailed<Command, Response, Error, ValidationError>(
            error: var error,
          ):
            await _onError(context, error);
          case CommandSucceeded<Command, Response, Error, ValidationError>(
            response: var response,
          ):
            await _onSucceeded(context, response);
          case CommandValidationFailed(validationError: var validationError):
            await _onValidationError(context, validationError);

          case CommandExecutionAskingForConfirmation(command: var command):
            var confirmed = await _confirmtion_dialog(context);
            if (confirmed != null && confirmed) {
              context
                  .read<
                    CommandBloc<Command, Response, Error, ValidationError>
                  >()
                  .add(CommandExecutionStarted(command: command));
            } else {
              context
                  .read<
                    CommandBloc<Command, Response, Error, ValidationError>
                  >()
                  .add(CommandReset<Command>());
              await _onCancel(context);
            }

          default:
        }
      },
      builder:
          (
            context,
            CommandState<Command, Response, Error, ValidationError> state,
          ) {
            late Widget child;
            switch (state) {
              case CommandInitial<Command, Response, Error, ValidationError>():
                child = childBuilder(context, state);
              case CommandExecuting<
                Command,
                Response,
                Error,
                ValidationError
              >():
                if (executingChildBuilder != null) {
                  child = executingChildBuilder!(context);
                } else {
                  child = childBuilder(context, state);
                }

              default:
                child = childBuilder(context, state);
            }
            if (containerBuilder != null) {
              return containerBuilder!(context, child);
            }

            return child;
          },
    );
  }

  Future<bool?> _confirmtion_dialog(BuildContext context) async {
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext c) => AlertDialog(
        title: Text(_confirmationDialogTitle),
        content: Text(_confirmationDialogContent),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
