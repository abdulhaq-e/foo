// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FooMoney implements DiagnosticableTreeMixin {
  int get value;
  int get scale;
  String get currency;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FooMoneyCopyWith<FooMoney> get copyWith =>
      _$FooMoneyCopyWithImpl<FooMoney>(this as FooMoney, _$identity);

  /// Serializes this FooMoney to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FooMoney'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('scale', scale))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooMoney &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, scale, currency);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FooMoney(value: $value, scale: $scale, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $FooMoneyCopyWith<$Res> {
  factory $FooMoneyCopyWith(FooMoney value, $Res Function(FooMoney) _then) =
      _$FooMoneyCopyWithImpl;
  @useResult
  $Res call({int value, int scale, String currency});
}

/// @nodoc
class _$FooMoneyCopyWithImpl<$Res> implements $FooMoneyCopyWith<$Res> {
  _$FooMoneyCopyWithImpl(this._self, this._then);

  final FooMoney _self;
  final $Res Function(FooMoney) _then;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? scale = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _self.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FooMoney extends FooMoney with DiagnosticableTreeMixin {
  const _FooMoney(
      {required this.value, required this.scale, required this.currency})
      : super._();
  factory _FooMoney.fromJson(Map<String, dynamic> json) =>
      _$FooMoneyFromJson(json);

  @override
  final int value;
  @override
  final int scale;
  @override
  final String currency;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FooMoneyCopyWith<_FooMoney> get copyWith =>
      __$FooMoneyCopyWithImpl<_FooMoney>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FooMoneyToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FooMoney'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('scale', scale))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FooMoney &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, scale, currency);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FooMoney(value: $value, scale: $scale, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$FooMoneyCopyWith<$Res>
    implements $FooMoneyCopyWith<$Res> {
  factory _$FooMoneyCopyWith(_FooMoney value, $Res Function(_FooMoney) _then) =
      __$FooMoneyCopyWithImpl;
  @override
  @useResult
  $Res call({int value, int scale, String currency});
}

/// @nodoc
class __$FooMoneyCopyWithImpl<$Res> implements _$FooMoneyCopyWith<$Res> {
  __$FooMoneyCopyWithImpl(this._self, this._then);

  final _FooMoney _self;
  final $Res Function(_FooMoney) _then;

  /// Create a copy of FooMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? scale = null,
    Object? currency = null,
  }) {
    return _then(_FooMoney(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _self.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
