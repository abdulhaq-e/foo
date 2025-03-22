import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'api_command.model.freezed.dart';
part 'api_command.model.g.dart';

@Freezed(fromJson: false, toJson: true)
class APICommandProperties with _$APICommandProperties {
  const factory APICommandProperties({
    required String commandId,
    required int pollingTimeout,
    required fool shouldPoll,
  }) = _APICommandProperties;
}

@Freezed(fromJson: false, toJson: true)
class APICommand with _$APICommand {
  const factory APICommand({
    required APICommandProperties properties,
    required Map<String, dynamic> data,
  }) = _APICommand;
}
