import 'package:foo/app-core.dart';
import 'package:test/test.dart';

void main() {
  group('errorMessage', () {
    test('prefers the problem detail', () {
      final error = ProblemDetailsException({
        'title': 'Conflict',
        'detail': 'This gradebook was already submitted.',
      }, 409);

      expect(errorMessage(error), 'This gradebook was already submitted.');
    });

    test('falls back to the problem title when there is no detail', () {
      final error = ProblemDetailsException({'title': 'Not allowed'}, 403);

      expect(errorMessage(error), 'Not allowed');
    });

    test('skips a blank detail', () {
      final error = ProblemDetailsException({
        'title': 'Not allowed',
        'detail': '  ',
      }, 403);

      expect(errorMessage(error), 'Not allowed');
    });

    test('says a timed-out operation may still finish', () {
      expect(
        errorMessage(OperationPollingTimeoutException('op-1')),
        contains('may still finish'),
      );
    });

    test('is null for errors that carry nothing user-facing', () {
      expect(errorMessage(Exception('boom')), isNull);
      expect(errorMessage(const FormatException('bad json')), isNull);
      expect(errorMessage(null), isNull);
    });
  });
}
