import 'dart:convert';
import 'dart:typed_data';

import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';
import 'package:test/test.dart';

APIResponse jsonResponse(int statusCode, Object? data) => APIResponse(
  data: Uint8List.fromList(utf8.encode(jsonEncode(data))),
  headers: {},
  statusCode: statusCode,
);

APIResponse operation(String status, [Map<String, Object?> extra = const {}]) =>
    jsonResponse(200, {
      'operationId': 'op-1',
      'nawatAppName': 'learning',
      'commandType': 'SomeCommand',
      'status': status,
      'actorId': 'user-1',
      ...extra,
    });

/// Replays [responses] in order, repeating the last one once exhausted.
/// A response may be an [Exception] to throw instead.
class ScriptedAPIClient implements APIClient {
  ScriptedAPIClient(this.responses);

  final List<Object> responses;
  final List<Endpoint> endpoints = [];

  @override
  Future<APIResponse> request(Endpoint endpoint) async {
    endpoints.add(endpoint);
    final index = endpoints.length - 1;
    final response = responses[index < responses.length
        ? index
        : responses.length - 1];
    if (response is Exception) throw response;
    return response as APIResponse;
  }

  @override
  Future<APIResponse> requestMultipart(EndpointMultipart endpoint) =>
      throw UnimplementedError();
}

/// Virtual clock: sleeping advances time instead of waiting.
class VirtualClock {
  var _time = DateTime(2026);
  final List<Duration> sleeps = [];

  DateTime now() => _time;

  Future<void> sleep(Duration duration) async {
    sleeps.add(duration);
    _time = _time.add(duration);
  }

  OperationPollingOptions options({
    Duration timeout = const Duration(seconds: 30),
    Duration initialInterval = const Duration(milliseconds: 250),
    Duration maxInterval = const Duration(seconds: 2),
    double backoffFactor = 1.5,
  }) => OperationPollingOptions(
    timeout: timeout,
    initialInterval: initialInterval,
    maxInterval: maxInterval,
    backoffFactor: backoffFactor,
    sleep: sleep,
    now: now,
  );
}

void main() {
  group('pollOperation', () {
    test('returns the result once the operation succeeds', () async {
      final apiClient = ScriptedAPIClient([
        operation('pending'),
        operation('pending'),
        operation('succeeded', {
          'result': {'orderId': 'o-1'},
        }),
      ]);

      final result = await pollOperation(
        apiClient,
        'op-1',
        options: VirtualClock().options(),
      );

      expect(result, {'orderId': 'o-1'});
      expect(apiClient.endpoints, hasLength(3));
      expect(
        apiClient.endpoints.last.path,
        'api/queries/v1/operations/op-1',
      );
    });

    test('backs off between checks up to maxInterval', () async {
      final apiClient = ScriptedAPIClient([
        operation('pending'),
        operation('pending'),
        operation('pending'),
        operation('succeeded'),
      ]);
      final clock = VirtualClock();

      await pollOperation(
        apiClient,
        'op-1',
        options: clock.options(
          initialInterval: const Duration(milliseconds: 100),
          backoffFactor: 2,
          maxInterval: const Duration(milliseconds: 300),
        ),
      );

      expect(clock.sleeps, const [
        Duration(milliseconds: 100),
        Duration(milliseconds: 200),
        Duration(milliseconds: 300),
        Duration(milliseconds: 300),
      ]);
    });

    test(
      "throws ProblemDetailsException with the operation's problem when it fails",
      () async {
        final apiClient = ScriptedAPIClient([
          operation('failed', {
            'problem': {
              'type': 'about:blank',
              'title': 'Insufficient balance',
              'status': 422,
            },
          }),
        ]);

        final error = await pollOperation(
          apiClient,
          'op-1',
          options: VirtualClock().options(),
        ).then<Object?>((_) => null, onError: (Object e) => e);

        expect(error, isA<ProblemDetailsException>());
        error as ProblemDetailsException;
        expect(error.title, 'Insufficient balance');
        expect(error.statusCode, 422);
      },
    );

    test(
      'throws ProblemDetailsException with a fallback when a failed operation has no problem',
      () async {
        final apiClient = ScriptedAPIClient([
          operation('failed', {'problem': null}),
        ]);

        final error = await pollOperation(
          apiClient,
          'op-1',
          options: VirtualClock().options(),
        ).then<Object?>((_) => null, onError: (Object e) => e);

        expect(error, isA<ProblemDetailsException>());
        expect((error as ProblemDetailsException).statusCode, 400);
      },
    );

    test(
      'throws OperationPollingTimeoutException when still pending after the timeout',
      () async {
        final apiClient = ScriptedAPIClient([operation('pending')]);

        final error = await pollOperation(
          apiClient,
          'op-1',
          options: VirtualClock().options(timeout: const Duration(seconds: 1)),
        ).then<Object?>((_) => null, onError: (Object e) => e);

        expect(error, isA<OperationPollingTimeoutException>());
        expect((error as OperationPollingTimeoutException).operationId, 'op-1');
      },
    );

    test('keeps polling through a 5xx on the status check', () async {
      final apiClient = ScriptedAPIClient([
        jsonResponse(503, {'title': 'Service Unavailable', 'status': 503}),
        operation('succeeded', {
          'result': {'orderId': 'o-1'},
        }),
      ]);

      final result = await pollOperation(
        apiClient,
        'op-1',
        options: VirtualClock().options(),
      );

      expect(result, {'orderId': 'o-1'});
      expect(apiClient.endpoints, hasLength(2));
    });

    test('keeps polling through a network error on the status check', () async {
      final apiClient = ScriptedAPIClient([
        APIError(
          response: jsonResponse(0, null),
          type: APIErrorType.general,
          error: Exception('offline'),
        ),
        operation('succeeded'),
      ]);

      final result = await pollOperation(
        apiClient,
        'op-1',
        options: VirtualClock().options(),
      );

      expect(result, isNull);
    });

    test(
      'throws OperationPollingTimeoutException when the status check keeps failing transiently',
      () async {
        final apiClient = ScriptedAPIClient([
          jsonResponse(500, {'title': 'Internal Server Error', 'status': 500}),
        ]);

        expect(
          pollOperation(
            apiClient,
            'op-1',
            options: VirtualClock().options(
              timeout: const Duration(seconds: 1),
            ),
          ),
          throwsA(isA<OperationPollingTimeoutException>()),
        );
      },
    );

    test('propagates a 404 from the operations endpoint', () async {
      final apiClient = ScriptedAPIClient([
        jsonResponse(404, {'title': 'Not Found', 'status': 404}),
      ]);

      expect(
        pollOperation(apiClient, 'op-1', options: VirtualClock().options()),
        throwsA(isA<ProblemDetailsException>()),
      );
    });
  });

  group('JsonRemoteMessageHandlerHelper.createCommandHandler', () {
    Endpoint endpointBuilder(Object? _) => Endpoint(
      path: 'api/commands/v2/thing',
      httpMethod: HttpMethod.post,
      headers: {},
    );

    test('does not poll when the command completes synchronously', () async {
      final apiClient = ScriptedAPIClient([
        jsonResponse(201, {'id': 'thing-1'}),
      ]);

      final result = await JsonRemoteMessageHandlerHelper.createCommandHandler(
        apiClient: apiClient,
        fromJsonT: (json) => json['id'],
        endpointBuilder: endpointBuilder,
      )(null);

      expect(result, 'thing-1');
      expect(apiClient.endpoints, hasLength(1));
    });

    test('handles a synchronous response with an empty body', () async {
      final apiClient = ScriptedAPIClient([jsonResponse(200, null)]);

      await JsonRemoteMessageHandlerHelper.createCommandHandler(
        apiClient: apiClient,
        fromJsonT: (_) {},
        endpointBuilder: endpointBuilder,
      )(null);

      expect(apiClient.endpoints, hasLength(1));
    });

    test('polls the operation after a 202 by default', () async {
      final apiClient = ScriptedAPIClient([
        jsonResponse(202, {'operationId': 'op-1'}),
        operation('pending'),
        operation('succeeded', {
          'result': {'id': 'thing-1'},
        }),
      ]);

      final result = await JsonRemoteMessageHandlerHelper.createCommandHandler(
        apiClient: apiClient,
        fromJsonT: (json) => json['id'],
        endpointBuilder: endpointBuilder,
        pollingOptions: VirtualClock().options(),
      )(null);

      expect(result, 'thing-1');
      expect(apiClient.endpoints, hasLength(3));
      expect(
        apiClient.endpoints.last.path,
        'api/queries/v1/operations/op-1',
      );
    });

    test('rejects when the polled operation fails', () async {
      final apiClient = ScriptedAPIClient([
        jsonResponse(202, {'operationId': 'op-1'}),
        operation('failed', {
          'problem': {'title': 'Rejected', 'status': 400},
        }),
      ]);

      expect(
        JsonRemoteMessageHandlerHelper.createCommandHandler(
          apiClient: apiClient,
          fromJsonT: (_) {},
          endpointBuilder: endpointBuilder,
          pollingOptions: VirtualClock().options(),
        )(null),
        throwsA(isA<ProblemDetailsException>()),
      );
    });

    test(
      'resolves on 202 without polling when awaitOperation is false',
      () async {
        final apiClient = ScriptedAPIClient([
          jsonResponse(202, {'operationId': 'op-1'}),
        ]);

        final result =
            await JsonRemoteMessageHandlerHelper.createCommandHandler(
              apiClient: apiClient,
              fromJsonT: (json) => json['operationId'],
              endpointBuilder: endpointBuilder,
              awaitOperation: false,
            )(null);

        expect(result, 'op-1');
        expect(apiClient.endpoints, hasLength(1));
      },
    );

    test('throws when a 202 has no operationId', () async {
      final apiClient = ScriptedAPIClient([jsonResponse(202, {})]);

      expect(
        JsonRemoteMessageHandlerHelper.createCommandHandler(
          apiClient: apiClient,
          fromJsonT: (_) {},
          endpointBuilder: endpointBuilder,
        )(null),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
