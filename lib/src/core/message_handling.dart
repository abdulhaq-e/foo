typedef MessageHandling<Message, Response> = Future<Response> Function(
    Message message);

typedef QueryHandling<Query, Response> = MessageHandling<Query, Response>;

typedef CommandHandling<Command, Response> = MessageHandling<Command, Response>;

class NullHandler<T> {
  Future<void> call(T message) async {}
}
