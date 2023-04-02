import 'package:flutter/material.dart';
import 'package:flutter_section_20_provider/ui/models/contact_model.dart';

class ContactProvider with ChangeNotifier {
  final List<ContactModel> _contacts = [
    // ContactModel('Name', 'contactPhoneNumber')
  ];

  List<ContactModel> get contact => _contacts;

  void addContact(ContactModel contact) {
    _contacts.insert(0, contact);
    notifyListeners();
  }

  void deleteContact(ContactModel contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
}
