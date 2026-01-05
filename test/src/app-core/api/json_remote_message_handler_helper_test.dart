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

// Test response for sync (200) responses
class RegisterStudentResponse {
  final String studentId;
  final String status;

  const RegisterStudentResponse({
    required this.studentId,
    required this.status,
  });

  factory RegisterStudentResponse.fromJson(Map<String, dynamic> json) {
    return RegisterStudentResponse(
      studentId: json['studentId'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'studentId': studentId, 'status': status};
}

void main() {
  group('JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler', () {
    late APIClientTestDouble apiClient;

    setUp(() {
      apiClient = APIClientTestDouble(
        requestCallback: (endpoint) async => dummyAPIResponse(),
      );
    });

    group('HTTP 202 Async Response', () {
      test('returns AsyncCommandResponse for HTTP 202', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              AsyncResponseHelpers.accepted('op-abc-123'),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        final command = RegisterStudentCommand(
          name: 'John Doe',
          email: 'john@example.com',
        );

        final result = await handler(command);

        expect(result, isA<AsyncResult<RegisterStudentResponse>>());

        expect(
          (result as AsyncResult<RegisterStudentResponse>).response.operationId,
          equals('op-abc-123'),
        );
      });
    });

    group('HTTP 200 Sync Response', () {
      test('parses normal response for HTTP 200', () async {
        final responseData = RegisterStudentResponse(
          studentId: 'student-123',
          status: 'enrolled',
        );

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode(responseData.toJson())),
            statusCode: 200,
            headers: {},
          ),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        final result =
            await handler(
                  RegisterStudentCommand(
                    name: 'Alice',
                    email: 'alice@example.com',
                  ),
                )
                as SyncResult<RegisterStudentResponse>;

        expect(result.data.studentId, equals('student-123'));
        expect(result.data.status, equals('enrolled'));
      });

      test('uses fromJsonT to parse response', () async {
        var fromJsonCalled = false;
        Map<String, dynamic>? receivedJson;

        final responseData = RegisterStudentResponse(
          studentId: 'student-456',
          status: 'pending',
        );

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              ApiResponseBuilder.forRawItem(responseData).build(),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: (json) {
                fromJsonCalled = true;
                receivedJson = json;
                return RegisterStudentResponse.fromJson(json);
              },
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        await handler(
          RegisterStudentCommand(name: 'Bob', email: 'bob@example.com'),
        );

        expect(fromJsonCalled, isTrue);
        expect(receivedJson, isNotNull);
        expect(receivedJson!['studentId'], equals('student-456'));
      });

      test('handles null jsonData for 200', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode(null)),
            statusCode: 200,
            headers: {},
          ),
        );

        var fromJsonCalledWithEmpty = false;

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: (json) {
                if (json.isEmpty) {
                  fromJsonCalledWithEmpty = true;
                }
                return RegisterStudentResponse(
                  studentId: 'default',
                  status: 'unknown',
                );
              },
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        final result =
            await handler(
                  RegisterStudentCommand(
                    name: 'Test',
                    email: 'test@example.com',
                  ),
                )
                as SyncResult<RegisterStudentResponse>;

        expect(fromJsonCalledWithEmpty, isTrue);
      });

      test('handles empty JSON for 200', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async =>
              ApiResponseBuilder.forRawItem({}).withStatusCode(200).build(),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: (json) => RegisterStudentResponse(
                studentId: json['studentId'] as String? ?? 'default-id',
                status: json['status'] as String? ?? 'default-status',
              ),
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        final result =
            await handler(
                  RegisterStudentCommand(
                    name: 'Test',
                    email: 'test@example.com',
                  ),
                )
                as SyncResult<RegisterStudentResponse>;

        expect(result.data.studentId, equals('default-id'));
      });
    });

    group('HTTP 201 Created Response', () {
      test('accepts 201 as valid status code', () async {
        final responseData = RegisterStudentResponse(
          studentId: 'student-789',
          status: 'created',
        );

        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => ApiResponseBuilder.forRawItem(
            responseData,
          ).withStatusCode(201).build(),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        final result =
            await handler(
                  RegisterStudentCommand(
                    name: 'Charlie',
                    email: 'charlie@example.com',
                  ),
                )
                as SyncResult<RegisterStudentResponse>;

        expect(result.data.studentId, equals('student-789'));
      });
    });

    group('Error Handling', () {
      test('handles API errors', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            throw Exception('API Error: Internal Server Error');
          },
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
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
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        expect(
          () => handler(
            RegisterStudentCommand(name: 'Test', email: 'test@example.com'),
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('handles malformed async response', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode(jsonEncode({"invalid": "no operationId here"})),
            statusCode: 202,
            headers: {},
          ),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              dynamic
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
            );

        expect(
          () => handler(
            RegisterStudentCommand(name: 'Test', email: 'test@example.com'),
          ),
          throwsA(anything),
          reason: 'Should throw when operationId is missing from 202 response',
        );
      });

      test('handles malformed JSON in sync response', () async {
        apiClient = APIClientTestDouble(
          requestCallback: (endpoint) async => APIResponse(
            data: utf8.encode('invalid-json'),
            statusCode: 200,
            headers: {},
          ),
        );

        final handler =
            JsonRemoteMessageHandlerHelper.createAsyncAwareCommandHandler<
              RegisterStudentCommand,
              RegisterStudentResponse
            >(
              apiClient: apiClient,
              fromJsonT: RegisterStudentResponse.fromJson,
              endpointBuilder: (command) => Endpoint(
                httpMethod: HttpMethod.post,
                path: 'api/students',
                headers: {},
              ),
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
