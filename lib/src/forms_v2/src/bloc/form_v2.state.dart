part of 'form_v2.bloc.dart';

enum FooFormV2DataUpdateStatus { notUpdating, updating, failed }

abstract class HasFormV2Group {
  late FormGroup formGroup;
}

@Freezed(genericArgumentFactories: true)
sealed class FooFormV2State<FormData, Form extends HasFormV2Group>
    with _$FooFormV2State<FormData, Form> {
  factory FooFormV2State.initial() = FooFormV2Initial;
  factory FooFormV2State.loading() = FooFormV2Loading;
  factory FooFormV2State.loaded({
    required FormData formData,
    required Form form,
    @Default(FooFormV2DataUpdateStatus.notUpdating)
    FooFormV2DataUpdateStatus formDataUpdateStatus,
  }) = FooFormV2Loaded;
  factory FooFormV2State.failedLoading() = FooFormV2FailedLoading;
}
