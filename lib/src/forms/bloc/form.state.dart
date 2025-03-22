part of 'form.bloc.dart';

enum FooFormDataUpdateStatus { notUpdating, updating, failed }

abstract class HasFormGroup {
  late FormGroup formGroup;
}

@Freezed(genericArgumentFactories: true)
abstract class FooFormState<FormData, Form extends HasFormGroup>
    with _$FooFormState<FormData, Form> {
  factory FooFormState.initial() = FooFormInitial;
  factory FooFormState.loading() = FooFormLoading;
  factory FooFormState.loaded(
      {required FormData formData,
      required Form form,
      @Default(FooFormDataUpdateStatus.notUpdating)
      FooFormDataUpdateStatus formDataUpdateStatus,
      @Default(FooFormSubmissionState.initial())
      FooFormSubmissionState formSubmissionState}) = FooFormLoaded;
  factory FooFormState.failedLoading() = FooFormFailedLoading;
}

@Freezed(genericArgumentFactories: true)
abstract class FooFormSubmissionState<Response> with _$FooFormSubmissionState {
  const factory FooFormSubmissionState.initial() =
      FooFormSubmissionStateInitial;
  const factory FooFormSubmissionState.inProgress() =
      FooFormSubmissionStateInProgress;
  const factory FooFormSubmissionState.succeeded(Response response) =
      FooFormSubmissionStateSucceeded;
  const factory FooFormSubmissionState.failed() = FooFormSubmissionStateFailed;
}
