import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'money.model.freezed.dart';
part 'money.model.g.dart';

@freezed
abstract class FooMoney with _$FooMoney {
  const factory FooMoney({
    required int value,
    required int scale,
    required String currency,
  }) = _FooMoney;

  const FooMoney._();

  factory FooMoney.fromJson(Map<String, Object?> json) =>
      _$FooMoneyFromJson(json);

  String format([String? locale]) {
    var valueString = this.value.toString();
    final valueStringLength = valueString.length;
    if (valueStringLength <= scale) {
      valueString = valueString.padLeft(scale, '0');
    }
    final firstPart = valueString.substring(0, valueStringLength - scale);
    final secondPart = valueString.substring(
      valueStringLength - scale,
      valueStringLength,
    );
    final value = Decimal.parse('$firstPart.$secondPart');
    final formatter = DecimalFormatter(NumberFormat.decimalPattern(locale));
    return formatter.format(value);
  }
}
