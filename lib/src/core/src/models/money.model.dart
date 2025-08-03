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

  Decimal toDecimal() {
    final decimalValue = Decimal.fromInt(value);

    return decimalValue.shift(-scale);
  }

  String format([String? locale]) {
    final decimalValue = toDecimal();

    final numberFormat = NumberFormat.currency(
      locale: locale,
      name: currency,
    );

    final formatter = DecimalFormatter(numberFormat);
    return formatter.format(decimalValue);
  }
}
