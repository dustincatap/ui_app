import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ui_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('increment counter', (tester) async {
    // Arrange
    app.main();
    await tester.pumpAndSettle();

    // Act
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Assert
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
