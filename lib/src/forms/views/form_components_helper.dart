import 'package:foo/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef FooButtonBuilder = Widget Function(bool Function() shouldAllowPress);

class FooFormComponentsHelper<FormData, Form extends HasFormGroup> {
  FooFormComponentsHelper({required this.state, required this.bloc});
  final Bloc bloc;
  final FooFormLoaded<FormData, Form> state;

  Widget textField<T>(
      {required String formControlName,
      required String label,
      Map<String, String Function(Object)>? validationMessages,
      String? initialValue,
      bool obscureText = false,
      int? maxLines = 1,
      int? minLines,
      bool expands = false,
      Widget? icon,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextAlign? textAlign,
      TextAlignVertical? textAlignVertical,
      TextStyle? style,
      TextInputType? keyboardType}) {
    final widget = ReactiveTextField<T>(
      formControlName: formControlName,
      validationMessages: validationMessages,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      style: style,
      keyboardType: keyboardType,
    );
    if (initialValue != null) {
      state.form.formGroup.controls[formControlName]?.value = initialValue;
    }
    return widget;
  }

  Widget dropDownMenu<T>({
    required String formControlName,
    required String label,
    String? hint,
    required List<T> items,
    required Object Function(T) valueGenerator,
    required Widget Function(T) childGenerator,
    Object? initialValue,
  }) {
    final widget = ReactiveDropdownField(
      formControlName: formControlName,
      hint: hint != null ? Text(hint) : null,
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
        return state.formSubmissionState.maybeMap(
          orElse: () => button,
          inProgress: (_) => const CircularProgressIndicator(),
        );
      },
    );
  }
}
