import 'dart:async';

import 'package:foo/core.dart';

class CommandHandlerStreamDecorator<Command, Response> {
  final CommandHandling<Command, Response> commandHandler;
  final StreamController<bool> streamController;

  CommandHandlerStreamDecorator(
      {required this.commandHandler, required this.streamController});

  Future<Response> call(Command command) async {
    try {
      var response = await commandHandler(command);
      streamController.add(true);
      return response;
    } catch (_) {
      streamController.add(false);
      rethrow;
    }
  }
}
