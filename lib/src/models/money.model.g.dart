// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FooMoneyImpl _$$FooMoneyImplFromJson(Map<String, dynamic> json) =>
    _$FooMoneyImpl(
      value: (json['value'] as num).toInt(),
      scale: (json['scale'] as num).toInt(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$FooMoneyImplToJson(_$FooMoneyImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'scale': instance.scale,
      'currency': instance.currency,
    };
