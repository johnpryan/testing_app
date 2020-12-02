import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_app/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  testWidgets("failing test example", (WidgetTester tester) async {
    app.main();

    expect(2 + 2, equals(5));
  });

  testWidgets("take a screenshot", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await binding.takeScreenshot('Tapped Plus Button');
  }, skip: true /* Not working on iOS, Android or Chrome */);

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Increment counter performance test',
      (WidgetTester tester) async {
    app.main();

    // Trace the timeline of the following operation. The timeline result will
    // be written to `build/integration_response_data.json` with the key
    // `timeline`.
    await binding.traceAction(() async {
      await tester.pumpAndSettle();

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

    }, reportKey: 'counter perf test');
  });
}
