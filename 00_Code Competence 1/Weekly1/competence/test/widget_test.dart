import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:competence/main.dart';

void main() {
  testWidgets('UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Test the presence of key UI elements
    expect(find.text("Welcome to Mala's page!"), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('What can we help you with?'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Simulate user input
    await tester.enterText(find.byType(TextField).first, 'John');
    await tester.enterText(find.byType(TextField).at(1), 'Doe');
    await tester.enterText(
        find.byType(TextField).at(2), 'john.doe@example.com');
    await tester.enterText(find.byType(TextField).at(3), 'Inquiry message');

    // Trigger the submit button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the data dialog appears with the correct information
    expect(find.text('Form Data'), findsOneWidget);
    expect(find.text('First Name: John'), findsOneWidget);
    expect(find.text('Last Name: Doe'), findsOneWidget);
    expect(find.text('Email: john.doe@example.com'), findsOneWidget);
    expect(find.text('Inquiry: Inquiry message'), findsOneWidget);
  });
}
