// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FooMoney _$FooMoneyFromJson(Map<String, dynamic> json) => _FooMoney(
      value: (json['value'] as num).toInt(),
      scale: (json['scale'] as num).toInt(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$FooMoneyToJson(_FooMoney instance) => <String, dynamic>{
      'value': instance.value,
      'scale': instance.scale,
      'currency': instance.currency,
    };
