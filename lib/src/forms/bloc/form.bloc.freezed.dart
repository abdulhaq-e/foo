// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FooFormState<FormData, Form extends HasFormGroup> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormState<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>()';
  }
}

/// @nodoc
class $FooFormStateCopyWith<FormData, Form extends HasFormGroup, $Res> {
  $FooFormStateCopyWith(FooFormState<FormData, Form> _,
      $Res Function(FooFormState<FormData, Form>) __);
}

/// @nodoc

class FooFormInitial<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  FooFormInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormInitial<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.initial()';
  }
}

/// @nodoc

class FooFormLoading<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  FooFormLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormLoading<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.loading()';
  }
}

/// @nodoc

class FooFormLoaded<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  FooFormLoaded(
      {required this.formData,
      required this.form,
      this.formDataUpdateStatus = FooFormDataUpdateStatus.notUpdating,
      this.formSubmissionState = const FooFormSubmissionState.initial()});

  final FormData formData;
  final Form form;
  @JsonKey()
  final FooFormDataUpdateStatus formDataUpdateStatus;
  @JsonKey()
  final FooFormSubmissionState formSubmissionState;

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FooFormLoadedCopyWith<FormData, Form, FooFormLoaded<FormData, Form>>
      get copyWith => _$FooFormLoadedCopyWithImpl<FormData, Form,
          FooFormLoaded<FormData, Form>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormLoaded<FormData, Form> &&
            const DeepCollectionEquality().equals(other.formData, formData) &&
            const DeepCollectionEquality().equals(other.form, form) &&
            (identical(other.formDataUpdateStatus, formDataUpdateStatus) ||
                other.formDataUpdateStatus == formDataUpdateStatus) &&
            (identical(other.formSubmissionState, formSubmissionState) ||
                other.formSubmissionState == formSubmissionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formData),
      const DeepCollectionEquality().hash(form),
      formDataUpdateStatus,
      formSubmissionState);

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.loaded(formData: $formData, form: $form, formDataUpdateStatus: $formDataUpdateStatus, formSubmissionState: $formSubmissionState)';
  }
}

/// @nodoc
abstract mixin class $FooFormLoadedCopyWith<FormData, Form extends HasFormGroup,
    $Res> implements $FooFormStateCopyWith<FormData, Form, $Res> {
  factory $FooFormLoadedCopyWith(FooFormLoaded<FormData, Form> value,
          $Res Function(FooFormLoaded<FormData, Form>) _then) =
      _$FooFormLoadedCopyWithImpl;
  @useResult
  $Res call(
      {FormData formData,
      Form form,
      FooFormDataUpdateStatus formDataUpdateStatus,
      FooFormSubmissionState formSubmissionState});

  $FooFormSubmissionStateCopyWith<dynamic, $Res> get formSubmissionState;
}

/// @nodoc
class _$FooFormLoadedCopyWithImpl<FormData, Form extends HasFormGroup, $Res>
    implements $FooFormLoadedCopyWith<FormData, Form, $Res> {
  _$FooFormLoadedCopyWithImpl(this._self, this._then);

  final FooFormLoaded<FormData, Form> _self;
  final $Res Function(FooFormLoaded<FormData, Form>) _then;

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formData = freezed,
    Object? form = null,
    Object? formDataUpdateStatus = null,
    Object? formSubmissionState = null,
  }) {
    return _then(FooFormLoaded<FormData, Form>(
      formData: freezed == formData
          ? _self.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as FormData,
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as Form,
      formDataUpdateStatus: null == formDataUpdateStatus
          ? _self.formDataUpdateStatus
          : formDataUpdateStatus // ignore: cast_nullable_to_non_nullable
              as FooFormDataUpdateStatus,
      formSubmissionState: null == formSubmissionState
          ? _self.formSubmissionState
          : formSubmissionState // ignore: cast_nullable_to_non_nullable
              as FooFormSubmissionState,
    ));
  }

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FooFormSubmissionStateCopyWith<dynamic, $Res> get formSubmissionState {
    return $FooFormSubmissionStateCopyWith<dynamic, $Res>(
        _self.formSubmissionState, (value) {
      return _then(_self.copyWith(formSubmissionState: value));
    });
  }
}

/// @nodoc

class FooFormFailedLoading<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  FooFormFailedLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormFailedLoading<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.failedLoading()';
  }
}

/// @nodoc
mixin _$FooFormSubmissionState<Response> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormSubmissionState<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>()';
  }
}

/// @nodoc
class $FooFormSubmissionStateCopyWith<Response, $Res> {
  $FooFormSubmissionStateCopyWith(FooFormSubmissionState<Response> _,
      $Res Function(FooFormSubmissionState<Response>) __);
}

/// @nodoc

class FooFormSubmissionStateInitial<Response>
    implements FooFormSubmissionState<Response> {
  const FooFormSubmissionStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormSubmissionStateInitial<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.initial()';
  }
}

/// @nodoc

class FooFormSubmissionStateInProgress<Response>
    implements FooFormSubmissionState<Response> {
  const FooFormSubmissionStateInProgress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormSubmissionStateInProgress<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.inProgress()';
  }
}

/// @nodoc

class FooFormSubmissionStateSucceeded<Response>
    implements FooFormSubmissionState<Response> {
  const FooFormSubmissionStateSucceeded(this.response);

  final Response response;

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FooFormSubmissionStateSucceededCopyWith<Response,
          FooFormSubmissionStateSucceeded<Response>>
      get copyWith => _$FooFormSubmissionStateSucceededCopyWithImpl<Response,
          FooFormSubmissionStateSucceeded<Response>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormSubmissionStateSucceeded<Response> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.succeeded(response: $response)';
  }
}

/// @nodoc
abstract mixin class $FooFormSubmissionStateSucceededCopyWith<Response, $Res>
    implements $FooFormSubmissionStateCopyWith<Response, $Res> {
  factory $FooFormSubmissionStateSucceededCopyWith(
          FooFormSubmissionStateSucceeded<Response> value,
          $Res Function(FooFormSubmissionStateSucceeded<Response>) _then) =
      _$FooFormSubmissionStateSucceededCopyWithImpl;
  @useResult
  $Res call({Response response});
}

/// @nodoc
class _$FooFormSubmissionStateSucceededCopyWithImpl<Response, $Res>
    implements $FooFormSubmissionStateSucceededCopyWith<Response, $Res> {
  _$FooFormSubmissionStateSucceededCopyWithImpl(this._self, this._then);

  final FooFormSubmissionStateSucceeded<Response> _self;
  final $Res Function(FooFormSubmissionStateSucceeded<Response>) _then;

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = freezed,
  }) {
    return _then(FooFormSubmissionStateSucceeded<Response>(
      freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
    ));
  }
}

/// @nodoc

class FooFormSubmissionStateFailed<Response>
    implements FooFormSubmissionState<Response> {
  const FooFormSubmissionStateFailed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormSubmissionStateFailed<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.failed()';
  }
}

// dart format on
