import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/core.dart';

class CommandButton<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  const CommandButton({
    super.key,
    required this.command,
    required this.child,
    required this.buttonBuilder,
    this.loadingChild,
    this.askForConfirmation = false,
  });
  final Command command;
  final Widget child;
  final Widget? loadingChild;
  final Widget Function(
    BuildContext context,
    VoidCallback? onPressed,
    Widget child,
  )
  buttonBuilder;
  final bool askForConfirmation;

  @override
  Widget build(BuildContext context) {
    final bloc = context
        .read<CommandBloc<Command, Response, Error, ValidationError>>();

    return CommandBuilder<Command, Response, Error, ValidationError>(
      builder: (context, state) {
        final isLoading = state is CommandExecuting;

        final onPressed = isLoading
            ? null
            : () {
                if (askForConfirmation) {
                  bloc.add(CommandExecutionRequested(command: command));
                } else {
                  bloc.add(CommandExecutionStarted(command: command));
                }
              };

        final currentChild = isLoading
            ? (loadingChild ??
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ))
            : child;

        return buttonBuilder(context, onPressed, currentChild);
      },
    );
  }
}
