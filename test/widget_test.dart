// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:ui_app/main.dart';

void main() {
  // Computed according to https://material.io/blog/device-metrics
  const pixel6 = Device(size: Size(420.56, 934.58), name: 'pixel6_portrait');
  const pixel6Landscape = Device(size: Size(934.58, 420.56), name: 'pixel6_landscape');
  const iphone8 = Device(size: Size(368.1, 654.72), name: 'iphone8_portrait');
  const iphone8Landscape = Device(size: Size(654.72, 368.1), name: 'iphone8_landscape');
  const devices = [pixel6, pixel6Landscape, iphone8, iphone8Landscape];

  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('Initial state', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify correct UI
    await multiScreenGolden(tester, 'my_home_page_initial_state', devices: devices);
  });

  testGoldens('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Verify correct UI
    await multiScreenGolden(tester, 'my_home_page_counter_increments', devices: devices);
  });
}
