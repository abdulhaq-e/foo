import 'dart:convert';

import 'package:api_tools/api_tools.dart';
import 'package:api_tools/src/testing.dart';
import 'package:foo/app-core.dart';
import 'package:foo/app-core-testing.dart';
import 'package:foo/core.dart';
import 'package:test/test.dart';

// Test command
class RegisterStudentCommand {
  final String name;
  final String email;

  const RegisterStudentCommand({required this.name, required this.email});

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}

void main() {
  group('JsonRemoteMessageHandlerHelper.createAsyncCommandHandler', () {
    late APIClientTestDouble apiClient;

    Endpoint endpointBuilder(RegisterStudentCommand command) => Endpoint(
      httpMethod: HttpMethod.post,
      path: 'api/students',
      headers: {},
    );

    setUp(() {
      apiClient = APIClientTestDouble(
        requestCallback: (endpoint) async => dummyAPIResponse(),
      );
    });

    test('returns AsyncCommandResponse for HTTP 202', () async {
      apiClient = APIClientTestDouble(
        requestCallback: (endpoint) async =>
            AsyncResponseHelpers.accepted('op-abc-123'),
      );

      final handler =
          JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
            apiClient: apiClient,
            endpointBuilder: endpointBuilder,
          );

      final command = RegisterStudentCommand(
        name: 'John Doe',
        email: 'john@example.com',
      );

      final result = await handler(command);

      expect(result.operationId, equals('op-abc-123'));
    });

    group('Error Handling', () {
      test('handles API errors', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            throw Exception('API Error: Internal Server Error');
          },
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
              apiClient: apiClient,
              endpointBuilder: endpointBuilder,
            );

        expect(
          () => handler(
            RegisterStudentCommand(name: 'Test', email: 'test@example.com'),
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('handles network errors', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            throw Exception('Network connection failed');
          },
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
              apiClient: apiClient,
              endpointBuilder: endpointBuilder,
            );

        expect(
          () => handler(
            RegisterStudentCommand(name: 'Test', email: 'test@example.com'),
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('throws when operationId is missing from the 202 body', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode({"invalid": "no operationId here"})),
            statusCode: 202,
            headers: {},
          ),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncCommandHandler(
              apiClient: apiClient,
              endpointBuilder: endpointBuilder,
            );

        expect(
          () => handler(
            RegisterStudentCommand(name: 'Test', email: 'test@example.com'),
          ),
          throwsA(anything),
        );
      });
    });
  });
}
