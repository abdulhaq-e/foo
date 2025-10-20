import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/commands.dart'; // Your command imports

class CommandStateBuilder<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    CommandState<Command, Response, Error, ValidationError> state,
  )
  builder;

  final WidgetBuilder? executingBuilder;

  final Widget Function(BuildContext context, Error error)? errorBuilder;

  final Widget Function(BuildContext context, ValidationError validationError)?
  validationFailedBuilder;

  const CommandStateBuilder({
    Key? key,
    required this.builder,
    this.executingBuilder,
    this.errorBuilder,
    this.validationFailedBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CommandBloc<Command, Response, Error, ValidationError>,
      CommandState<Command, Response, Error, ValidationError>
    >(
      builder: (context, state) {
        return switch (state) {
          CommandExecuting() when executingBuilder != null => executingBuilder!(
            context,
          ),

          CommandFailed(error: final error) when errorBuilder != null =>
            errorBuilder!(context, error),

          CommandValidationFailed(validationError: final validationError)
              when validationFailedBuilder != null =>
            validationFailedBuilder!(context, validationError),

          _ => builder(context, state),
        };
      },
    );
  }
}
