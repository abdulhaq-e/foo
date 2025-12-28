import 'dart:async';

// import 'package:foo/src/commands/bloc/command.bloc.dart';
// import 'package:foo/src/commands/commands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// class CommandStub {
//   final String input;

//   CommandStub({required this.input});
// }

// class CommandStubHandler {
//   final Completer<String> completer = Completer();
//   CommandStubHandler();

//   Future<String> call(CommandStub command) async {
//     return completer.future;
//   }
// }

// class ErrorHandler {
//   Future<String> call(Object error) async {
//     return "Error";
//   }
// }

// class ValidationHandler {
//   final Completer<String?> completer = Completer();

//   Future<String?> call(Object error) async {
//     return completer.future;
//   }
// }

// Widget wrapInScaffold(Widget child) {
//   return MaterialApp(
//     home: Scaffold(
//       body: child,
//     ),
//   );
// }

void main() {
  test("", () {});
  //   ({
  //     CommandStubHandler commandHandler,
  //     ValidationHandler validationHandler,
  //     CommandBloc bloc,
  //     Widget subject,
  //     Widget defaultWidget
  //   }) setupSubject({
  //     bool autoCompleteValidation = true,
  //     Widget? executingWidget,
  //     void Function(BuildContext)? onExecuting,
  //     void Function(BuildContext, String)? onSuccess,
  //     void Function(BuildContext, String)? onError,
  //     void Function(BuildContext, String)? onValidationError,
  //   }) {
  //     final defaultWidget = ElevatedButton(onPressed: () {}, child: Text("Hi"));
  //     var commandHandler = CommandStubHandler();
  //     var validationHandler = ValidationHandler();
  //     if (autoCompleteValidation) {
  //       validationHandler.completer.complete(null);
  //     }
  //     var bloc = CommandBloc<CommandStub, String, String, String>(
  //         commandHandler: commandHandler,
  //         errorHandler: ErrorHandler(),
  //         validationHandler: validationHandler);

  //     var widget =
  //         wrapInScaffold(CommandView<CommandStub, String, String, String>(
  //       defaultWidgetBuilder: (context) => defaultWidget,
  //       executingWidgetBuilder:
  //           executingWidget != null ? (context) => executingWidget : null,
  //       onExecuting: onExecuting,
  //       onSucceeded: onSuccess,
  //       onError: onError,
  //       onValidationError: onValidationError,
  //     ));
  //     var provider = BlocProvider(
  //       child: widget,
  //       create: (_) => bloc,
  //     );

  //     return (
  //       commandHandler: commandHandler,
  //       validationHandler: validationHandler,
  //       bloc: bloc,
  //       subject: provider,
  //       defaultWidget: defaultWidget
  //     );
  //   }

  // group('Commands', () {
  //     group("started  event", () {
  //       testWidgets(
  //           'Should call validator and onValidationFailed if validation fails',
  //           (tester) async {
  //         var called = false;
  //         var calledWith = "";
  //         var subjectGroup = setupSubject(
  //             autoCompleteValidation: false,
  //             onValidationError: (_, error) {
  //               called = true;
  //               calledWith = error;
  //             });
  //         var subject = subjectGroup.subject;
  //         var validationHandler = subjectGroup.validationHandler;
  //         var bloc = subjectGroup.bloc;
  //         await tester.pumpWidget(subject);
  //         bloc.add(CommandExecutionStarted(command: CommandStub(input: 'hi')));
  //         await tester.pump();
  //         validationHandler.completer.complete("invalid");
  //         await tester.pump();
  //         expect(called, true);
  //         expect(calledWith, "invalid");
  //       });
  //     });
  //     group('initial state', () {
  //       testWidgets('Should show defaultWidget', (tester) async {
  //         var subjectGroup = setupSubject();
  //         var subject = subjectGroup.subject;
  //         await tester.pumpWidget(subject);
  //         await tester.pumpAndSettle();
  //         expect(find.byWidget(subjectGroup.defaultWidget), findsOneWidget);
  //       });
  //     });

  //     group('executing state', () {
  //       testWidgets('Should show executing widget when defined', (tester) async {
  //         final executingWidget = Container();
  //         var subjectGroup = setupSubject(executingWidget: executingWidget);
  //         var subject = subjectGroup.subject;
  //         var bloc = subjectGroup.bloc;
  //         await tester.pumpWidget(subject);
  //         bloc.add(CommandExecutionStarted(command: CommandStub(input: 'hi')));
  //         await tester.pump();
  //         expect(find.byWidget(executingWidget), findsOneWidget);
  //         await tester.pumpAndSettle();
  //       });
  //       testWidgets('Should call onExecuting', (tester) async {
  //         var called = false;
  //         var subjectGroup = setupSubject(onExecuting: (_) {
  //           called = true;
  //         });
  //         var subject = subjectGroup.subject;
  //         var bloc = subjectGroup.bloc;
  //         await tester.pumpWidget(subject);
  //         bloc.add(CommandExecutionStarted(command: CommandStub(input: 'hi')));
  //         await tester.pump();
  //         expect(called, true);
  //       });
  //     });
  //     group('succeeding state', () {
  //       testWidgets('Should call onSucceeded', (tester) async {
  //         var called = false;
  //         var calledWith = "";
  //         var subjectGroup = setupSubject(onSuccess: (_, response) {
  //           called = true;
  //           calledWith = response;
  //         });
  //         var subject = subjectGroup.subject;
  //         var bloc = subjectGroup.bloc;
  //         var commandHandler = subjectGroup.commandHandler;
  //         await tester.pumpWidget(subject);
  //         bloc.add(CommandExecutionStarted(command: CommandStub(input: 'hi')));
  //         await tester.pump();
  //         commandHandler.completer.complete('bye');
  //         await tester.pumpAndSettle();
  //         expect(called, true);
  //         expect(calledWith, 'bye');
  //       });
  //     });
  //     group('failure state', () {
  //       testWidgets('Should call onError', (tester) async {
  //         var called = false;
  //         var calledWith = "";
  //         var subjectGroup = setupSubject(onError: (_, error) {
  //           called = true;
  //           calledWith = error;
  //         });
  //         var subject = subjectGroup.subject;
  //         var bloc = subjectGroup.bloc;
  //         var commandHandler = subjectGroup.commandHandler;
  //         await tester.pumpWidget(subject);
  //         bloc.add(CommandExecutionStarted(command: CommandStub(input: 'hi')));
  //         await tester.pump();
  //         commandHandler.completer.completeError(Exception());
  //         await tester.pumpAndSettle();
  //         expect(called, true);
  //         expect(calledWith, 'Error');
  //       });
  //     });
  //   });
}
