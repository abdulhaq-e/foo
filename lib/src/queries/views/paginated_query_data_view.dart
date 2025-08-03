import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/queries.dart';

class PaginatedQueryDataView<Query, Data> extends StatelessWidget {
  const PaginatedQueryDataView({required this.widgetBuilder, super.key});
  final Widget Function(BuildContext, PaginatedQueryDataLoaded<Data>)
      widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedQueryDataBloc<Query, Data>,
        PaginatedQueryDataState<Data>>(
      builder: (context, state) {
        return switch (state) {
          PaginatedQueryDataInitial() => Container(),
          PaginatedQueryDataLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          PaginatedQueryDataError() => const Center(
              child: Text('Failed loading...'),
            ),
          PaginatedQueryDataLoaded() => widgetBuilder(context, state),
        };
      },
    );
  }
}
