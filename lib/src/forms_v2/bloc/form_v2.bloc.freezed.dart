// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_v2.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FooFormV2State<FormData, Form extends HasFormV2Group> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormV2State<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormV2State<$FormData, $Form>()';
  }
}

/// @nodoc
class $FooFormV2StateCopyWith<FormData, Form extends HasFormV2Group, $Res> {
  $FooFormV2StateCopyWith(FooFormV2State<FormData, Form> _,
      $Res Function(FooFormV2State<FormData, Form>) __);
}

/// @nodoc

class FooFormV2Initial<FormData, Form extends HasFormV2Group>
    implements FooFormV2State<FormData, Form> {
  FooFormV2Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormV2Initial<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormV2State<$FormData, $Form>.initial()';
  }
}

/// @nodoc

class FooFormV2Loading<FormData, Form extends HasFormV2Group>
    implements FooFormV2State<FormData, Form> {
  FooFormV2Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormV2Loading<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormV2State<$FormData, $Form>.loading()';
  }
}

/// @nodoc

class FooFormV2Loaded<FormData, Form extends HasFormV2Group>
    implements FooFormV2State<FormData, Form> {
  FooFormV2Loaded(
      {required this.formData,
      required this.form,
      this.formDataUpdateStatus = FooFormV2DataUpdateStatus.notUpdating});

  final FormData formData;
  final Form form;
  @JsonKey()
  final FooFormV2DataUpdateStatus formDataUpdateStatus;

  /// Create a copy of FooFormV2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FooFormV2LoadedCopyWith<FormData, Form, FooFormV2Loaded<FormData, Form>>
      get copyWith => _$FooFormV2LoadedCopyWithImpl<FormData, Form,
          FooFormV2Loaded<FormData, Form>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormV2Loaded<FormData, Form> &&
            const DeepCollectionEquality().equals(other.formData, formData) &&
            const DeepCollectionEquality().equals(other.form, form) &&
            (identical(other.formDataUpdateStatus, formDataUpdateStatus) ||
                other.formDataUpdateStatus == formDataUpdateStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formData),
      const DeepCollectionEquality().hash(form),
      formDataUpdateStatus);

  @override
  String toString() {
    return 'FooFormV2State<$FormData, $Form>.loaded(formData: $formData, form: $form, formDataUpdateStatus: $formDataUpdateStatus)';
  }
}

/// @nodoc
abstract mixin class $FooFormV2LoadedCopyWith<
    FormData,
    Form extends HasFormV2Group,
    $Res> implements $FooFormV2StateCopyWith<FormData, Form, $Res> {
  factory $FooFormV2LoadedCopyWith(FooFormV2Loaded<FormData, Form> value,
          $Res Function(FooFormV2Loaded<FormData, Form>) _then) =
      _$FooFormV2LoadedCopyWithImpl;
  @useResult
  $Res call(
      {FormData formData,
      Form form,
      FooFormV2DataUpdateStatus formDataUpdateStatus});
}

/// @nodoc
class _$FooFormV2LoadedCopyWithImpl<FormData, Form extends HasFormV2Group, $Res>
    implements $FooFormV2LoadedCopyWith<FormData, Form, $Res> {
  _$FooFormV2LoadedCopyWithImpl(this._self, this._then);

  final FooFormV2Loaded<FormData, Form> _self;
  final $Res Function(FooFormV2Loaded<FormData, Form>) _then;

  /// Create a copy of FooFormV2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formData = freezed,
    Object? form = null,
    Object? formDataUpdateStatus = null,
  }) {
    return _then(FooFormV2Loaded<FormData, Form>(
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
              as FooFormV2DataUpdateStatus,
    ));
  }
}

/// @nodoc

class FooFormV2FailedLoading<FormData, Form extends HasFormV2Group>
    implements FooFormV2State<FormData, Form> {
  FooFormV2FailedLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooFormV2FailedLoading<FormData, Form>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FooFormV2State<$FormData, $Form>.failedLoading()';
  }
}

// dart format on
