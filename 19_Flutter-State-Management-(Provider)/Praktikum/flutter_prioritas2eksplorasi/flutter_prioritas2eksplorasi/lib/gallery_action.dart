import 'package:flutter/material.dart';
import 'package:flutter_prioritas2eksplorasi/image_model.dart';
import 'detailed_view.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key, required ImageModel imageModel});
  
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
              _showImageBottomSheet(context, 'assets/bruno1.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno2.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno3.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno4.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
           ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno5.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
           ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno6.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno6.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno7.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno7.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno8.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno8.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno9.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno9.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno10.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno10.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno11.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno11.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            ElevatedButton(
            onPressed: () {
              _showImageBottomSheet(context, 'assets/bruno12.jpg');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(2),
            ),
            child: Ink.image(
              image: const AssetImage('assets/bruno12.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

void _showImageBottomSheet(BuildContext context, String imagePath) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ShowImage(imagePath: imagePath);
    },
  );
}

class ShowImage extends StatelessWidget {
  final String imagePath;
  const ShowImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              'Do you want to see more detailed view?',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color(0xFF42A5F5)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      )
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailImagePage(imagePath: imagePath),
                      ),
                    );
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color(0xFF42A5F5)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      )
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}