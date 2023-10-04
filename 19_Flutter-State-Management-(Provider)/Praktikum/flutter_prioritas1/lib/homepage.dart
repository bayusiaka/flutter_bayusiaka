import 'package:flutter/material.dart';
import 'package:flutter_prioritas1/gridview_action.dart';
import 'package:provider/provider.dart';
import 'image_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 157, 106),
        title: const Text('Grid View'),
        centerTitle: true,
      ),
      body: ImageGridView(imageModel: imageModel),
    );
  }
}
