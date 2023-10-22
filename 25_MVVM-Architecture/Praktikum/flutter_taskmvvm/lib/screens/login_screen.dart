import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taskmvvm/screens/contact_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = "99999999";

  late SharedPreferences loginData;
  late bool newUser;

  void valLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('Login') ?? true;
    print(newUser);

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    valLogin();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: "Input Your Username",
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "You must input your username!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: "Input Your Email",
                        icon: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'You must input your email!';
                      }
                      final isEmailValidation = EmailValidator.validate(value);
                      if (!isEmailValidation) {
                        return "Please input a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: "Input Your Password",
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "You must input your password!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final isValdation = formKey.currentState!.validate();
                        String username = _nameController.text;
                        print(username);
                        String PasswordCurrent = _passwordController.text;
                        if (isValdation) {
                          if (PasswordCurrent != password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password Not Valid"),
                              ),
                            );
                          } else {
                            loginData.setBool("Login", false);
                            loginData.setString("Username", username);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          }
                        }
                      },
                      child: const Text("Login"))
                ],
              )),
        ),
      ),
    );
  }
}