import 'package:foo/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FooFormWidgetsBuilder<FormData, Form extends HasFormGroup, FormResponse,
    SceneOutput> {
  FooFormWidgetsBuilder({
    void Function(BuildContext, FooFormLoaded<FormData, Form>)?
        onFormSubmissionSuccess,
    void Function(BuildContext, FooFormLoaded<FormData, Form>)?
        onFormSubmissionFailure,
    Widget Function(BuildContext, FooFormInitial<FormData, Form>)?
        initialBuillder,
    Widget Function(BuildContext, FooFormLoading<FormData, Form>)?
        loadingBuillder,
    required Widget Function(BuildContext, FooFormLoaded<FormData, Form>)
        loadedBuilder,
    Widget Function(BuildContext, FooFormFailedLoading<FormData, Form>)?
        failedLoadingBuillder,
  }) {
    this.onFormSubmissionSuccess = (onFormSubmissionSuccess == null)
        ? _defaultOnFormSubmissionSuccess
        : onFormSubmissionSuccess!;
    this.onFormSubmissionFailure = (onFormSubmissionFailure == null)
        ? _defaultOnFormSubmissionFailure
        : onFormSubmissionFailure!;
    this.initialBuillder =
        (initialBuillder == null) ? _defaultInitialBuilder : initialBuillder!;
    this.loadingBuillder =
        (loadingBuillder == null) ? _defaultLoadingBuilder : loadingBuillder!;
    this.failedLoadingBuillder = (failedLoadingBuillder == null)
        ? _defaultFailedLoadingBuilder
        : failedLoadingBuillder!;
    this.loadedBuillder = loadedBuilder;
  }
  late void Function(BuildContext, FooFormLoaded<FormData, Form>)
      onFormSubmissionSuccess;
  late void Function(BuildContext, FooFormLoaded<FormData, Form>)
      onFormSubmissionFailure;
  late Widget Function(BuildContext, FooFormInitial<FormData, Form>)
      initialBuillder;
  late Widget Function(BuildContext, FooFormLoading<FormData, Form>)
      loadingBuillder;
  late Widget Function(BuildContext, FooFormLoaded<FormData, Form>)
      loadedBuillder;
  late Widget Function(BuildContext, FooFormFailedLoading<FormData, Form>)
      failedLoadingBuillder;

  void _defaultOnFormSubmissionSuccess(
      BuildContext context, FooFormLoaded<FormData, Form> state) {
    context.read<FormSubmissionDelegate<SceneOutput>>().onSubmissionSuccess(
          (state.formSubmissionState
                  as FooFormSubmissionStateSucceeded<SceneOutput>)
              .response,
        );
  }

  void _defaultOnFormSubmissionFailure(
      BuildContext context, FooFormLoaded<FormData, Form> state) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Operation Failed'),
      ),
    );
  }

  Widget _defaultInitialBuilder(
      BuildContext context, FooFormInitial<FormData, Form> state) {
    return Container();
  }

  Widget _defaultLoadingBuilder(
      BuildContext context, FooFormLoading<FormData, Form> state) {
    return CircularProgressIndicator();
  }

  Widget _defaultFailedLoadingBuilder(
      BuildContext context, FooFormFailedLoading<FormData, Form> state) {
    return const Text('Operation Failed');
  }
}
