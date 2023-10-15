import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_taskbloc/bloc/contact/contact_bloc.dart';
import 'package:flutter_taskbloc/bloc/contact/contact_event.dart';
import 'package:flutter_taskbloc/bloc/contact/contact_state.dart';
import 'package:flutter_taskbloc/main.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController fileController = TextEditingController();


  List<Contact> contacts = [];

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact name';
    }
    List<String> words = value.split(' ');
    if (words.length < 2) {
      return 'The contact name should be made up of a minimum of 2 words.';
    }
    for (String word in words) {
      if (word.isEmpty) {
        return 'Each word should start with an initial capital letter.';
      }
      if (word[0] != word[0].toUpperCase()) {
        return 'Each word should start with an initial capital letter.';
      }
      if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]').hasMatch(word)) {
        return 'The name must not contain numbers or symbols';
      }
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact number';
    }
    if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
      return 'The length of the phone number must be 8-15 digits';
    }
    return null;
  }

  blocListenerSubmit({required Widget child}) {
    return BlocListener(
        bloc: context.read<ContactBloc>(),
        child: child,
        listener: (context, state) {
          if (state is LoadingContactState) {
            print('Loading Data');
          }
          if (state is SuccessContactState) {
            setState(() {
              contacts.add(state.data);
            });
          }
          if (state is EditContactState) {
            setState(() {
              contacts[state.index] = state.data;
            });
          }
          if (state is DeleteContactState) {
            setState(() {
              contacts.removeAt(state.index);
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return blocListenerSubmit(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'My Contacts',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF42A5F5),
          ),
          drawer: const MyDrawer(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Icon(
                    Icons.mobile_friendly_rounded,
                    color: Color(0xFF42A5F5),
                    size: 30,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Easily add new contacts using "Create New Contact"\nto save names and phone numbers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 1,
                    width: 350,
                    color: Colors.grey[350],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              hintText: 'Enter Contact Name',
                              filled: true,
                              fillColor: Color.fromARGB(255, 215, 235, 253),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: validateName,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              hintText: '+62 ...',
                              filled: true,
                              fillColor: Color.fromARGB(255, 215, 235, 253),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: validatePhoneNumber,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              hintText: 'Select Date',
                              filled: true,
                              fillColor: Color.fromARGB(255, 215, 235, 253),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2030),
                              ).then((pickedDate) {
                                if (pickedDate != null) {
                                  final formattedDate = DateFormat('yyyy-MM-dd')
                                      .format(pickedDate);
                                  dateController.text = formattedDate;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: colorController,
                            decoration: const InputDecoration(
                              labelText: 'Color',
                              hintText: 'Select Color',
                              filled: true,
                              fillColor: Color.fromARGB(255, 215, 235, 253),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color currentColor = Colors.white;
                                  return AlertDialog(
                                    title: const Text('Pick a color'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: currentColor,
                                        onColorChanged: (Color newColor) {
                                          currentColor = newColor;
                                        },
                                        enableAlpha: false,
                                        showLabel: true,
                                        pickerAreaHeightPercent: 0.8,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          colorController.text =
                                              '#${currentColor.value.toRadixString(16).substring(2)}';
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Select'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: fileController,
                            decoration: const InputDecoration(
                              labelText: 'File',
                              hintText: 'Select and Open Files',
                              filled: true,
                              fillColor: Color.fromARGB(255, 215, 235, 253),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'pdf',
                                  'doc',
                                  'txt',
                                  'jpg',
                                  'png',
                                  'jpeg'
                                ],
                              );
                              if (result != null) {
                                PlatformFile file = result.files.single;
                                fileController.text = file.path!;
                              }
                            },
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF42A5F5),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String name = nameController.text;
                                  String phoneNumber = phoneController.text;
                                  String date = dateController.text;
                                  String color = colorController.text;
                                  String file = fileController.text;

                                  context.read<ContactBloc>().add(
                                        SubmitContactEvent(
                                          data: Contact(
                                            name: name,
                                            phoneNumber: phoneNumber,
                                            date: date,
                                            color: color,
                                            file: file,
                                          ),
                                        ),
                                      );

                                  nameController.clear();
                                  phoneController.clear();
                                  dateController.clear();
                                  colorController.clear();
                                  fileController.clear();

                                  print('Name: $name');
                                  print('Phone Number: $phoneNumber');
                                  print('Date: $date');
                                  print('Color: $color');
                                  print('File: $file');
                                }
                              },
                              child: const Text(
                                'Save Contact',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ContactsList(
                    contacts: contacts,
                    onDelete: (index) {
                      context.read<ContactBloc>().add(
                            DeleteContactEvent(
                              index: index,
                            ),
                          );
                    },
                    onUpdate: (index, newContact) {
                      context.read<ContactBloc>().add(
                            EditContactEvent(
                              index: index,
                              data: newContact,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Contact {
  String name;
  String phoneNumber;
  String date;
  String color;
  String file;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.file,
  });
}

class ContactsList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(int) onDelete;
  final Function(int, Contact) onUpdate;

  ContactsList({
    required this.contacts,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    print(contacts.length);
    return Column(
      children: [
        const Text('My Contact List',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 10),
        if (contacts.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              final initials = contact.name.isNotEmpty ? contact.name[0] : '';
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffE7E0EC),
                  child: Text(
                    initials.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text(contact.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${contact.phoneNumber}'),
                    Text('Date: ${contact.date}'),
                    Row(
                      children: [
                        const Text('Color: '),
                        Container(
                          width: 20,
                          height: 20,
                          color: Color(
                            int.parse(
                              contact.color.replaceAll("#", "0xFF"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('File: ${contact.file}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _showEditContactDialog(context, index, contact);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        onDelete(index);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        else
          const Text('Belum ada contacts'),
      ],
    );
  }

  void _showEditContactDialog(
      BuildContext context, int index, Contact contact) {
    String newName = contact.name;
    String newPhoneNumber = contact.phoneNumber;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: newName,
                onChanged: (value) {
                  newName = value;
                },
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                initialValue: newPhoneNumber,
                onChanged: (value) {
                  newPhoneNumber = value;
                },
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                contact.name = newName;
                contact.phoneNumber = newPhoneNumber;
                onUpdate(index, contact);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}