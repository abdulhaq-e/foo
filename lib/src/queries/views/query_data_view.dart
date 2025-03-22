import 'package:foo/src/queries/queries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryDataView<Query, Data> extends StatelessWidget {
  final Widget Function(BuildContext, Data) widgetBuilder;
  QueryDataView({Key? key, required this.widgetBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueryDataBloc<Query, Data>, QueryDataState<Data>>(
        builder: (context, state) {
      return state.map(
          initial: (_) => Container(),
          loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
          failedLoading: (_) => Center(
                child: const Text('Failed loading...'),
              ),
          loaded: (s) => widgetBuilder(context, s.data));
    });
  }
}
