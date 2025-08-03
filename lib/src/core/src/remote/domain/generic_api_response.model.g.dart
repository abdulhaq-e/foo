// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericAPIResponseData<T, M> _$GenericAPIResponseDataFromJson<T, M>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  M Function(Object? json) fromJsonM,
) =>
    GenericAPIResponseData<T, M>(
      fromJsonT(json['data']),
      fromJsonM(json['metadata']),
    );
