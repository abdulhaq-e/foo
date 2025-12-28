import 'dart:developer';

import 'package:foo/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FooFormV2<FormData, Form extends HasFormV2Group> extends StatelessWidget {
  FooFormV2({required this.formWidgetsBuilder});
  final FooFormV2WidgetsBuilder<FormData, Form> formWidgetsBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      FooFormV2Bloc<FormData, Form>,
      FooFormV2State<FormData, Form>
    >(
      listener: (context, _state) {},
      builder: (context, FooFormV2State<FormData, Form> state) {
        return switch (state) {
          FooFormV2Initial<FormData, Form>() =>
            formWidgetsBuilder.initialBuillder(context, state),
          FooFormV2Loading<FormData, Form>() =>
            formWidgetsBuilder.loadingBuillder(context, state),
          FooFormV2Loaded<FormData, Form>() => ReactiveForm(
            formGroup: state.form.formGroup,
            child: formWidgetsBuilder.loadedBuillder(context, state),
          ),
          FooFormV2FailedLoading<FormData, Form>() =>
            formWidgetsBuilder.failedLoadingBuillder(context, state),
        };
      },
    );
  }
}
