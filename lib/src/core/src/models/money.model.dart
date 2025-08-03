import 'dart:math';

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

  factory FooMoney.fromDecimal(Decimal decimal, String currency) {
    final scale = decimal.scale;
    final value = decimal.shift(scale).toBigInt().toInt();
    return FooMoney(value: value, scale: scale, currency: currency);
  }

  FooMoney operator +(FooMoney other) {
    if (currency != other.currency) {
      throw ArgumentError('Cannot add FooMoney with different currencies.');
    }
    if (scale == other.scale) {
      return copyWith(value: value + other.value);
    }
    final newScale = max(scale, other.scale);
    final m1 = withScale(newScale);
    final m2 = other.withScale(newScale);
    return m1 + m2;
  }

  /// Subtracts another FooMoney object.
  FooMoney operator -(FooMoney other) {
    return this + (-other);
  }

  FooMoney operator -() {
    return copyWith(value: -value);
  }

  FooMoney operator *(int multiplier) {
    return copyWith(value: value * multiplier);
  }

  FooMoney operator ~/(int divisor) {
    if (divisor == 0) throw ArgumentError('Cannot divide by zero.');
    return copyWith(value: value ~/ divisor);
  }

  FooMoney times(Decimal multiplier) {
    final asDecimal = toDecimal();

    final resultDecimal = asDecimal * multiplier;

    return FooMoney.fromDecimal(resultDecimal, currency);
  }

  FooMoney timesDouble(double multiplier) {
    final multiplierDecimal = Decimal.parse(multiplier.toString());
    return times(multiplierDecimal);
  }

  FooMoney withScale(int newScale) {
    if (newScale == scale) {
      return this;
    }
    final factor = BigInt.from(10).pow(newScale - scale);
    final newValue = BigInt.from(value) * factor;
    return copyWith(value: newValue.toInt(), scale: newScale);
  }

  // --- COMPARISON ---

  int compareTo(FooMoney other) {
    if (currency != other.currency) {
      throw ArgumentError('Cannot compare FooMoney with different currencies.');
    }
    // Rescale to a common base for comparison
    final commonScale = max(scale, other.scale);
    final thisValue = withScale(commonScale).value;
    final otherValue = other.withScale(commonScale).value;
    return thisValue.compareTo(otherValue);
  }

  // You also get <, <=, >, >= for free by implementing Comparable.
  bool operator >(FooMoney other) => compareTo(other) > 0;
  bool operator <(FooMoney other) => compareTo(other) < 0;
  bool operator >=(FooMoney other) => compareTo(other) >= 0;
  bool operator <=(FooMoney other) => compareTo(other) <= 0;
}
