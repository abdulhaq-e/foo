import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_api_response.model.freezed.dart';
part 'generic_api_response.model.g.dart';

T Function(Object?) generateFromJsonT<T>(T Function(Object? json) fromJsonT) {
  T fromJson(Object? json) {
    if (json is List && T.toString().startsWith('List<')) {
      return json.map((e) => fromJsonT(e)).toList() as T;
    }
    return fromJsonT(json);
  }

  return fromJson;
}

@Freezed(genericArgumentFactories: true, toJson: false)
sealed class GenericAPIResponse<T, M> with _$GenericAPIResponse<T, M> {
  const factory GenericAPIResponse(T data, M metadata) = GenericAPIResponseData;

  factory GenericAPIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
    M Function(Object?) fromJsonM,
  ) =>
      _$GenericAPIResponseFromJson(
        json,
        generateFromJsonT(fromJsonT),
        fromJsonM,
      );
}
