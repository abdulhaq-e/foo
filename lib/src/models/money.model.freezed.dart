// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FooMoney _$FooMoneyFromJson(Map<String, dynamic> json) {
  return _FooMoney.fromJson(json);
}

/// @nodoc
mixin _$FooMoney {
  int get value => throw _privateConstructorUsedError;
  int get scale => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this FooMoney to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FooMoneyCopyWith<FooMoney> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FooMoneyCopyWith<$Res> {
  factory $FooMoneyCopyWith(FooMoney value, $Res Function(FooMoney) then) =
      _$FooMoneyCopyWithImpl<$Res, FooMoney>;
  @useResult
  $Res call({int value, int scale, String currency});
}

/// @nodoc
class _$FooMoneyCopyWithImpl<$Res, $Val extends FooMoney>
    implements $FooMoneyCopyWith<$Res> {
  _$FooMoneyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? scale = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FooMoneyImplCopyWith<$Res>
    implements $FooMoneyCopyWith<$Res> {
  factory _$$FooMoneyImplCopyWith(
          _$FooMoneyImpl value, $Res Function(_$FooMoneyImpl) then) =
      __$$FooMoneyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, int scale, String currency});
}

/// @nodoc
class __$$FooMoneyImplCopyWithImpl<$Res>
    extends _$FooMoneyCopyWithImpl<$Res, _$FooMoneyImpl>
    implements _$$FooMoneyImplCopyWith<$Res> {
  __$$FooMoneyImplCopyWithImpl(
      _$FooMoneyImpl _value, $Res Function(_$FooMoneyImpl) _then)
      : super(_value, _then);

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? scale = null,
    Object? currency = null,
  }) {
    return _then(_$FooMoneyImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FooMoneyImpl extends _FooMoney with DiagnosticableTreeMixin {
  const _$FooMoneyImpl(
      {required this.value, required this.scale, required this.currency})
      : super._();

  factory _$FooMoneyImpl.fromJson(Map<String, dynamic> json) =>
      _$$FooMoneyImplFromJson(json);

  @override
  final int value;
  @override
  final int scale;
  @override
  final String currency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FooMoney(value: $value, scale: $scale, currency: $currency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FooMoney'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('scale', scale))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  fool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooMoneyImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, scale, currency);

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FooMoneyImplCopyWith<_$FooMoneyImpl> get copyWith =>
      __$$FooMoneyImplCopyWithImpl<_$FooMoneyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FooMoneyImplToJson(
      this,
    );
  }
}

abstract class _FooMoney extends FooMoney {
  const factory _FooMoney(
      {required final int value,
      required final int scale,
      required final String currency}) = _$FooMoneyImpl;
  const _FooMoney._() : super._();

  factory _FooMoney.fromJson(Map<String, dynamic> json) =
      _$FooMoneyImpl.fromJson;

  @override
  int get value;
  @override
  int get scale;
  @override
  String get currency;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FooMoneyImplCopyWith<_$FooMoneyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
