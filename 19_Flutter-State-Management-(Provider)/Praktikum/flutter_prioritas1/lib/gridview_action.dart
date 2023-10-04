import 'package:flutter/material.dart';
import 'package:flutter_prioritas1/detailed_view.dart';
import 'image_model.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key, required this.imageModel});

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, imageModel.imagePath);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: AssetImage(imageModel.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, imageModel.imagePath);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: AssetImage(imageModel.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, imageModel.imagePath);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: AssetImage(imageModel.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, imageModel.imagePath);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: AssetImage(imageModel.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  void _showImageBottomSheet(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowImage(imagePath: imagePath);
      },
    );
  }
}
