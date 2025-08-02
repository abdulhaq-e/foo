// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response_with_metadata.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericAPIResponseWithMetadataData<T, M>
    _$GenericAPIResponseWithMetadataDataFromJson<T, M>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  M Function(Object? json) fromJsonM,
) =>
        GenericAPIResponseWithMetadataData<T, M>(
          fromJsonT(json['data']),
          fromJsonM(json['metadata']),
        );

Map<String, dynamic> _$GenericAPIResponseWithMetadataDataToJson<T, M>(
  GenericAPIResponseWithMetadataData<T, M> instance,
  Object? Function(T value) toJsonT,
  Object? Function(M value) toJsonM,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'metadata': toJsonM(instance.metadata),
    };
