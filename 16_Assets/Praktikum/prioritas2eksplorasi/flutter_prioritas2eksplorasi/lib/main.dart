import 'package:flutter/material.dart';
import 'package:flutter_prioritas2eksplorasi/contact_page/contact_page.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/gridview': (_) => const HomePage(),
        '/contact': (_) => const Contact(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
