import 'dart:async';
import 'dart:math' as math;

import 'package:api_tools/api_tools.dart';
import 'package:foo/app-core.dart';

enum OperationState { pending, succeeded, failed }

/// Mirrors `Operation` in nawat's operations app
/// (`GET api/queries/v1/operations/{operationId}`).
class Operation {
  final String operationId;
  final String nawatAppName;
  final String commandType;
  final OperationState status;
  final String? actorId;
  final String? label;
  final Map<String, dynamic>? result;
  final Map<String, dynamic>? problem;

  const Operation({
    required this.operationId,
    required this.nawatAppName,
    required this.commandType,
    required this.status,
    this.actorId,
    this.label,
    this.result,
    this.problem,
  });

  factory Operation.fromJson(Map<String, Object?> json) => Operation(
    operationId: json['operationId'] as String,
    nawatAppName: json['nawatAppName'] as String,
    commandType: json['commandType'] as String,
    status: OperationState.values.byName(json['status'] as String),
    actorId: json['actorId'] as String?,
    label: json['label'] as String?,
    result: json['result'] as Map<String, dynamic>?,
    problem: json['problem'] as Map<String, dynamic>?,
  );
}

class OperationPollingOptions {
  /// Give up after this long.
  final Duration timeout;

  /// Delay before the first status check.
  final Duration initialInterval;

  /// Upper bound for the backoff delay.
  final Duration maxInterval;

  /// Multiplier applied to the delay after each pending check.
  final double backoffFactor;

  /// Injectable for tests.
  final Future<void> Function(Duration duration)? sleep;

  /// Injectable for tests.
  final DateTime Function()? now;

  const OperationPollingOptions({
    this.timeout = const Duration(seconds: 30),
    this.initialInterval = const Duration(milliseconds: 250),
    this.maxInterval = const Duration(seconds: 2),
    this.backoffFactor = 1.5,
    this.sleep,
    this.now,
  });
}

/// Thrown when an accepted (202) command is still `pending` after the client
/// stops polling. The command may still complete, so callers must not report
/// it as failed — retrying could apply it twice.
class OperationPollingTimeoutException implements Exception {
  final String operationId;

  OperationPollingTimeoutException(this.operationId);

  @override
  String toString() =>
      'OperationPollingTimeoutException: operation $operationId did not '
      'complete within the polling timeout';
}

Endpoint operationEndpoint(String operationId) =>
    simpleQueryEndpointFactory(path: 'api/queries/v1/operations/$operationId');

/// Errors worth retrying while polling: the command was already accepted, so a
/// network blip or a 5xx/429 on the status check says nothing about its outcome.
bool _isTransientPollingError(Object error) {
  if (error is APIError) {
    return true;
  }
  final statusCode = switch (error) {
    HttpStatusException(:final statusCode) => statusCode,
    ProblemDetailsException(:final statusCode) => statusCode,
    _ => null,
  };
  return statusCode != null && (statusCode >= 500 || statusCode == 429);
}

ProblemDetailsException _failedOperationException(Operation operation) {
  final problem =
      operation.problem ??
      {
        'type': 'about:blank',
        'title': 'Command failed',
        'detail': '${operation.commandType} failed without problem details.',
        'status': 400,
      };
  return ProblemDetailsException(problem, (problem['status'] as int?) ?? 400);
}

/// Polls an operation until it reaches a terminal status.
///
/// Returns the operation's `result` on success. Throws
/// [ProblemDetailsException] when the operation failed,
/// [OperationPollingTimeoutException] when it is still pending (or its status
/// could not be read) after [OperationPollingOptions.timeout]. Transient
/// status-check errors are retried.
Future<Map<String, dynamic>?> pollOperation(
  APIClient apiClient,
  String operationId, {
  OperationPollingOptions options = const OperationPollingOptions(),
}) async {
  final sleep = options.sleep ?? Future<void>.delayed;
  final now = options.now ?? DateTime.now;

  final handler = JsonRemoteMessageHandler<String, Operation>(
    apiClient: apiClient,
    decoder: (json) => Operation.fromJson(json as Map<String, Object?>),
    endpointBuilder: operationEndpoint,
  );

  final deadline = now().add(options.timeout);
  var interval = options.initialInterval;

  while (true) {
    final remaining = deadline.difference(now());
    await sleep(
      remaining.isNegative
          ? Duration.zero
          : (interval < remaining ? interval : remaining),
    );

    Operation? operation;
    try {
      operation = await handler(operationId);
    } catch (error) {
      if (!_isTransientPollingError(error)) {
        rethrow;
      }
    }

    switch (operation?.status) {
      case OperationState.succeeded:
        return operation!.result;
      case OperationState.failed:
        throw _failedOperationException(operation!);
      case OperationState.pending || null:
        break;
    }

    if (!now().isBefore(deadline)) {
      throw OperationPollingTimeoutException(operationId);
    }

    interval = Duration(
      microseconds: math.min(
        (interval.inMicroseconds * options.backoffFactor).round(),
        options.maxInterval.inMicroseconds,
      ),
    );
  }
}
