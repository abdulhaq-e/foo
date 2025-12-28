import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/core.dart';

class TriggeredCommandExecutor<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget Function(BuildContext context, FutureOr<void> Function() execute)
  builder;
  final FutureOr<Command> Function() commandBuilder;
  final FutureOr<void> Function(BuildContext p1, Response p2) onSuccess;
  final FutureOr<void> Function(BuildContext p1, Error p2) onError;
  final FutureOr<void> Function(BuildContext) onCancel;
  final bool shouldShowOperationSuccess;
  final bool shouldShowOperationFailure;
  final bool shouldAskForConfirmation;
  final String? confirmationDialogTitle;
  final String? confirmationDialogContent;
  final String? customErrorMessage;

  const TriggeredCommandExecutor({
    required this.builder,
    required this.commandBuilder,
    required this.onSuccess,
    required this.onError,
    required this.onCancel,
    this.confirmationDialogTitle,
    this.confirmationDialogContent,
    this.customErrorMessage,
    this.shouldAskForConfirmation = false,
    this.shouldShowOperationSuccess = true,
    this.shouldShowOperationFailure = true,
    // ... other params ...
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context
        .read<
          CommandBloc<Command, Response, Error, ValidationError>
        >(); // Lookup

    Future<void> executeAction() async {
      final command = await commandBuilder();
      if (shouldAskForConfirmation) {
        bloc.add(CommandExecutionRequested<Command>(command: command));
      } else {
        bloc.add(CommandExecutionStarted<Command>(command: command));
      }
    }

    return CommandView2<Command, Response, Error, ValidationError>(
      childBuilder: (context, _) => builder(context, executeAction),
      onExecuting: (context) async {},
      onSucceeded: (context, data) async {
        if (shouldShowOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Operation successful!')),
          );
        }
        await onSuccess(context, data);
      },
      onError: (context, error) async {
        if (shouldShowOperationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(customErrorMessage ?? 'Oops, operation failed!'),
            ),
          );
        }
        await onError(context, error);
      },
      onCancel: (context) async {
        await onCancel(context);
      },
      onStateChange: (context, previousState, newState) async {
        switch (previousState) {
          case CommandExecuting():
            // one for the dialog, another for the modal hosting the dialog
            // Navigator.of(context, rootNavigator: true).pop();
            // Navigator.of(context, rootNavigator: true).pop();
            break;
          default:
        }
      },
      confirmationDialogContent: confirmationDialogContent,
      confirmationDialogTitle: confirmationDialogTitle,
    );
  }
}

// Usage:
// TriggeredCommandExecutor<MyCommand, ...>(
//   bloc: context.read<CommandBloc<MyCommand, ...>>(),
//   commandBuilder: () => MyCommand(param: _controller.text),
//   shouldAskForConfirmation: true,
//   onSuccess: (ctx, resp) => Navigator.pop(ctx),
//   onError: (ctx, err) => print("Error! $err"),
//   builder: (context, executeCallback) {
//     // Get loading state if needed:
//     // final isLoading = context.select((CommandBloc<MyCommand,..> b) => b.state is CommandExecuting);
//     return ElevatedButton(
//       onPressed: executeCallback, // isLoading ? null : executeCallback,
//       child: Text("Do Action"),
//     );
//   },
// )
