import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget build(BuildContext context) {
  return BlocProvider<CounterBloc>(
    create: (context) => CounterBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    ),
  );
}
