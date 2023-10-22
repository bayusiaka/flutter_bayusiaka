import 'package:flutter/material.dart';
import 'package:flutter_taskmvvm/models/contact.dart';
import 'package:flutter_taskmvvm/screens/contact_viewmodel.dart';
import 'package:flutter_taskmvvm/screens/logout_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    context: context,
                    builder: (context) {
                      return const ProfilSheet();
                    });
              },
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),

                const Icon(
                  Icons.mobile_friendly,
                  size: 24,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Create New Contacts",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height:
                        8.0),
                const Text(
                  "Easily add new contacts using 'Create New Contact' to save names and phone numbers.",
                  style: TextStyle(
                    fontSize: 14.0, // Ukuran huruf kecil
                  ),
                ),
                TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Input a Contact Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The contact name must be filled.';
                      }
                      List<String> nameParts = value.split('');
                      if (nameParts.length < 2) {
                        return 'The contact name should be made up of a minimum of 2 words.';
                      }
                      for (String part in nameParts) {
                        if (part[0] != part[0].toUpperCase()) {
                          return 'Each word should start with an initial capital letter.';
                        }
                        if (value.contains(RegExp(
                            r'[0-9!@#$%^&*()_+={}\[\]:;"<>,.?/~`|\\]'))) {
                          return 'The name must not contain numbers or symbols';
                        }
                        return null;
                      }
                      return null;
                    }),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: contactController,
                  maxLength: 15,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter Contact Number in +62 (Indonesia)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'The contact number must be filled.';
                    }
                    if (!RegExp(r'^0\d{7,14}$').hasMatch(value)) {
                      return 'The length of the phone number must be 8-15 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          contactViewModel.addContact();
                        },
                        child: Text('Save')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          contactViewModel.editContact();
                        },
                        child: const Text('Update'))
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "My Contact List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                contacts.isEmpty
                    ? const Text(
                        "Contact List is Empty",
                        style: TextStyle(fontSize: 11),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: contactViewModel.contacts.length,
                          itemBuilder: (context, index) => getRow(index),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              contacts[index].contact,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 70.0,
          child: Row(
            children: [
              InkWell(
                  onTap: (() {
                    //
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  }),
                  child: Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}