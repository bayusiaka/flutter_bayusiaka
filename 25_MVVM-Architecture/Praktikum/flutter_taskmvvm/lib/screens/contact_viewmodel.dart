import 'package:flutter/material.dart';
import 'package:flutter_taskmvvm/models/contact.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact> contacts = [];
  int selectedIndex = -1;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  void addContact() {
    final String name = nameController.text.trim();
    final String contact = contactController.text.trim();

    if (name.isNotEmpty && contact.isNotEmpty) {
      contacts.add(Contact(name: name, contact: contact));
      clearFields();
      notifyListeners();
    }
  }

  void editContact() {
    final String name = nameController.text.trim();
    final String contact = contactController.text.trim();

    if (name.isNotEmpty && contact.isNotEmpty && selectedIndex != -1) {
      contacts[selectedIndex] = Contact(name: name, contact: contact);
      clearFields();
      notifyListeners();
    }
  }

  void deleteContact(int index) {
    if (index >= 0 && index < contacts.length) {
      contacts.removeAt(index);
      selectedIndex = -1;
      notifyListeners();
    }
  }

  void selectContact(int index) {
    if (index >= 0 && index < contacts.length) {
      selectedIndex = index;
      nameController.text = contacts[index].name;
      contactController.text = contacts[index].contact;
      notifyListeners();
    }
  }

  void clearFields() {
    nameController.clear();
    contactController.clear();
  }
}