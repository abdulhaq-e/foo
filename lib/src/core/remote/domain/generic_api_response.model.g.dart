// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericAPIResponseData<T> _$GenericAPIResponseDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericAPIResponseData<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$GenericAPIResponseDataToJson<T>(
  GenericAPIResponseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
