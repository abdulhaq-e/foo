part of 'command.bloc.dart';

abstract class CommandEvent {}

class CommandReset<Command> extends CommandEvent {
  CommandReset();
}

class CommandExecutionRequested<Command> extends CommandEvent {
  final Command command;

  CommandExecutionRequested({required this.command});
}

class CommandExecutionStarted<Command> extends CommandEvent {
  final Command command;

  CommandExecutionStarted({required this.command});
}
