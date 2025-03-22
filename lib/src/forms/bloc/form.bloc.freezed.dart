// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FooFormState<FormData, Form extends HasFormGroup> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)
        loaded,
    required TResult Function() failedLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult? Function()? failedLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormInitial<FormData, Form> value) initial,
    required TResult Function(FooFormLoading<FormData, Form> value) loading,
    required TResult Function(FooFormLoaded<FormData, Form> value) loaded,
    required TResult Function(FooFormFailedLoading<FormData, Form> value)
        failedLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormInitial<FormData, Form> value)? initial,
    TResult? Function(FooFormLoading<FormData, Form> value)? loading,
    TResult? Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult? Function(FooFormFailedLoading<FormData, Form> value)?
        failedLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormInitial<FormData, Form> value)? initial,
    TResult Function(FooFormLoading<FormData, Form> value)? loading,
    TResult Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult Function(FooFormFailedLoading<FormData, Form> value)? failedLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FooFormStateCopyWith<FormData, Form extends HasFormGroup,
    $Res> {
  factory $FooFormStateCopyWith(FooFormState<FormData, Form> value,
          $Res Function(FooFormState<FormData, Form>) then) =
      _$FooFormStateCopyWithImpl<FormData, Form, $Res,
          FooFormState<FormData, Form>>;
}

/// @nodoc
class _$FooFormStateCopyWithImpl<FormData, Form extends HasFormGroup, $Res,
        $Val extends FooFormState<FormData, Form>>
    implements $FooFormStateCopyWith<FormData, Form, $Res> {
  _$FooFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FooFormInitialImplCopyWith<FormData,
    Form extends HasFormGroup, $Res> {
  factory _$$FooFormInitialImplCopyWith(
          _$FooFormInitialImpl<FormData, Form> value,
          $Res Function(_$FooFormInitialImpl<FormData, Form>) then) =
      __$$FooFormInitialImplCopyWithImpl<FormData, Form, $Res>;
}

/// @nodoc
class __$$FooFormInitialImplCopyWithImpl<FormData, Form extends HasFormGroup,
        $Res>
    extends _$FooFormStateCopyWithImpl<FormData, Form, $Res,
        _$FooFormInitialImpl<FormData, Form>>
    implements _$$FooFormInitialImplCopyWith<FormData, Form, $Res> {
  __$$FooFormInitialImplCopyWithImpl(
      _$FooFormInitialImpl<FormData, Form> _value,
      $Res Function(_$FooFormInitialImpl<FormData, Form>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormInitialImpl<FormData, Form extends HasFormGroup>
    implements FooFormInitial<FormData, Form> {
  _$FooFormInitialImpl();

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.initial()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormInitialImpl<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)
        loaded,
    required TResult Function() failedLoading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult? Function()? failedLoading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormInitial<FormData, Form> value) initial,
    required TResult Function(FooFormLoading<FormData, Form> value) loading,
    required TResult Function(FooFormLoaded<FormData, Form> value) loaded,
    required TResult Function(FooFormFailedLoading<FormData, Form> value)
        failedLoading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormInitial<FormData, Form> value)? initial,
    TResult? Function(FooFormLoading<FormData, Form> value)? loading,
    TResult? Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult? Function(FooFormFailedLoading<FormData, Form> value)?
        failedLoading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormInitial<FormData, Form> value)? initial,
    TResult Function(FooFormLoading<FormData, Form> value)? loading,
    TResult Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult Function(FooFormFailedLoading<FormData, Form> value)? failedLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FooFormInitial<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  factory FooFormInitial() = _$FooFormInitialImpl<FormData, Form>;
}

/// @nodoc
abstract class _$$FooFormLoadingImplCopyWith<FormData,
    Form extends HasFormGroup, $Res> {
  factory _$$FooFormLoadingImplCopyWith(
          _$FooFormLoadingImpl<FormData, Form> value,
          $Res Function(_$FooFormLoadingImpl<FormData, Form>) then) =
      __$$FooFormLoadingImplCopyWithImpl<FormData, Form, $Res>;
}

/// @nodoc
class __$$FooFormLoadingImplCopyWithImpl<FormData, Form extends HasFormGroup,
        $Res>
    extends _$FooFormStateCopyWithImpl<FormData, Form, $Res,
        _$FooFormLoadingImpl<FormData, Form>>
    implements _$$FooFormLoadingImplCopyWith<FormData, Form, $Res> {
  __$$FooFormLoadingImplCopyWithImpl(
      _$FooFormLoadingImpl<FormData, Form> _value,
      $Res Function(_$FooFormLoadingImpl<FormData, Form>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormLoadingImpl<FormData, Form extends HasFormGroup>
    implements FooFormLoading<FormData, Form> {
  _$FooFormLoadingImpl();

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.loading()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormLoadingImpl<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)
        loaded,
    required TResult Function() failedLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult? Function()? failedLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormInitial<FormData, Form> value) initial,
    required TResult Function(FooFormLoading<FormData, Form> value) loading,
    required TResult Function(FooFormLoaded<FormData, Form> value) loaded,
    required TResult Function(FooFormFailedLoading<FormData, Form> value)
        failedLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormInitial<FormData, Form> value)? initial,
    TResult? Function(FooFormLoading<FormData, Form> value)? loading,
    TResult? Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult? Function(FooFormFailedLoading<FormData, Form> value)?
        failedLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormInitial<FormData, Form> value)? initial,
    TResult Function(FooFormLoading<FormData, Form> value)? loading,
    TResult Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult Function(FooFormFailedLoading<FormData, Form> value)? failedLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FooFormLoading<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  factory FooFormLoading() = _$FooFormLoadingImpl<FormData, Form>;
}

/// @nodoc
abstract class _$$FooFormLoadedImplCopyWith<FormData, Form extends HasFormGroup,
    $Res> {
  factory _$$FooFormLoadedImplCopyWith(
          _$FooFormLoadedImpl<FormData, Form> value,
          $Res Function(_$FooFormLoadedImpl<FormData, Form>) then) =
      __$$FooFormLoadedImplCopyWithImpl<FormData, Form, $Res>;
  @useResult
  $Res call(
      {FormData formData,
      Form form,
      FooFormDataUpdateStatus formDataUpdateStatus,
      FooFormSubmissionState<dynamic> formSubmissionState});

  $FooFormSubmissionStateCopyWith<dynamic, $Res> get formSubmissionState;
}

/// @nodoc
class __$$FooFormLoadedImplCopyWithImpl<FormData, Form extends HasFormGroup,
        $Res>
    extends _$FooFormStateCopyWithImpl<FormData, Form, $Res,
        _$FooFormLoadedImpl<FormData, Form>>
    implements _$$FooFormLoadedImplCopyWith<FormData, Form, $Res> {
  __$$FooFormLoadedImplCopyWithImpl(_$FooFormLoadedImpl<FormData, Form> _value,
      $Res Function(_$FooFormLoadedImpl<FormData, Form>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = freezed,
    Object? form = null,
    Object? formDataUpdateStatus = null,
    Object? formSubmissionState = null,
  }) {
    return _then(_$FooFormLoadedImpl<FormData, Form>(
      formData: freezed == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as FormData,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as Form,
      formDataUpdateStatus: null == formDataUpdateStatus
          ? _value.formDataUpdateStatus
          : formDataUpdateStatus // ignore: cast_nullable_to_non_nullable
              as FooFormDataUpdateStatus,
      formSubmissionState: null == formSubmissionState
          ? _value.formSubmissionState
          : formSubmissionState // ignore: cast_nullable_to_non_nullable
              as FooFormSubmissionState<dynamic>,
    ));
  }

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FooFormSubmissionStateCopyWith<dynamic, $Res> get formSubmissionState {
    return $FooFormSubmissionStateCopyWith<dynamic, $Res>(
        _value.formSubmissionState, (value) {
      return _then(_value.copyWith(formSubmissionState: value));
    });
  }
}

/// @nodoc

class _$FooFormLoadedImpl<FormData, Form extends HasFormGroup>
    implements FooFormLoaded<FormData, Form> {
  _$FooFormLoadedImpl(
      {required this.formData,
      required this.form,
      this.formDataUpdateStatus = FooFormDataUpdateStatus.notUpdating,
      this.formSubmissionState = const FooFormSubmissionState.initial()});

  @override
  final FormData formData;
  @override
  final Form form;
  @override
  @JsonKey()
  final FooFormDataUpdateStatus formDataUpdateStatus;
  @override
  @JsonKey()
  final FooFormSubmissionState<dynamic> formSubmissionState;

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.loaded(formData: $formData, form: $form, formDataUpdateStatus: $formDataUpdateStatus, formSubmissionState: $formSubmissionState)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormLoadedImpl<FormData, Form> &&
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

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FooFormLoadedImplCopyWith<FormData, Form,
          _$FooFormLoadedImpl<FormData, Form>>
      get copyWith => __$$FooFormLoadedImplCopyWithImpl<FormData, Form,
          _$FooFormLoadedImpl<FormData, Form>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)
        loaded,
    required TResult Function() failedLoading,
  }) {
    return loaded(formData, form, formDataUpdateStatus, formSubmissionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult? Function()? failedLoading,
  }) {
    return loaded?.call(
        formData, form, formDataUpdateStatus, formSubmissionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(formData, form, formDataUpdateStatus, formSubmissionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormInitial<FormData, Form> value) initial,
    required TResult Function(FooFormLoading<FormData, Form> value) loading,
    required TResult Function(FooFormLoaded<FormData, Form> value) loaded,
    required TResult Function(FooFormFailedLoading<FormData, Form> value)
        failedLoading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormInitial<FormData, Form> value)? initial,
    TResult? Function(FooFormLoading<FormData, Form> value)? loading,
    TResult? Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult? Function(FooFormFailedLoading<FormData, Form> value)?
        failedLoading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormInitial<FormData, Form> value)? initial,
    TResult Function(FooFormLoading<FormData, Form> value)? loading,
    TResult Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult Function(FooFormFailedLoading<FormData, Form> value)? failedLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FooFormLoaded<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  factory FooFormLoaded(
          {required final FormData formData,
          required final Form form,
          final FooFormDataUpdateStatus formDataUpdateStatus,
          final FooFormSubmissionState<dynamic> formSubmissionState}) =
      _$FooFormLoadedImpl<FormData, Form>;

  FormData get formData;
  Form get form;
  FooFormDataUpdateStatus get formDataUpdateStatus;
  FooFormSubmissionState<dynamic> get formSubmissionState;

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FooFormLoadedImplCopyWith<FormData, Form,
          _$FooFormLoadedImpl<FormData, Form>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FooFormFailedLoadingImplCopyWith<FormData,
    Form extends HasFormGroup, $Res> {
  factory _$$FooFormFailedLoadingImplCopyWith(
          _$FooFormFailedLoadingImpl<FormData, Form> value,
          $Res Function(_$FooFormFailedLoadingImpl<FormData, Form>) then) =
      __$$FooFormFailedLoadingImplCopyWithImpl<FormData, Form, $Res>;
}

/// @nodoc
class __$$FooFormFailedLoadingImplCopyWithImpl<FormData,
        Form extends HasFormGroup, $Res>
    extends _$FooFormStateCopyWithImpl<FormData, Form, $Res,
        _$FooFormFailedLoadingImpl<FormData, Form>>
    implements _$$FooFormFailedLoadingImplCopyWith<FormData, Form, $Res> {
  __$$FooFormFailedLoadingImplCopyWithImpl(
      _$FooFormFailedLoadingImpl<FormData, Form> _value,
      $Res Function(_$FooFormFailedLoadingImpl<FormData, Form>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormFailedLoadingImpl<FormData, Form extends HasFormGroup>
    implements FooFormFailedLoading<FormData, Form> {
  _$FooFormFailedLoadingImpl();

  @override
  String toString() {
    return 'FooFormState<$FormData, $Form>.failedLoading()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormFailedLoadingImpl<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)
        loaded,
    required TResult Function() failedLoading,
  }) {
    return failedLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult? Function()? failedLoading,
  }) {
    return failedLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            FormData formData,
            Form form,
            FooFormDataUpdateStatus formDataUpdateStatus,
            FooFormSubmissionState<dynamic> formSubmissionState)?
        loaded,
    TResult Function()? failedLoading,
    required TResult orElse(),
  }) {
    if (failedLoading != null) {
      return failedLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormInitial<FormData, Form> value) initial,
    required TResult Function(FooFormLoading<FormData, Form> value) loading,
    required TResult Function(FooFormLoaded<FormData, Form> value) loaded,
    required TResult Function(FooFormFailedLoading<FormData, Form> value)
        failedLoading,
  }) {
    return failedLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormInitial<FormData, Form> value)? initial,
    TResult? Function(FooFormLoading<FormData, Form> value)? loading,
    TResult? Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult? Function(FooFormFailedLoading<FormData, Form> value)?
        failedLoading,
  }) {
    return failedLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormInitial<FormData, Form> value)? initial,
    TResult Function(FooFormLoading<FormData, Form> value)? loading,
    TResult Function(FooFormLoaded<FormData, Form> value)? loaded,
    TResult Function(FooFormFailedLoading<FormData, Form> value)? failedLoading,
    required TResult orElse(),
  }) {
    if (failedLoading != null) {
      return failedLoading(this);
    }
    return orElse();
  }
}

abstract class FooFormFailedLoading<FormData, Form extends HasFormGroup>
    implements FooFormState<FormData, Form> {
  factory FooFormFailedLoading() = _$FooFormFailedLoadingImpl<FormData, Form>;
}

/// @nodoc
mixin _$FooFormSubmissionState<Response> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Response response) succeeded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Response response)? succeeded,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Response response)? succeeded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormSubmissionStateInitial<Response> value)
        initial,
    required TResult Function(FooFormSubmissionStateInProgress<Response> value)
        inProgress,
    required TResult Function(FooFormSubmissionStateSucceeded<Response> value)
        succeeded,
    required TResult Function(FooFormSubmissionStateFailed<Response> value)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult? Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult? Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult? Function(FooFormSubmissionStateFailed<Response> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult Function(FooFormSubmissionStateFailed<Response> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FooFormSubmissionStateCopyWith<Response, $Res> {
  factory $FooFormSubmissionStateCopyWith(
          FooFormSubmissionState<Response> value,
          $Res Function(FooFormSubmissionState<Response>) then) =
      _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
          FooFormSubmissionState<Response>>;
}

/// @nodoc
class _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
        $Val extends FooFormSubmissionState<Response>>
    implements $FooFormSubmissionStateCopyWith<Response, $Res> {
  _$FooFormSubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FooFormSubmissionStateInitialImplCopyWith<Response, $Res> {
  factory _$$FooFormSubmissionStateInitialImplCopyWith(
          _$FooFormSubmissionStateInitialImpl<Response> value,
          $Res Function(_$FooFormSubmissionStateInitialImpl<Response>) then) =
      __$$FooFormSubmissionStateInitialImplCopyWithImpl<Response, $Res>;
}

/// @nodoc
class __$$FooFormSubmissionStateInitialImplCopyWithImpl<Response, $Res>
    extends _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
        _$FooFormSubmissionStateInitialImpl<Response>>
    implements _$$FooFormSubmissionStateInitialImplCopyWith<Response, $Res> {
  __$$FooFormSubmissionStateInitialImplCopyWithImpl(
      _$FooFormSubmissionStateInitialImpl<Response> _value,
      $Res Function(_$FooFormSubmissionStateInitialImpl<Response>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormSubmissionStateInitialImpl<Response>
    implements FooFormSubmissionStateInitial<Response> {
  const _$FooFormSubmissionStateInitialImpl();

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.initial()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormSubmissionStateInitialImpl<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Response response) succeeded,
    required TResult Function() failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Response response)? succeeded,
    TResult? Function()? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Response response)? succeeded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormSubmissionStateInitial<Response> value)
        initial,
    required TResult Function(FooFormSubmissionStateInProgress<Response> value)
        inProgress,
    required TResult Function(FooFormSubmissionStateSucceeded<Response> value)
        succeeded,
    required TResult Function(FooFormSubmissionStateFailed<Response> value)
        failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult? Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult? Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult? Function(FooFormSubmissionStateFailed<Response> value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult Function(FooFormSubmissionStateFailed<Response> value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FooFormSubmissionStateInitial<Response>
    implements FooFormSubmissionState<Response> {
  const factory FooFormSubmissionStateInitial() =
      _$FooFormSubmissionStateInitialImpl<Response>;
}

/// @nodoc
abstract class _$$FooFormSubmissionStateInProgressImplCopyWith<Response, $Res> {
  factory _$$FooFormSubmissionStateInProgressImplCopyWith(
          _$FooFormSubmissionStateInProgressImpl<Response> value,
          $Res Function(_$FooFormSubmissionStateInProgressImpl<Response>)
              then) =
      __$$FooFormSubmissionStateInProgressImplCopyWithImpl<Response, $Res>;
}

/// @nodoc
class __$$FooFormSubmissionStateInProgressImplCopyWithImpl<Response, $Res>
    extends _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
        _$FooFormSubmissionStateInProgressImpl<Response>>
    implements _$$FooFormSubmissionStateInProgressImplCopyWith<Response, $Res> {
  __$$FooFormSubmissionStateInProgressImplCopyWithImpl(
      _$FooFormSubmissionStateInProgressImpl<Response> _value,
      $Res Function(_$FooFormSubmissionStateInProgressImpl<Response>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormSubmissionStateInProgressImpl<Response>
    implements FooFormSubmissionStateInProgress<Response> {
  const _$FooFormSubmissionStateInProgressImpl();

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.inProgress()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormSubmissionStateInProgressImpl<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Response response) succeeded,
    required TResult Function() failed,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Response response)? succeeded,
    TResult? Function()? failed,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Response response)? succeeded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormSubmissionStateInitial<Response> value)
        initial,
    required TResult Function(FooFormSubmissionStateInProgress<Response> value)
        inProgress,
    required TResult Function(FooFormSubmissionStateSucceeded<Response> value)
        succeeded,
    required TResult Function(FooFormSubmissionStateFailed<Response> value)
        failed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult? Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult? Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult? Function(FooFormSubmissionStateFailed<Response> value)? failed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult Function(FooFormSubmissionStateFailed<Response> value)? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class FooFormSubmissionStateInProgress<Response>
    implements FooFormSubmissionState<Response> {
  const factory FooFormSubmissionStateInProgress() =
      _$FooFormSubmissionStateInProgressImpl<Response>;
}

/// @nodoc
abstract class _$$FooFormSubmissionStateSucceededImplCopyWith<Response, $Res> {
  factory _$$FooFormSubmissionStateSucceededImplCopyWith(
          _$FooFormSubmissionStateSucceededImpl<Response> value,
          $Res Function(_$FooFormSubmissionStateSucceededImpl<Response>) then) =
      __$$FooFormSubmissionStateSucceededImplCopyWithImpl<Response, $Res>;
  @useResult
  $Res call({Response response});
}

/// @nodoc
class __$$FooFormSubmissionStateSucceededImplCopyWithImpl<Response, $Res>
    extends _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
        _$FooFormSubmissionStateSucceededImpl<Response>>
    implements _$$FooFormSubmissionStateSucceededImplCopyWith<Response, $Res> {
  __$$FooFormSubmissionStateSucceededImplCopyWithImpl(
      _$FooFormSubmissionStateSucceededImpl<Response> _value,
      $Res Function(_$FooFormSubmissionStateSucceededImpl<Response>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$FooFormSubmissionStateSucceededImpl<Response>(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
    ));
  }
}

/// @nodoc

class _$FooFormSubmissionStateSucceededImpl<Response>
    implements FooFormSubmissionStateSucceeded<Response> {
  const _$FooFormSubmissionStateSucceededImpl(this.response);

  @override
  final Response response;

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.succeeded(response: $response)';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormSubmissionStateSucceededImpl<Response> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FooFormSubmissionStateSucceededImplCopyWith<Response,
          _$FooFormSubmissionStateSucceededImpl<Response>>
      get copyWith => __$$FooFormSubmissionStateSucceededImplCopyWithImpl<
          Response,
          _$FooFormSubmissionStateSucceededImpl<Response>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Response response) succeeded,
    required TResult Function() failed,
  }) {
    return succeeded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Response response)? succeeded,
    TResult? Function()? failed,
  }) {
    return succeeded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Response response)? succeeded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormSubmissionStateInitial<Response> value)
        initial,
    required TResult Function(FooFormSubmissionStateInProgress<Response> value)
        inProgress,
    required TResult Function(FooFormSubmissionStateSucceeded<Response> value)
        succeeded,
    required TResult Function(FooFormSubmissionStateFailed<Response> value)
        failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult? Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult? Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult? Function(FooFormSubmissionStateFailed<Response> value)? failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult Function(FooFormSubmissionStateFailed<Response> value)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class FooFormSubmissionStateSucceeded<Response>
    implements FooFormSubmissionState<Response> {
  const factory FooFormSubmissionStateSucceeded(final Response response) =
      _$FooFormSubmissionStateSucceededImpl<Response>;

  Response get response;

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FooFormSubmissionStateSucceededImplCopyWith<Response,
          _$FooFormSubmissionStateSucceededImpl<Response>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FooFormSubmissionStateFailedImplCopyWith<Response, $Res> {
  factory _$$FooFormSubmissionStateFailedImplCopyWith(
          _$FooFormSubmissionStateFailedImpl<Response> value,
          $Res Function(_$FooFormSubmissionStateFailedImpl<Response>) then) =
      __$$FooFormSubmissionStateFailedImplCopyWithImpl<Response, $Res>;
}

/// @nodoc
class __$$FooFormSubmissionStateFailedImplCopyWithImpl<Response, $Res>
    extends _$FooFormSubmissionStateCopyWithImpl<Response, $Res,
        _$FooFormSubmissionStateFailedImpl<Response>>
    implements _$$FooFormSubmissionStateFailedImplCopyWith<Response, $Res> {
  __$$FooFormSubmissionStateFailedImplCopyWithImpl(
      _$FooFormSubmissionStateFailedImpl<Response> _value,
      $Res Function(_$FooFormSubmissionStateFailedImpl<Response>) _then)
      : super(_value, _then);

  /// Create a copy of FooFormSubmissionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FooFormSubmissionStateFailedImpl<Response>
    implements FooFormSubmissionStateFailed<Response> {
  const _$FooFormSubmissionStateFailedImpl();

  @override
  String toString() {
    return 'FooFormSubmissionState<$Response>.failed()';
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooFormSubmissionStateFailedImpl<Response>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Response response) succeeded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Response response)? succeeded,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Response response)? succeeded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FooFormSubmissionStateInitial<Response> value)
        initial,
    required TResult Function(FooFormSubmissionStateInProgress<Response> value)
        inProgress,
    required TResult Function(FooFormSubmissionStateSucceeded<Response> value)
        succeeded,
    required TResult Function(FooFormSubmissionStateFailed<Response> value)
        failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult? Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult? Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult? Function(FooFormSubmissionStateFailed<Response> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FooFormSubmissionStateInitial<Response> value)? initial,
    TResult Function(FooFormSubmissionStateInProgress<Response> value)?
        inProgress,
    TResult Function(FooFormSubmissionStateSucceeded<Response> value)?
        succeeded,
    TResult Function(FooFormSubmissionStateFailed<Response> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FooFormSubmissionStateFailed<Response>
    implements FooFormSubmissionState<Response> {
  const factory FooFormSubmissionStateFailed() =
      _$FooFormSubmissionStateFailedImpl<Response>;
}
