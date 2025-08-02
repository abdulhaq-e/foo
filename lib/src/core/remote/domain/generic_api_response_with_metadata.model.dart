import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_api_response_with_metadata.model.freezed.dart';
part 'generic_api_response_with_metadata.model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class GenericAPIResponseWithMetadata<T, M>
    with _$GenericAPIResponseWithMetadata<T, M> {
  const factory GenericAPIResponseWithMetadata(T data, M metadata) =
      GenericAPIResponseWithMetadataData;

  factory GenericAPIResponseWithMetadata.fromJson(Map<String, dynamic> json,
          T Function(Object?) fromJsonT, M Function(Object?) fromJsonM) =>
      _$GenericAPIResponseWithMetadataFromJson(json, fromJsonT, fromJsonM);
}
