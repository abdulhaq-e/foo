import 'package:foo/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FooFormV2WidgetsBuilder<FormData, Form extends HasFormV2Group> {
  FooFormV2WidgetsBuilder({
    Widget Function(BuildContext, FooFormV2Initial<FormData, Form>)?
    initialBuillder,
    Widget Function(BuildContext, FooFormV2Loading<FormData, Form>)?
    loadingBuillder,
    required Widget Function(BuildContext, FooFormV2Loaded<FormData, Form>)
    loadedBuilder,
    Widget Function(BuildContext, FooFormV2FailedLoading<FormData, Form>)?
    failedLoadingBuillder,
  }) {
    this.initialBuillder = (initialBuillder == null)
        ? _defaultInitialBuilder
        : initialBuillder!;
    this.loadingBuillder = (loadingBuillder == null)
        ? _defaultLoadingBuilder
        : loadingBuillder!;
    this.failedLoadingBuillder = (failedLoadingBuillder == null)
        ? _defaultFailedLoadingBuilder
        : failedLoadingBuillder!;
    this.loadedBuillder = loadedBuilder;
  }
  late Widget Function(BuildContext, FooFormV2Initial<FormData, Form>)
  initialBuillder;
  late Widget Function(BuildContext, FooFormV2Loading<FormData, Form>)
  loadingBuillder;
  late Widget Function(BuildContext, FooFormV2Loaded<FormData, Form>)
  loadedBuillder;
  late Widget Function(BuildContext, FooFormV2FailedLoading<FormData, Form>)
  failedLoadingBuillder;

  Widget _defaultInitialBuilder(
    BuildContext context,
    FooFormV2Initial<FormData, Form> state,
  ) {
    return Container();
  }

  Widget _defaultLoadingBuilder(
    BuildContext context,
    FooFormV2Loading<FormData, Form> state,
  ) {
    return CircularProgressIndicator();
  }

  Widget _defaultFailedLoadingBuilder(
    BuildContext context,
    FooFormV2FailedLoading<FormData, Form> state,
  ) {
    return const Text('Operation Failed');
  }
}
