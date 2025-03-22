import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_api_response.model.freezed.dart';
part 'generic_api_response.model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class GenericAPIResponse<T> with _$GenericAPIResponse<T> {
  const factory GenericAPIResponse(T data) = GenericAPIResponseData;

  factory GenericAPIResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$GenericAPIResponseFromJson(json, fromJsonT);
}
