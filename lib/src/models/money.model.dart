import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

part 'money.model.freezed.dart';
part 'money.model.g.dart';

@freezed
class FooMoney with _$FooMoney {
  const factory FooMoney({
    required int value,
    required int scale,
    required String currency,
  }) = _FooMoney;

  const FooMoney._();

  factory FooMoney.fromJson(Map<String, Object?> json) =>
      _$FooMoneyFromJson(json);

  String format([String? locale = null]) {
    var valueString = this.value.toString();
    var valueStringLength = valueString.length;
    if (valueStringLength <= this.scale) {
      valueString = valueString.padLeft(this.scale, '0');
    }
    var firstPart = valueString.substring(0, valueStringLength - this.scale);
    var secondPart = valueString.substring(
        valueStringLength - this.scale, valueStringLength);
    var value = Decimal.parse('$firstPart.$secondPart');
    var formatter = NumberFormat.decimalPattern(locale ?? 'en-UK');
    return formatter.format(value);
  }
}
