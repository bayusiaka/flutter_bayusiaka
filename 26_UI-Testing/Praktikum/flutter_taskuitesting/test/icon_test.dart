import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_taskuitesting/screens/contact_screen.dart';

void main() {
  testWidgets('The Icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.mobile_friendly_rounded), findsOneWidget);
  });
}