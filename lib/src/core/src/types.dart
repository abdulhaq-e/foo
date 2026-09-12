import 'package:foo/core.dart';

typedef MessageHandling<Message, Response> =
    Future<Response> Function(Message message);

typedef QueryHandling<Query, Response> = MessageHandling<Query, Response>;

typedef CommandHandling<Command, Response> = MessageHandling<Command, Response>;

/// A command handler for an action already known (from its own descriptor,
/// fetched before the call) to always respond 202 with an operation id —
/// never a direct result. Contrast with [CommandHandling], used for an
/// action already known to always resolve in-request. There is deliberately
/// no single handler type that returns "either shape, discovered from the
/// response" — that shape-by-status-code ambiguity is exactly what this
/// package's action framework avoids by declaring sync/async per action up
/// front instead of detecting it at runtime.
typedef AsyncCommandHandling<Command> =
    MessageHandling<Command, AsyncCommandResponse>;

class NullHandler<T> {
  Future<void> call(T message) async {}
}
