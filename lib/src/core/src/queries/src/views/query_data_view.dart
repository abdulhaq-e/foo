import 'package:foo/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryDataView<Query, Data> extends StatelessWidget {
  final Widget Function(BuildContext, Data) widgetBuilder;
  QueryDataView({Key? key, required this.widgetBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueryDataBloc<Query, Data>, QueryDataState<Data>>(
      builder: (context, state) {
        return switch (state) {
          QueryDataInitial() => Container(),
          QueryDataLoading() => Center(child: CircularProgressIndicator()),
          QueryDataFailedLoading() => Center(
            child: const Text('Failed loading...'),
          ),
          QueryDataLoaded(:final data) => widgetBuilder(context, data),
        };
      },
    );
  }
}
