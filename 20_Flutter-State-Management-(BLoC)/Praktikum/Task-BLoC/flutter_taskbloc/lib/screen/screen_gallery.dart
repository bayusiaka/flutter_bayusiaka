import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_bloc.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_event.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_state.dart';
import 'package:flutter_taskbloc/main.dart';


class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> images = [
    'images/bruno1.jpg',
    'images/bruno2.jpg',
    'images/bruno3.jpg',
    'images/bruno4.jpg',
    'images/bruno5.jpg',
    'images/bruno6.jpg',
    'images/bruno7.jpg',
    'images/bruno8.jpg',
    'images/bruno9.jpg',
    'images/bruno10.jpg',
    'images/bruno11.jpg',
    'images/bruno12.jpg',
  ];

  String selectedImage = '';

  blocListenerGallery({required Widget child}) {
    return BlocListener(
        bloc: context.read<GalleryBloc>(),
        child: child,
        listener: (context, state) {
          if (state is ShowGalleryState) {
            _navigateToNewPage(state.selectedImage);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return blocListenerGallery(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Gallery',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF42A5F5),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = images[index];
                  });
                  _showBottomSheet(images[index]);
                },
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/${images[index]}',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/$imageUrl',
                fit: BoxFit.cover,
              ),
            ),
            const Text('Do you want to see more detailed view?'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color(0xFF42A5F5),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<GalleryBloc>().add(
                          AddGalleryEvent(
                            selectedImage: imageUrl,
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color(0xFF42A5F5),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  void _navigateToNewPage(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPage(
            imageUrl: imageUrl),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String imageUrl;

  const NewPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Detailed View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF42A5F5),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'assets/$imageUrl',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}