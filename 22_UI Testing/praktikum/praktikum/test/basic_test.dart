import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/basic.dart';

void main() {
  testWidgets('UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Hello, World!'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Hello, World!'), findsNothing);
    expect(find.text('Button Pressed!'), findsOneWidget);
  });
}
