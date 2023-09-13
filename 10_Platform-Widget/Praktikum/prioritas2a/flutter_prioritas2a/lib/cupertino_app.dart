import 'package:flutter/cupertino.dart';
import './cupertino_home.dart';

class App extends StatelessWidget {
  App({super.key});
  final _themedark = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themedark,
      home: const HomePage(),
    );
  }
}