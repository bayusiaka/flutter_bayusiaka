import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class Data {
  String? name;
  String? number;
  Data({this.name, this.number});
}

class _HomeState extends State<Home> {
  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? number;
  List<Data> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        title: const Text("My Contact"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.mobile_friendly_rounded),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Create New Contact",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    "Easily add new contacts using 'Create New Contact' to save names and phone numbers.",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter Contact Name',
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            name = value;
                            if (value == null || value.isEmpty) {
                              return 'Please enter contact name';
                            }
                            final nameParts = value.split(' ');
                            if (nameParts.length < 2) {
                              return 'The contact name should be made up of a minimum of 2 words.';
                            }
                            for (final namePart in nameParts) {
                              if (namePart.isNotEmpty &&
                                  namePart[0] != namePart[0].toUpperCase()) {
                                return 'Each word should start with an initial capital letter.';
                              }
                            }
                            final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');
                            if (!regex.hasMatch(value)) {
                              return 'The name must not contain numbers or symbols';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Number",
                            hintText: "Enter Contact Number in +62 (Indonesia)",
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            )),
                          ),
                          validator: (value) {
                            number = value;
                            if (value == null || value.isEmpty) {
                              return "Please enter contact number";
                            }
                            final RegExp regex = RegExp(r'^[0-9]*$');
                            if (!regex.hasMatch(value)) {
                              return 'Phone Number can only consist of numbers';
                            }
                            if (value.length < 8 || value.length > 15) {
                              return 'The length of the phone number must be 8-15 digits';
                            }
                            if (!value.startsWith('0')) {
                              return 'Phone Numbers must be start with the digit "0"';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFF42A5F5)),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data Kontak Telah Tersimpan"),
                                    ),
                                  );
                                  dataList.add(Data(
                                    name: name,
                                    number: number,
                                  ));

                                  setState(() {});
                                  formKey.currentState!.reset();

                                  print("New Contact Added:");
                                  print("Name: $name");
                                  print("Phone Number: $number");
                                }
                              },
                              child: const Text("Save"),
                            ),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "My Contact List",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataList.length,
                          itemBuilder: (context, position) {
                            String name = dataList[position].name ?? "";
                            String avatarText =
                                name.substring(0, 1).toUpperCase();
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xFF42A5F5),
                                      radius: 30,
                                      child: Text(
                                        avatarText,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style:
                                              const TextStyle(fontSize: 15.0),
                                        ),
                                        Text(
                                          dataList[position].number.toString(),
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        dataList.removeAt(position);
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        _editContact(context, dataList,
                                            dataList[position], position, () {
                                          setState(() {});
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter contact name';
  }
  final nameParts = value.split(' ');
  if (nameParts.length < 2) {
    return 'The contact name should be made up of a minimum of 2 words.';
  }
  for (final namePart in nameParts) {
    if (namePart.isNotEmpty && namePart[0] != namePart[0].toUpperCase()) {
      return 'Each word should start with an initial capital letter.';
    }
  }
  final RegExp regex = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');
  if (!regex.hasMatch(value)) {
    return 'The name must not contain numbers or symbols';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter contact number";
  }
  final RegExp regex = RegExp(r'^[0-9]*$');
  if (!regex.hasMatch(value)) {
    return 'Phone Number can only consist of numbers';
  }
  if (value.length < 8 || value.length > 15) {
    return 'The length of the phone number must be 8-15 digits';
  }
  if (!value.startsWith('0')) {
    return 'Phone Numbers must be start with the digit "0"';
  }
  return null;
}

void _editContact(BuildContext context, List<Data> dataList, Data contact,
    int position, VoidCallback setStateCallback) {
  String updatedName = contact.name ?? "";
  String updatedNumber = contact.number ?? "";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Edit Contact"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                initialValue: updatedName,
                onChanged: (value) {
                  updatedName = value;
                },
                validator: validateName,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                initialValue: updatedNumber,
                onChanged: (value) {
                  updatedNumber = value;
                },
                validator: validatePhoneNumber,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final nameErorr = validateName(updatedName);
              final numberErorr = validatePhoneNumber(updatedNumber);
              if (nameErorr != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(nameErorr),
                  ),
                );
              } else if (numberErorr != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(numberErorr),
                  ),
                );
              } else {
                if (validateName(updatedName) == null &&
                    validatePhoneNumber(updatedNumber) == null) {
                  dataList[position].name = updatedName;
                  dataList[position].number = updatedNumber;
                  Navigator.of(context).pop();
                  setStateCallback();
                }
              }
            },
            child: const Text("Save"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}
