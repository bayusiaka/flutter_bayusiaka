import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_prioritas1/homepage.dart';
import 'image_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImageModel('assets/bruno.jpeg'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
