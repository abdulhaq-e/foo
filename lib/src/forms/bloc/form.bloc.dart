import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:foo/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form.bloc.freezed.dart';
part 'form.events.dart';
part 'form.state.dart';

typedef FormBuilder<Output> = Output Function();

class FooFormBloc<Data, Form extends HasFormGroup, FormResponse>
    extends Bloc<FooFormEvent, FooFormState<Data, Form>> {
  FormBuilder<Form> _formBuilder;
  QueryHandling<Form, Data> _dataFetcher;
  CommandHandling<Form, FormResponse> _submitCommandHandler;

  FooFormBloc({
    required FormBuilder<Form> formBuilder,
    required QueryHandling<Form, Data> dataFetcher,
    required CommandHandling<Form, FormResponse> submitCommandHandler,
  })  : _formBuilder = formBuilder,
        _dataFetcher = dataFetcher,
        _submitCommandHandler = submitCommandHandler,
        super(FooFormState.initial()) {
    on<FooFormDataLoaded>((event, emit) => _loadData(event, emit));
    on<FooFormDataReloaded>((event, emit) => _reloadData(event, emit));
    on<FooFormSubmitted>((event, emit) => _submit(event, emit));
  }

  void _loadData(event, emit) async {
    emit(FooFormState<Data, Form>.loading());
    try {
      var form = _formBuilder();
      var formData = await this._dataFetcher(form);
      emit(FooFormState<Data, Form>.loaded(formData: formData, form: form));
    } catch (_) {
      emit(FooFormState<Data, Form>.failedLoading());
    }
  }

  FooFormState<Data, Form> _mapStateToNewFormSubmissionState(
      FooFormSubmissionState<FormResponse> formSubmissionState) {
    return state.maybeMap(
        orElse: () => state,
        loaded: (value) =>
            value.copyWith(formSubmissionState: formSubmissionState));
  }

  void _reloadData(event, emit) async {
    // Can be used for situations when a drop menu selection will cause another
    // drop menu data to be loaded.
    if (!(state is FooFormLoaded<Data, Form>)) {
      return;
    }
    var newState = state as FooFormLoaded<Data, Form>;
    emit(newState.copyWith(
        formDataUpdateStatus: FooFormDataUpdateStatus.updating));
    try {
      var formData = await this._dataFetcher(newState.form);
      emit(newState.copyWith(
          formData: formData,
          formDataUpdateStatus: FooFormDataUpdateStatus.updating));
    } catch (_) {
      emit(newState.copyWith(
          formDataUpdateStatus: FooFormDataUpdateStatus.failed));
    }
  }

  void _submit(event, emit) async {
    if (!(state is FooFormLoaded<Data, Form>)) {
      return;
    }
    var newState = state as FooFormLoaded<Data, Form>;

    emit(_mapStateToNewFormSubmissionState(
        FooFormSubmissionState<FormResponse>.inProgress()));
    try {
      var response = await _submitCommandHandler(newState.form);
      emit(_mapStateToNewFormSubmissionState(
          FooFormSubmissionState<FormResponse>.succeeded(response)));
    } catch (e) {
      emit(_mapStateToNewFormSubmissionState(FooFormSubmissionState.failed()));
    }
  }
}
