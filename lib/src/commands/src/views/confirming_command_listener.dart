import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/src/commands/commands.dart';
import 'package:foo/src/commands/src/views/command_listener.dart';

class ConfirmingCommandListener<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  const ConfirmingCommandListener({
    super.key,
    required this.child,
    this.title = 'Please Confirm',
    this.content = 'Are you sure you want to proceed?',
    this.onSucceeded,
    this.onError,
    this.onValidationError,
  });
  final Widget child;
  final String title;
  final String content;
  final CommandSucceededCallback<Response>? onSucceeded;
  final CommandFailedCallback<Error>? onError;
  final CommandValidationErrorCallback<ValidationError>? onValidationError;

  @override
  Widget build(BuildContext context) {
    final bloc = context
        .read<CommandBloc<Command, Response, Error, ValidationError>>();

    return CommandListener<Command, Response, Error, ValidationError>(
      onConfirmationRequested: (context, command) async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(c, true),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        if (confirmed ?? false) {
          bloc.add(CommandExecutionStarted(command: command));
        } else {
          bloc.add(CommandReset<Command>());
        }
      },
      onSucceeded: onSucceeded,
      onError: onError,
      onValidationError: onValidationError,
      child: child,
    );
  }
}
