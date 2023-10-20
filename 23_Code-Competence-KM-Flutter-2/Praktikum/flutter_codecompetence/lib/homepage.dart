import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          WidgetSpan(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/banner.jpg',
                ),
                const Text(
                  '\n"Coding Bootcamp Producing High-Quality Programmers in Indonesia"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 244, 244, 244),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Positioned(
                  bottom: 115,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Alterra Academy is an Indonesian coding \nbootcamp for everyone, whether you have an \nIT or non-IT background, aiming to become \ntop-quality programmers in industry.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 244, 244, 244),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Learn More',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String? Function(String?)? validateEmail = (value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Masukkan email yang valid';
    }
    return null; // Validasi berhasil
  };

  void submit() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Entered Data:',
              style: GoogleFonts.poppins(),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'First Name: ${firstNameController.text}',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  'Email: ${emailController.text}',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  'Messages: ${messageController.text}',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text(
                  'Close',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  // Clear the text in the TextFormFields
                  firstNameController.clear();
                  emailController.clear();
                  messageController.clear();

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 29),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                      validator: validateEmail,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: submit,
                  icon: const Icon(Icons.send),
                  label: Text(
                    'Send',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String judul;

  const CustomCard(
      {super.key, required this.icon, required this.text, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                icon,
                size: 48,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                  maxLines: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyRightSidebar extends StatelessWidget {
  const MyRightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30),
          createCenteredButton('About Us'),
          createCenteredButton('Contact Us'),
          createCenteredButton('Login'),
        ],
      ),
    );
  }

  Widget createCenteredButton(String buttonText) {
    return ListTile(
      title: Center(
        child: SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}