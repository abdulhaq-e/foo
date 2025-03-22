import 'package:foo/src/commands/commands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommandView<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget Function(BuildContext) defaultWidgetBuilder;
  final Widget Function(BuildContext)? executingWidgetBuilder;
  final void Function(BuildContext) _onExecuting;
  final void Function(BuildContext) _onCancel;
  final void Function(BuildContext, Response) _onSucceeded;
  final void Function(BuildContext, Error) _onError;
  final void Function(BuildContext, ValidationError) _onValidationError;
  CommandView({
    Key? key,
    required this.defaultWidgetBuilder,
    this.executingWidgetBuilder,
    void Function(BuildContext)? onExecuting,
    void Function(BuildContext)? onCancel,
    void Function(BuildContext, Response)? onSucceeded,
    void Function(BuildContext, Error)? onError,
    void Function(BuildContext, ValidationError)? onValidationError,
  })  : _onExecuting = onExecuting ?? ((_) {}),
        _onCancel = onCancel ?? ((_) {}),
        _onSucceeded = onSucceeded ?? ((_, __) {}),
        _onError = onError ?? ((_, __) {}),
        _onValidationError = onValidationError ?? ((_, __) {});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommandBloc<Command, Response, Error, ValidationError>,
            CommandState<Command, Response, Error, ValidationError>>(
        listener: (context, state) {
      state.whenOrNull(validationFailed: (validationError, _) {
        _onValidationError(context, validationError);
      }, executing: (_) {
        _onExecuting(context);
      }, failed: (error, _) {
        _onError(context, error);
      }, succeeded: (response, _) {
        _onSucceeded(context, response);
      }, askingForConfirmation: (command, _) async {
        var confirmed = await _confirmtion_dialog(context);
        if (confirmed != null && confirmed) {
          context
              .read<CommandBloc<Command, Response, Error, ValidationError>>()
              .add(CommandExecutionStarted(command: command));
        } else {
          _onCancel(context);
        }
      });
    }, builder: (context, state) {
      return state.map(
          validationFailed: (_) => defaultWidgetBuilder(context),
          initial: (_) => defaultWidgetBuilder(context),
          askingForConfirmation: (_) => defaultWidgetBuilder(context),
          executing: (_) {
            if (executingWidgetBuilder != null) {
              return executingWidgetBuilder!(context);
            }

            return defaultWidgetBuilder(context);
          },
          failed: (state) {
            return Container();
            return defaultWidgetBuilder(context);
          },
          succeeded: (state) {
            return Container();
            return defaultWidgetBuilder(context);
          });
    });
  }

  Future<bool?> _confirmtion_dialog(BuildContext context) async {
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext c) => AlertDialog(
        title: const Text('Operation Confirmation'),
        content: const Text('Do you want to process the operation?'),
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
