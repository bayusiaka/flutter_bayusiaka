import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_taskuitesting/screens/contact_screen.dart';

void main() {
  testWidgets('The Description', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await expectLater(
        find.text("Easily add new contacts using 'Create New Contact' to save names and phone numbers."),
        findsNWidgets(1));
    handle.dispose();
  });
}