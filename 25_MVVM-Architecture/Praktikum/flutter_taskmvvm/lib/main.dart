import 'package:flutter/material.dart';
import 'package:flutter_taskmvvm/screens/contact_screen.dart';
import 'package:flutter_taskmvvm/screens/contact_viewmodel.dart';
import 'package:flutter_taskmvvm/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ContactViewModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Apps',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/": (context) => const LoginScreen(),
        "/homePage": (context) => const HomePage(),
      },
    );
  }
}