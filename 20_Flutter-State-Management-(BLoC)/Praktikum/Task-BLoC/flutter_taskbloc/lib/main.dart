import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taskbloc/bloc/contact/contact_bloc.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_bloc.dart';
import 'package:flutter_taskbloc/screen/screen_contact.dart';
import 'package:flutter_taskbloc/screen/screen_gallery.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (BuildContext context) => ContactBloc(),
        ),
        BlocProvider<GalleryBloc>(
          create: (BuildContext context) => GalleryBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            const GalleryScreen(),
        routes: {
          '/contact': (context) => const ContactScreen(),
        },
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF42A5F5),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title:
                const Text('Gallery'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(
                  '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text(
                'Contact'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushNamed('/contact');
            },
          ),
        ],
      ),
    );
  }
}