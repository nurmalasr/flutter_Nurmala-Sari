import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/views/result_page.dart';
import 'package:praktikum/main.dart'; // Replace with the correct import path for your main.dart
import 'package:praktikum/services/openai_api.dart';
import 'package:praktikum/views/recommend_page.dart';

void main() {
  testWidgets('RecomendationPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(MyApp()); // Replace with the correct MyApp instantiation

    // Navigate to RecomendationPage.
    await tester.tap(find.text('Phone Recommendations'));
    await tester.pumpAndSettle();

    // Verify the initial state of the RecomendationPage.
    expect(find.text('Budget'), findsOneWidget);
    expect(find.text('Camera (MP)'), findsOneWidget);
    expect(find.text('Internal Storage'), findsOneWidget);

    // Enter values into text fields.
    await tester.enterText(find.byKey(Key('hargaTextField')), '10000000');
    await tester.enterText(find.byKey(Key('kameraTextField')), '48mp');
    await tester.enterText(find.byKey(Key('penyimpananTextField')), '64gb');

    // Tap the "Get Recommendations" button.
    await tester.tap(find.text('Get Recommendations'));
    await tester.pumpAndSettle();

    // Verify that the ResultPage is displayed.
    expect(find.byType(ResultPage), findsOneWidget);

    // Add more assertions to the test as needed to cover the UI elements and interactions in the ResultPage.
  });
}
