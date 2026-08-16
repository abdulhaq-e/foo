import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/core.dart';

class CommandBuilder<Command, Response, Error, ValidationError>
    extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    CommandState<Command, Response, Error, ValidationError> state,
  )
  builder;

  const CommandBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CommandBloc<Command, Response, Error, ValidationError>,
      CommandState<Command, Response, Error, ValidationError>
    >(builder: builder);
  }
}
