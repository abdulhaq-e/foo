import 'dart:developer';

import 'package:foo/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FooForm<FormData, Form extends HasFormGroup, FormResponse, SceneOutput>
    extends StatelessWidget {
  FooForm({required this.formWidgetsBuilder});
  final FooFormWidgetsBuilder<FormData, Form, FormResponse, SceneOutput>
      formWidgetsBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FooFormBloc<FormData, Form, FormResponse>,
        FooFormState<FormData, Form>>(
      listener: (context, _state) {
        var state = _state;
        if (state is FooFormLoaded<FormData, Form>) {
          if (state.formSubmissionState is FooFormSubmissionStateFailed) {
            formWidgetsBuilder.onFormSubmissionFailure(context, state);
          } else if (state.formSubmissionState
              is FooFormSubmissionStateSucceeded<FormResponse>) {
            formWidgetsBuilder.onFormSubmissionSuccess(context, state);
          }
        }
      },
      builder: (context, FooFormState<FormData, Form> state) {
        return state.map(
            initial: (state) =>
                formWidgetsBuilder.initialBuillder(context, state),
            loading: (state) =>
                formWidgetsBuilder.loadingBuillder(context, state),
            loaded: (state) => ReactiveForm(
                formGroup: state.form.formGroup,
                child: formWidgetsBuilder.loadedBuillder(context, state)),
            failedLoading: (state) =>
                formWidgetsBuilder.failedLoadingBuillder(context, state));
      },
    );
  }
}
