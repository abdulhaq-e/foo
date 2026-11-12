import 'composite_response_handler/composite_response_handler_exceptions.dart';
import 'operation_poller.dart';

/// A sentence the user can act on, taken from [error], or `null` when
/// [error] carries nothing worth showing.
///
/// For a [ProblemDetailsException] this is the server's own explanation:
/// `detail` (specific to this occurrence) first, then `title` (the problem
/// type's summary). An [OperationPollingTimeoutException] gets a fixed
/// explanation, since it is not really a failure. Everything else (a
/// decoding bug, an unexpected exception) returns `null`, so callers fall
/// back to their own generic wording rather than leaking an exception's
/// `toString()` to the user.
///
/// Pair it with a headline that says *what* failed, e.g. with
/// `showErrorSnackBar(context, title: 'Approve failed', message: ...)`.
String? errorMessage(Object? error) {
  return switch (error) {
    ProblemDetailsException(:final detail?) when detail.trim().isNotEmpty =>
      detail.trim(),
    ProblemDetailsException(:final title?) when title.trim().isNotEmpty =>
      title.trim(),
    OperationPollingTimeoutException() =>
      'This is taking longer than expected. It may still finish, so check '
          'back shortly before trying again.',
    _ => null,
  };
}
