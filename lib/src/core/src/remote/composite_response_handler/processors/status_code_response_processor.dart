import 'package:api_tools/api_tools.dart';
import '../composite_response_handler_core.dart';
import '../composite_response_handler_exceptions.dart';

class StatusCodeProcessor implements ResponseProcessor {
  final Set<int> _validStatusCodes;
  final Map<int, Exception Function(APIResponse)> _statusExceptionMap;

  StatusCodeProcessor({
    Set<int>? validStatusCodes,
    Map<int, Exception Function(APIResponse)>? statusExceptionMap,
  }) : _validStatusCodes = validStatusCodes ?? {200, 201, 202, 204},
       _statusExceptionMap = statusExceptionMap ?? {};

  @override
  void call(ResponseContext context) {
    final statusCode = context.apiResponse.statusCode;

    if (_statusExceptionMap.containsKey(statusCode)) {
      throw _statusExceptionMap[statusCode]!(context.apiResponse);
    }

    if (!_validStatusCodes.contains(statusCode)) {
      throw HttpStatusException(statusCode, context.apiResponse);
    }
  }

  static StatusCodeProcessor ok200Range() => StatusCodeProcessor(
    validStatusCodes: {for (int i = 200; i <= 299; i++) i},
  );

  static StatusCodeProcessor specific(Set<int> statusCodes) =>
      StatusCodeProcessor(validStatusCodes: statusCodes);
}
