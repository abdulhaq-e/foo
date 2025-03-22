import 'dart:developer';

import 'package:foo/forms_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FooFormV2<FormData, Form extends HasFormV2Group> extends StatelessWidget {
  FooFormV2({required this.formWidgetsBuilder});
  final FooFormV2WidgetsBuilder<FormData, Form> formWidgetsBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FooFormV2Bloc<FormData, Form>,
        FooFormV2State<FormData, Form>>(
      listener: (context, _state) {},
      builder: (context, FooFormV2State<FormData, Form> state) {
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
