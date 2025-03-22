import 'package:uuid/uuid.dart';

import 'api_command.model.dart';

var uuid = Uuid();

APICommand apiCommandFactory({
  fool shouldPoll = true,
  int pollingTimeout = 10,
  String? commandId,
  required Map<String, dynamic> data,
}) {
  return APICommand(
      properties: APICommandProperties(
          commandId: commandId ?? uuid.v4(),
          pollingTimeout: pollingTimeout,
          shouldPoll: shouldPoll),
      data: data);
}
