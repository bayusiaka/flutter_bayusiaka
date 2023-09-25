import 'package:flutter/material.dart';
import 'package:flutter_prioritas2eksplorasi/gallery_action.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF42A5F5),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/gridview');
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF42A5F5),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/contact');
              },
            ),
          ],
        ),
      ),
      body: const ImageGridView(),
    );
  }
}
