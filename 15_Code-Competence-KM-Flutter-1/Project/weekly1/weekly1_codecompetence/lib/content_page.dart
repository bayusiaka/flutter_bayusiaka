import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 250,),
        Text(
          'Welcome To TechTrack!',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        const SizedBox(height: 20,),
        Text(
          'Welcome to the first stage of TechTrack Apps!',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ],
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
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String? Function(String?)? validateEmail = (value) {
    if (value == null || value.isEmpty) {
      return 'Email address cannot be empty!';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Enter a valid email!';
    }
    return null;
  };

  void submit() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Entered Data',
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
                  'Last Name: ${lastNameController.text}',
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
                  firstNameController.clear();
                  lastNameController.clear();
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
              children: [
                const SizedBox(height: 250),
                Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Need to get in touch with TechTrack? Either fill out the form with your inquiry or department email you would contact below',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Name',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                 borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                                )
                              ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 233, 243, 253),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Name',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                 borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                                )
                              ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 233, 243, 253),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder( borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                          )
                        ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 233, 243, 253),
                      ),
                      validator: validateEmail,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What can we help you with?',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      maxLines: 5,
                      controller: messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                           borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                          )
                        ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 233, 243, 253),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                      MaterialStateProperty.all<Color>(
                      Color(0xFF42A5F5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
                )
              ),
                  onPressed: submit,
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
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
