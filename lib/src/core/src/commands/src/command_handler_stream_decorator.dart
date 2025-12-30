import 'dart:async';

import 'package:foo/core.dart';

/// Represents the result of a command execution.
/// This provides more context to stream listeners than a simple boolean.
sealed class CommandExecutionResult<Response> {
  const CommandExecutionResult();
}

/// Indicates successful command execution with the response.
class CommandExecutionSuccess<Response> extends CommandExecutionResult<Response> {
  const CommandExecutionSuccess();
}

/// Indicates failed command execution.
class CommandExecutionFailure<Response> extends CommandExecutionResult<Response> {
  const CommandExecutionFailure();
}

/// Extension to simplify consuming command execution streams.
/// Provides a convenient way to react to successful executions without
/// dealing with the sealed class details.
extension CommandExecutionResultStreamX<Response> on Stream<CommandExecutionResult<Response>> {
  /// Maps the stream to only emit on successful command executions.
  /// This is useful for consumers that just want to know "should we refresh?"
  /// without needing to understand the CommandExecutionResult sealed class.
  ///
  /// Usage:
  /// ```dart
  /// streamController.stream.shouldRefresh.listen((_) {
  ///   // Refresh UI, reload data, etc.
  /// });
  /// ```
  Stream<void> get shouldRefresh => where((result) => result is CommandExecutionSuccess).map((_) {});
}

/// A decorator that wraps a command handler to emit execution results to a stream.
/// This allows listeners to react to command completion without tight coupling.
///
/// Usage:
/// ```dart
/// final streamController = StreamController<CommandExecutionResult<MyResponse>>();
/// final decorator = CommandHandlerStreamDecorator(
///   commandHandler: myHandler,
///   streamController: streamController,
/// );
///
/// // Simple refresh pattern (recommended for most cases)
/// streamController.stream.shouldRefresh.listen((_) {
///   // Refresh UI
/// });
///
/// // Advanced pattern with full control
/// streamController.stream.listen((result) {
///   switch (result) {
///     case CommandExecutionSuccess():
///       // Handle success
///     case CommandExecutionFailure():
///       // Handle failure
///   }
/// });
/// ```
class CommandHandlerStreamDecorator<Command, Response> {
  final CommandHandling<Command, Response> commandHandler;
  final StreamController<CommandExecutionResult<Response>> streamController;

  CommandHandlerStreamDecorator({
    required this.commandHandler,
    required this.streamController,
  });

  Future<Response> call(Command command) async {
    try {
      final response = await commandHandler(command);
      streamController.add(const CommandExecutionSuccess());
      return response;
    } catch (_) {
      streamController.add(const CommandExecutionFailure());
      rethrow;
    }
  }
}
