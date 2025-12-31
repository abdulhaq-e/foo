import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend_auth_callback.command.freezed.dart';
part 'backend_auth_callback.command.g.dart';

@Freezed(fromJson: false, toJson: true)
abstract class BackendAuthCallbackCommand with _$BackendAuthCallbackCommand {
  const factory BackendAuthCallbackCommand({
    required String token,
    required String authProvider,
    required String saasTenantDomain,
    @JsonKey(includeToJson: false) required String clientType,
  }) = _BackendAuthCallbackCommand;
}
