import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_taskuitesting/screens/contact_screen.dart';

void main() {
  testWidgets('Name of the title', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(2));
    await expectLater(find.text("My Contact"), findsNWidgets(1));
    handle.dispose();
  });
}