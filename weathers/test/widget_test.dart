// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:weathers/main.dart';
import 'package:weathers/services/service_locator.dart';
import 'package:weathers/viewmodels/weather_viewmodel.dart';

void main() {
  setUp(() {
    setupLocator();
  });

  testWidgets('Weather app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that search bar is present
    expect(find.byType(TextField), findsOneWidget);
    
    // Verify app title is present
    expect(find.text('Weather App'), findsOneWidget);
  });
}
