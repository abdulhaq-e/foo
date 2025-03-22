import 'package:foo/forms_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef FooButtonBuilder = Widget Function(bool Function() shouldAllowPress);

class FooFormV2ComponentsHelper<FormData, Form extends HasFormV2Group> {
  FooFormV2ComponentsHelper({required this.state, required this.bloc});
  final Bloc bloc;
  final FooFormV2Loaded<FormData, Form> state;

  Widget textField<T>({
    String? formControlName,
    FormControl<T>? formControl,
    required String label,
    Map<String, String Function(Object)>? validationMessages,
    String? initialValue,
    bool obscureText = false,
  }) {
    final widget = ReactiveTextField<T>(
      formControlName: formControlName,
      formControl: formControl,
      validationMessages: validationMessages,
      decoration: InputDecoration(labelText: label),
      obscureText: obscureText,
    );
    if (initialValue != null) {
      state.form.formGroup.controls[formControlName]?.value = initialValue;
    }
    return widget;
  }

  Widget dropDownMenu<T>({
    String? formControlName,
    FormControl<T>? formControl,
    required String label,
    required List<T> items,
    required Object Function(T) valueGenerator,
    required Widget Function(T) childGenerator,
    Object? initialValue,
  }) {
    final widget = ReactiveDropdownField(
      formControlName: formControlName,
      formControl: formControl,
      hint: Text(label),
      decoration: InputDecoration(labelText: label),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: valueGenerator(e),
              child: childGenerator(e),
            ),
          )
          .toList(),
    );
    if (initialValue != null) {
      state.form.formGroup.controls[formControlName]?.value = initialValue;
    }
    return widget;
  }

  // Widget submitButton({
  //   required bool Function(FormGroup) shouldAllowPress,
  //   required FooButtonBuilder buttonBuilder,
  // }) {
  //   final widget = reactiveButton(
  //       shouldAllowPress: shouldAllowPress, buttonBuilder: (s, onPress) {
  //         return buttonBuilder(() => shouldAllowPress, )
  //     });
  //   return widget;
  // }

  Widget reactiveButton({
    required bool Function(FormGroup) shouldAllowPress,
    required FooButtonBuilder buttonBuilder,
  }) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final button = buttonBuilder(() => shouldAllowPress(form));
        return button;
        // return state.formSubmissionState.maybeMap(
        //   orElse: () => button,
        //   inProgress: (_) => const CircularProgressIndicator(),
        // );
      },
    );
  }
}
