import 'package:bind_forms/bind_forms.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo/core.dart';

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
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    final widget = TextControlBuilder<T>(
      control:
          formControl ?? state.form.formGroup.formControl<T>(formControlName!),
      validationMessages: validationMessages,
      builder: (context, field) => TextField(
        controller: field,
        focusNode: field.focusNode,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon,
          errorText: field.errorText(context),
        ),
        obscureText: obscureText,
      ),
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
    Set<Object>? disabledValues,
  }) {
    // The items' values come from valueGenerator, not T, so the control is
    // bound as a FormControl<Object?>.
    final FormControl<Object?> control =
        formControl ??
        state.form.formGroup.control(formControlName!) as FormControl<Object?>;
    final widget = ValueControlBuilder<Object?>(
      control: control,
      builder: (context, field) => DropdownButtonFormField<Object?>(
        // A FormField keeps its own state after the first build, so key it
        // on the value for changes from code to show.
        key: ValueKey(field.value),
        initialValue: field.value,
        focusNode: field.focusNode,
        hint: Text(label),
        decoration: InputDecoration(
          labelText: label,
          errorText: field.errorText(context),
        ),
        onChanged: field.enabled ? field.onChanged : null,
        items: items
            .map(
              (e) => DropdownMenuItem<Object?>(
                value: valueGenerator(e),
                child: childGenerator(e),
                enabled: !(disabledValues ?? <Object>{}).contains(
                  valueGenerator(e),
                ),
              ),
            )
            .toList(),
      ),
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
    return ControlBuilder(
      control: state.form.formGroup,
      builder: (context, form) {
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
