// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericAPIResponseData<T, M> _$GenericAPIResponseDataFromJson<T, M>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  M Function(Object? json) fromJsonM,
) => GenericAPIResponseData<T, M>(
  fromJsonT(json['data']),
  fromJsonM(json['metadata']),
);

Map<String, dynamic> _$GenericAPIResponseDataToJson<T, M>(
  GenericAPIResponseData<T, M> instance,
  Object? Function(T value) toJsonT,
  Object? Function(M value) toJsonM,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'metadata': toJsonM(instance.metadata),
};
