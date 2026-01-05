import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_status.model.freezed.dart';
part 'operation_status.model.g.dart';

/// Status values returned by the operation status endpoint.
enum OperationStatusValue {
  /// Operation is still being processed.
  @JsonValue('pending')
  pending,

  /// Operation completed successfully.
  @JsonValue('success')
  success,

  /// Operation failed with an error.
  @JsonValue('failed')
  failed,
}

/// Response from polling the operation status endpoint.
///
/// This model represents the response structure when polling for an async operation's status.
/// The status endpoint should return this format:
/// ```json
/// {
///   "status": "pending|success|failed",
///   "data": {...},      // optional, present on success
///   "error": {...}      // optional, present on failure
/// }
/// ```
@freezed
abstract class OperationStatus with _$OperationStatus {
  const factory OperationStatus({
    required OperationStatusValue status,
    Map<String, dynamic>? data,
    Map<String, dynamic>? error,
  }) = _OperationStatus;

  factory OperationStatus.fromJson(Map<String, dynamic> json) =>
      _$OperationStatusFromJson(json);
}
