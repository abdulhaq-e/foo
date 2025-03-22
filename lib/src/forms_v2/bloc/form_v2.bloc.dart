import 'dart:async';
import 'dart:developer';

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
  FormV2Builder<Form> _formBuilder;
  QueryHandling<Form, Data> _dataFetcher;
  CommandHandling<Form, void> _submitCommandHandler;
  fool _shouldListenToValueChanges;
  OnValueChange<Form>? _onValueChange;

  StreamSubscription<dynamic>? _subscription;

  FooFormV2Bloc({
    required FormV2Builder<Form> formBuilder,
    required QueryHandling<Form, Data> dataFetcher,
    required CommandHandling<Form, void> submitCommandHandler,
    fool shouldListenToValueChanges = false,
    OnValueChange<Form>? onValueChange,
  })  : _formBuilder = formBuilder,
        _dataFetcher = dataFetcher,
        _submitCommandHandler = submitCommandHandler,
        _shouldListenToValueChanges = shouldListenToValueChanges,
        _onValueChange = onValueChange,
        super(FooFormV2State.initial()) {
    on<FooFormV2DataLoaded>((event, emit) => _loadData(event, emit));
    on<FooFormV2DataReloaded>((event, emit) => _reloadData(event, emit));
    on<FooFormV2Submitted>((event, emit) => _submit(event, emit));
  }

  void _loadData(event, emit) async {
    emit(FooFormV2State<Data, Form>.loading());
    try {
      var form = _formBuilder();
      var formData = await this._dataFetcher(form);
      if (_shouldListenToValueChanges && _onValueChange != null) {
        _subscription = form.formGroup.valueChanges.listen((_) async {
          await _onValueChange!(form);
        });
      }
      emit(FooFormV2State<Data, Form>.loaded(formData: formData, form: form));
    } catch (_) {
      emit(FooFormV2State<Data, Form>.failedLoading());
    }
  }

  void _reloadData(event, emit) async {
    // Can be used for situations when a drop menu selection will cause another
    // drop menu data to be loaded.
    if (!(state is FooFormV2Loaded<Data, Form>)) {
      return;
    }
    var newState = state as FooFormV2Loaded<Data, Form>;
    emit(newState.copyWith(
        formDataUpdateStatus: FooFormV2DataUpdateStatus.updating));
    try {
      var formData = await this._dataFetcher(newState.form);
      emit(newState.copyWith(
          formData: formData,
          formDataUpdateStatus: FooFormV2DataUpdateStatus.updating));
    } catch (_) {
      emit(newState.copyWith(
          formDataUpdateStatus: FooFormV2DataUpdateStatus.failed));
    }
  }

  void _submit(event, emit) async {
    if (!(state is FooFormV2Loaded<Data, Form>)) {
      return;
    }
    var newState = state as FooFormV2Loaded<Data, Form>;

    await _submitCommandHandler(newState.form);
  }
}
