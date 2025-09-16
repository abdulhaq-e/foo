import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_api_response.model.freezed.dart';
part 'generic_api_response.model.g.dart';

@Freezed(genericArgumentFactories: true, fromJson: true, toJson: true)
sealed class GenericAPIResponse<T, M> with _$GenericAPIResponse<T, M> {
  const factory GenericAPIResponse(T data, M metadata) = GenericAPIResponseData;

  factory GenericAPIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
    M Function(Object?) fromJsonM,
  ) =>
      _$GenericAPIResponseFromJson(
        json,
        fromJsonT,
        fromJsonM,
      );
}
