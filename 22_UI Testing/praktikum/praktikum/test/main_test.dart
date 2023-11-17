import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/main.dart';

void main() {
  testWidgets('UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the initial state of the UI.
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Telephone'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('List Contacts'), findsOneWidget);

    // Interaction: Tap the Submit button without entering data.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that validation error messages are displayed.
    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Phone number is required'), findsOneWidget);

    // Interaction: Enter valid data and tap the Submit button.
    await tester.enterText(find.byKey(const Key('_nameKey')), 'John Doe');
    await tester.enterText(find.byKey(const Key('_phoneKey')), '123456789');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the List Contacts section is visible.
    expect(find.text('List Contacts'), findsOneWidget);

    // Verify that the entered contact is in the list.
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456789'), findsOneWidget);

    // Interaction: Tap the Edit button for the added contact.
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    // Verify that the form is populated with the selected contact's data.
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456789'), findsOneWidget);

    // Interaction: Update the contact's data and tap the Update button.
    await tester.enterText(
        find.byKey(const Key('_nameKey')), 'Updated John Doe');
    await tester.enterText(find.byKey(const Key('_phoneKey')), '987654321');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the updated contact data is displayed.
    expect(find.text('Updated John Doe'), findsOneWidget);
    expect(find.text('987654321'), findsOneWidget);

    // Interaction: Tap the Delete button for the added contact.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the contact is removed from the list.
    expect(find.text('Updated John Doe'), findsNothing);
    expect(find.text('987654321'), findsNothing);
  });
}
