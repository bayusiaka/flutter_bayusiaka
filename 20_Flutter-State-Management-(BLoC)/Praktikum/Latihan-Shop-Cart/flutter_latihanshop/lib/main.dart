import 'package:flutter/material.dart';
import 'package:flutter_latihanshop/models/cart_manager.dart';

import 'screens/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Cart',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const ProductPage(),
      ),
    );
  }
}
