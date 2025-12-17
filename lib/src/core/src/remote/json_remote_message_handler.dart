import 'dart:convert';

import 'package:api_tools/api_tools.dart';
import 'package:foo/core.dart';

typedef AsyncFactory<Input, Output> = Future<Output> Function(Input input);

class JsonRemoteMessageHandler<Message, Response> {
  JsonRemoteMessageHandler({
    required this.apiClient,
    required this.decoder,
    required this.endpointBuilder,
  });
  final APIClient apiClient;
  final Response Function(dynamic data) decoder;
  final Endpoint Function(Message message) endpointBuilder;

  Future<Response> call(Message message) async {
    final responseHandler = CompositeResponseHandler<Response>(
      processors: [
        ProblemDetailsProcessor(),
        StatusCodeProcessor.ok200Range(),
        JsonDataProcessor(),
      ],
      extractor: DataExtractorFactory.create((responseContext) {
        final jsonData = responseContext.get("jsonData");
        return decoder(jsonData);
      }),
    );
    final handler = RemoteMessageHandler<Message, Response>(
      apiClient: apiClient,
      responseHandler: responseHandler.call,
      endpointBuilder: endpointBuilder,
    );
    return handler(message);
  }
}

class JsonRemoteMessageHandlerHelper {
  static AsyncFactory<Input, Output> _createApiHandler<Input, Output>({
    required APIClient apiClient,
    required Output Function(dynamic json) fromJsonT,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return (Input input) async {
      final handler = JsonRemoteMessageHandler<Input, Output>(
        apiClient: apiClient,
        decoder: (responseData) {
          if (responseData == null) {
            return fromJsonT(null);
          }
          try {
            // Try to parse as simple response first (for backward compatibility)
            return fromJsonT(responseData);
          } catch (e) {
            print(responseData);
            print(e);
            rethrow;
          }
        },
        endpointBuilder: endpointBuilder,
      );
      return handler(input);
    };
  }

  static AsyncFactory<Input, Output>
  createApiHandlerForSingularItem<Input, Output>({
    required APIClient apiClient,
    required Output Function(Map<String, Object?> json) fromJsonT,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return JsonRemoteMessageHandlerHelper._createApiHandler(
      apiClient: apiClient,
      fromJsonT: (json) {
        if (json == null) {
          return fromJsonT(<String, Object?>{});
        }
        return fromJsonT(json as Map<String, Object?>);
      },
      endpointBuilder: endpointBuilder,
    );
  }

  static AsyncFactory<Input, List<Output>>
  createApiHandlerForList<Input, Output>({
    required APIClient apiClient,
    required Output Function(Map<String, Object?> json) fromJsonT,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return JsonRemoteMessageHandlerHelper._createApiHandler(
      apiClient: apiClient,
      fromJsonT: (json) =>
          JsonRemoteMessageHandlerHelper.decodeList(json, fromJsonT),
      endpointBuilder: endpointBuilder,
    );
  }

  static AsyncFactory<Input, GenericAPIResponse<T, M>>
  createGenericApiHandler<Input, T, M>({
    required APIClient apiClient,
    required T Function(dynamic json) fromJsonT,
    required M Function(Map<String, Object?> json) fromJsonM,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return JsonRemoteMessageHandlerHelper._createApiHandler(
      apiClient: apiClient,
      fromJsonT: (json) => GenericAPIResponse<T, M>.fromJson(
        json as Map<String, dynamic>,
        fromJsonT,
        (obj) => fromJsonM(obj as Map<String, Object?>),
      ),
      endpointBuilder: endpointBuilder,
    );
  }

  static AsyncFactory<Input, GenericAPIResponse<List<T>, M>>
  createGenericApiHandlerForLists<Input, T, M>({
    required APIClient apiClient,
    required T Function(Map<String, Object?> json) fromJsonT,
    required M Function(Map<String, Object?> json) fromJsonM,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return JsonRemoteMessageHandlerHelper.createGenericApiHandler(
      apiClient: apiClient,
      fromJsonT: (json) =>
          JsonRemoteMessageHandlerHelper.decodeList(json, fromJsonT),
      fromJsonM: fromJsonM,
      endpointBuilder: endpointBuilder,
    );
  }

  static AsyncFactory<Input, GenericAPIResponse<T, M>>
  createGenericApiHandlerForSingularData<Input, T, M>({
    required APIClient apiClient,
    required T Function(Map<String, Object?> json) fromJsonT,
    required M Function(Map<String, Object?> json) fromJsonM,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    return JsonRemoteMessageHandlerHelper.createGenericApiHandler(
      apiClient: apiClient,
      fromJsonT: (obj) => fromJsonT(obj as Map<String, Object?>),
      fromJsonM: fromJsonM,
      endpointBuilder: endpointBuilder,
    );
  }

  static AsyncFactory<Input, DataContainer<T, M>>
  createDataContainerHandlerForSingleItems<Input, T, M>({
    required APIClient apiClient,
    required T Function(Map<String, Object?> json) fromJsonT,
    required M Function(Map<String, Object?> json) fromJsonM,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    final genericHandler = createGenericApiHandlerForSingularData<Input, T, M>(
      apiClient: apiClient,
      fromJsonT: fromJsonT,
      fromJsonM: fromJsonM,
      endpointBuilder: endpointBuilder,
    );

    return (Input input) async {
      final response = await genericHandler(input);
      return DataContainer<T, M>(
        data: response.data,
        metadata: response.metadata,
      );
    };
  }

  static AsyncFactory<Input, DataContainer<List<T>, M>>
  createDataContainerHandlerForLists<Input, T, M>({
    required APIClient apiClient,
    required T Function(Map<String, Object?> json) fromJsonT,
    required M Function(Map<String, Object?> json) fromJsonM,
    required Endpoint Function(Input input) endpointBuilder,
  }) {
    final genericHandler = createGenericApiHandlerForLists<Input, T, M>(
      apiClient: apiClient,
      fromJsonT: fromJsonT,
      fromJsonM: fromJsonM,
      endpointBuilder: endpointBuilder,
    );

    return (Input input) async {
      final response = await genericHandler(input);
      return DataContainer<List<T>, M>(
        data: response.data,
        metadata: response.metadata,
      );
    };
  }

  static AsyncFactory<Q, PaginatedDataContainer<T>>
  createPaginatedRemoteQueryHandler<Q, T>({
    required APIClient apiClient,
    required T Function(Map<String, dynamic>) fromJson,
    required String path,
    required Map<String, String> Function(Q) queryParamsBuilder,
  }) => (query) async {
    final apiResponse =
        await JsonRemoteMessageHandlerHelper.createGenericApiHandlerForLists(
          apiClient: apiClient,
          fromJsonT: fromJson,
          fromJsonM: PaginatedResponseMetadata.fromJson,
          endpointBuilder: (Q query) {
            return simpleQueryEndpointFactory(
              path: path,
              queryParameters: queryParamsBuilder(query),
            );
          },
        )(query);

    return PaginatedDataContainer(
      data: apiResponse.data,
      metadata: apiResponse.metadata,
    );
  };

  static List<T> decodeList<T>(
    Object json,
    T Function(Map<String, Object?>) itemFromJson,
  ) {
    if (json is! List) {
      throw FormatException(
        'Expected a List but got ${json.runtimeType}: $json',
      );
    }
    return json
        .map((item) => itemFromJson(item as Map<String, Object?>))
        .toList();
  }

  static T decodeItem<T>(
    Object? json,
    T Function(Map<String, Object?>) itemFromJson,
  ) {
    if (json == null) {
      throw const FormatException('Expected metadata json but received null.');
    }
    return itemFromJson(json as Map<String, Object?>);
  }
}
