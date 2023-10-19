import 'package:flutter/material.dart';
import 'package:flutter_taskstorage/screens/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '21. Storage',
      theme: ThemeData(),
      home: const LoginScreen(),
    );
  }
}