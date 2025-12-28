import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foo/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_v2.bloc.freezed.dart';
part 'form_v2.events.dart';
part 'form_v2.state.dart';

typedef FormV2Builder<Output> = Output Function();
typedef OnValueChange<F> = FutureOr<void> Function(F);

class FooFormV2Bloc<Data, Form extends HasFormV2Group>
    extends Bloc<FooFormV2Event, FooFormV2State<Data, Form>> {
  FooFormV2Bloc({
    required FormV2Builder<Form> formBuilder,
    required QueryHandling<Form, Data> dataFetcher,
    required CommandHandling<Form, void> submitCommandHandler,
    bool shouldListenToValueChanges = false,
    OnValueChange<Form>? onValueChange,
  }) : _formBuilder = formBuilder,
       _dataFetcher = dataFetcher,
       _submitCommandHandler = submitCommandHandler,
       _shouldListenToValueChanges = shouldListenToValueChanges,
       _onValueChange = onValueChange,
       super(FooFormV2State.initial()) {
    on<FooFormV2DataLoaded>(_loadData);
    on<FooFormV2DataReloaded>(_reloadData);
    on<FooFormV2Submitted>(_submit);
    on<FooFormV2FieldUpdated>(_fieldUpdated);
  }
  final FormV2Builder<Form> _formBuilder;
  final QueryHandling<Form, Data> _dataFetcher;
  final CommandHandling<Form, void> _submitCommandHandler;
  final bool _shouldListenToValueChanges;
  final OnValueChange<Form>? _onValueChange;

  StreamSubscription<dynamic>? _subscription;

  Future<void> _loadData(event, emit) async {
    emit(FooFormV2State<Data, Form>.loading());
    try {
      final form = _formBuilder();
      final formData = await _dataFetcher(form);
      if (_shouldListenToValueChanges && _onValueChange != null) {
        _subscription = form.formGroup.valueChanges.listen((_) async {
          await _onValueChange(form);
        });
      }
      emit(FooFormV2State<Data, Form>.loaded(formData: formData, form: form));
    } catch (_) {
      emit(FooFormV2State<Data, Form>.failedLoading());
    }
  }

  Future<void> _reloadData(event, emit) async {
    // Can be used for situations when a drop menu selection will cause another
    // drop menu data to be loaded.
    if (state is! FooFormV2Loaded<Data, Form>) {
      return;
    }
    final newState = state as FooFormV2Loaded<Data, Form>;
    emit(
      newState.copyWith(
        formDataUpdateStatus: FooFormV2DataUpdateStatus.updating,
      ),
    );
    try {
      final formData = await _dataFetcher(newState.form);
      emit(
        newState.copyWith(
          formData: formData,
          formDataUpdateStatus: FooFormV2DataUpdateStatus.updating,
        ),
      );
    } catch (_) {
      emit(
        newState.copyWith(
          formDataUpdateStatus: FooFormV2DataUpdateStatus.failed,
        ),
      );
    }
  }

  Future<void> _submit(event, emit) async {
    if (state is! FooFormV2Loaded<Data, Form>) {
      return;
    }
    final newState = state as FooFormV2Loaded<Data, Form>;

    await _submitCommandHandler(newState.form);
  }

  Future<void> _fieldUpdated(FooFormV2FieldUpdated event, emit) async {
    if (state is! FooFormV2Loaded<Data, Form>) {
      return;
    }
    final newState = state as FooFormV2Loaded<Data, Form>;

    newState.form.formGroup.controls[event.formControl]?.updateValue(
      event.value,
    );
  }
}
