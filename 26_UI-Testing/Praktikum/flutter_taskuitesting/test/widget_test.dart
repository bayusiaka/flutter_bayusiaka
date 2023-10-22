import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_taskuitesting/screens/contact_screen.dart';

void main() {
  testWidgets('The Text Form Field', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(2));
  });
}