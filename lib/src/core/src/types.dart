import 'package:foo/core.dart';

typedef MessageHandling<Message, Response> =
    Future<Response> Function(Message message);

typedef QueryHandling<Query, Response> = MessageHandling<Query, Response>;

typedef CommandHandling<Command, Response> = MessageHandling<Command, Response>;

typedef AsyncCommandHandling<Command, Response> =
    MessageHandling<Command, CommandResult<Response>>;

class NullHandler<T> {
  Future<void> call(T message) async {}
}
