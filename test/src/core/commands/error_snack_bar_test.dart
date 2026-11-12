import 'package:flutter_test/flutter_test.dart';
import 'package:foo/core.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Future<BuildContext> pumpHost(WidgetTester tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              captured = context;
              return const SizedBox();
            },
          ),
        ),
      ),
    );
    return captured;
  }

  testWidgets('shows what failed and why, in the error color', (
    tester,
  ) async {
    final context = await pumpHost(tester);

    showErrorSnackBar(
      context,
      title: 'Approve failed',
      message: 'This gradebook was already approved.',
    );
    await tester.pump();

    expect(find.text('Approve failed'), findsOneWidget);
    expect(find.text('This gradebook was already approved.'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(
      snackBar.backgroundColor,
      Theme.of(context).colorScheme.error,
    );
    expect(snackBar.showCloseIcon, isTrue);
    expect(snackBar.duration, kErrorSnackBarDuration);
  });

  testWidgets('omits the reason line when there is none', (tester) async {
    final context = await pumpHost(tester);

    showErrorSnackBar(context, title: 'Save failed');
    await tester.pump();

    expect(find.text('Save failed'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.byType(Text),
      ),
      findsOneWidget,
    );
  });

  testWidgets('SnackbarNotifier.showError uses the same error styling', (
    tester,
  ) async {
    final key = GlobalKey<ScaffoldMessengerState>();
    await tester.pumpWidget(
      MaterialApp(scaffoldMessengerKey: key, home: const Scaffold()),
    );

    SnackbarNotifier(key).showError(
      'Failed to place hold',
      detail: 'The student already has an active hold.',
    );
    await tester.pump();

    expect(find.text('Failed to place hold'), findsOneWidget);
    expect(
      find.text('The student already has an active hold.'),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
  });
}
