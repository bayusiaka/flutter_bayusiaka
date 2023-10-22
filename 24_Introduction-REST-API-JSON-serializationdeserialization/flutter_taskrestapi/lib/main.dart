// ignore: unused_import
import 'package:flutter_taskrestapi/eksplorasi/eksplorasi.dart';
// ignore: unused_import
import 'package:flutter_taskrestapi/prioritas1/view/viewhome.dart';
// ignore: unused_import
import 'package:flutter_taskrestapi/prioritas2/prioritas2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Eksplorasi(),
    );
  }
}