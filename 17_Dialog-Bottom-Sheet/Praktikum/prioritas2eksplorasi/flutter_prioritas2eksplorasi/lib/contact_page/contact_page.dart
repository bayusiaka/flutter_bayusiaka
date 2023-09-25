import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => ContactState();
}

class Data {
  String? name;
  String? number;
  DateTime? date;
  Color? currentColors;
  String? file;

  Data({this.name, this.number, this.date, this.currentColors, this.file});
  Color? get currentColor => currentColors;
  set currentColor(Color? color) {
    currentColors = color;
  }
}

class ContactState extends State<Contact> {
  String? updatedFileName;
  String? selectedFileName;
  //for color
  Color currentColors = Colors.orange;
  //for date
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  //for input:
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
      drawer: Drawer(
        child: ListView(
          children: [
             ListTile(
                title: const Text(
                  'Gallery',
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF42A5F5),
                ),
              ),
               onTap: () {
                Navigator.of(context).pushNamed('/gridview');
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF42A5F5),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/contact');
            },
           ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.mobile_friendly_rounded),
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
                              borderRadius: BorderRadius.all(
                                 Radius.circular(20.0),
                              )
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
                            labelText: "Phone Number",
                            hintText: "Enter Contact Number in +62 (Indonesia)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                 Radius.circular(20.0),
                              )
                            ),
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
                        buildDatePicker(
                          context,
                          _dueDate,
                          (newDate) {
                            setState(() {
                              _dueDate = newDate;
                            });
                          },
                        ),
                        const SizedBox(height: 20.0),
                        buildColorPicker(context),
                        const SizedBox(height: 20),
                        buildFilePicker(selectedFileName),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                               style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF42A5F5)),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    )
                                  ),
                                ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("New Contact Has Been Saved"),
                                    ),
                                  );
                                  dataList.add(Data(
                                    name: name,
                                    number: number,
                                    date: _dueDate,
                                    currentColors: currentColors,
                                    file: selectedFileName,
                                  ));

                                  setState(() {});

                                  formKey.currentState!.reset();

                                  setState(() {
                                    _dueDate = DateTime.now();
                                    currentColors = Colors.orange;
                                    selectedFileName = null;
                                  });
                                }
                              },
                              child: const Text("Save"),
                            ),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          "My Contact List",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataList.length,
                          itemBuilder: (context, position) {
                            String name = dataList[position].name ?? "";
                            String avatarText =
                                name.substring(0, 1).toUpperCase();
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color(0xFF42A5F5),
                                radius: 30,
                                child: Text(
                                  avatarText,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                name,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataList[position].number.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                  ),
                                  if (dataList[position].date != null) ...[
                                    Text(
                                      "Date: ${DateFormat('dd-MM-yyyy').format(dataList[position].date!)}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                  Row(
                                    children: [
                                      const Text("Color = "),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color:
                                            dataList[position].currentColor ??
                                                Colors.orange,
                                      ),
                                    ],
                                  ),
                                  if (dataList[position].file != null) ...[
                                    Text(
                                      "File Name = ${dataList[position].file}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
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
                                  ),
                                ],
                              ),
                            );
                          },
                        )
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

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentColors,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColors),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                          pickerColor: currentColors,
                          onColorChanged: (color) {
                            setState(() {
                              currentColors = color;
                            });
                          }),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context, DateTime selectedDate,
      Function(DateTime) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(DateTime.now().year + 5),
                );

                if (newDate != null) {
                  onDateSelected(newDate);
                }
              },
              child: const Text('Select Date'),
            ),
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }

  void _editColor(
      BuildContext context, Data contact, Function(Color) setColorCallback) {
    Color currentColor = contact.currentColors ?? Colors.orange;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Color"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColorPicker(
                  pickerColor: currentColor,
                  onColorChanged: (newColor) {
                    currentColor = newColor;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setColorCallback(currentColor);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
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

  Widget buildFilePicker(String? initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFiles(initialValue);
            },
            child: const Text("Pick and Open Files"),
          ),
        ),
      ],
    );
  }

  void _pickFiles(String? initialValue) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFileName = file.name;
    });
    updatedFileName = selectedFileName;
    _openFiles(file);
  }

  void _openFiles(PlatformFile file) {
    dataList.add(Data(
      name: name,
      number: number,
      date: _dueDate,
      currentColors: currentColors,
      file: file.path,
    ));
    setState(() {});
  }

  void _editContact(BuildContext context, List<Data> dataList, Data contact,
      int position, VoidCallback setStateCallback) {
    String updatedName = contact.name ?? "";
    String updatedNumber = contact.number ?? "";
    DateTime? updatedDate = contact.date;
    String? updatedFileName = contact.file;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime selectedDate = updatedDate ?? DateTime.now();

        return StatefulBuilder(
          builder: (context, setState) {
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
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      initialValue: updatedNumber,
                      onChanged: (value) {
                        updatedNumber = value;
                      },
                      validator: validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    buildDatePicker(
                      context,
                      selectedDate,
                      (newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text('Color:'),
                    ElevatedButton(
                      onPressed: () {
                        _editColor(context, dataList[position], (newColor) {
                          setState(() {
                            dataList[position].currentColors = newColor;
                          });
                        });
                      },
                      child: const Text("Edit Color"),
                    ),
                    const SizedBox(height: 10),
                    buildFilePicker(updatedFileName),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    final nameError = validateName(updatedName);
                    final numberError = validatePhoneNumber(updatedNumber);

                    if (nameError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(nameError),
                        ),
                      );
                    } else if (numberError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(numberError),
                        ),
                      );
                    } else {
                      if (validateName(updatedName) == null &&
                          validatePhoneNumber(updatedNumber) == null) {
                        dataList[position].name = updatedName;
                        dataList[position].number = updatedNumber;
                        dataList[position].date = selectedDate;
                        dataList[position].file = updatedFileName;

                          for (var i = 0; i < dataList.length; i++) {
                           print({
                              'title': dataList[i].name,
                              'subtitle': dataList[i].number,
                              'subtitle2': dataList[i].date,
                              'subtitle3': dataList[i].currentColors,
                              'subtitle4': dataList[i].file,
                        });
                     }

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
      },
    );
  }
}