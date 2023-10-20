import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_codecompetence/homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          icon: Image.asset('assets/alterralogo.png'),
          onPressed: () {},
        ),
      ),
      endDrawer: const MyRightSidebar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Welcome(),
                const MyWidget(),
                Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Alterra Academy Programs',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      judul: 'Immersive Program',
                      icon: Icons.code_rounded,
                      text:
                          'An intensive coding bootcamp training program for beginners, whether with an IT or non-IT background. To become a professional software engineer in just 9 weeks.',
                    ),
                    CustomCard(
                      judul: 'Expert on IT',
                      icon: Icons.computer_rounded,
                      text:
                          'An intensive coding bootcamp training program for beginners, whether with an IT or non-IT background. To become a professional software engineer in just 9 weeks.',
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
