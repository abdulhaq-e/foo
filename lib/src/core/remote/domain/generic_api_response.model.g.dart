// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericAPIResponseDataImpl<T> _$$GenericAPIResponseDataImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$GenericAPIResponseDataImpl<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$$GenericAPIResponseDataImplToJson<T>(
  _$GenericAPIResponseDataImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
