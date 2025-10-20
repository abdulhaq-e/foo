import 'package:flutter/material.dart';

class SnackBarCommandListener<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget child;
  final String successMessage;
  final String?
  failureMessagePrefix; // Optional for more specific error messages
  final void Function(BuildContext context, Response response)? onSucceeded;
  final void Function(BuildContext context, Error error)? onError;

  const SnackBarCommandListener({
    Key? key,
    required this.child,
    this.successMessage = 'Operation successful!',
    this.failureMessagePrefix = 'Operation failed: ',
    this.onSucceeded,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommandListener<Command, Response, Error, ValidationError>(
      onSucceeded: (context, response) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(successMessage)));
        onSucceeded?.call(context, response);
      },
      onError: (context, error) {
        final message = failureMessagePrefix != null
            ? '$failureMessagePrefix$error'
            : 'An unexpected error occurred.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        onError?.call(context, error);
      },
      child: child,
    );
  }
}
