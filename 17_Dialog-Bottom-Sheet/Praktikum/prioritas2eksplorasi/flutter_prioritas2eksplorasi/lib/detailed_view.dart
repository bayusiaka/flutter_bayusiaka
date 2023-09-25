import 'package:flutter/material.dart';

class DetailImagePage extends StatelessWidget {
  final String imagePath;
  const DetailImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        title: const Text('Detailed View'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}