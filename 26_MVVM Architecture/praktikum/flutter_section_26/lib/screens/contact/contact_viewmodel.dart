import 'package:flutter/material.dart';
import 'package:flutter_section_26/data/api_client.dart';
import 'package:flutter_section_26/models/contact.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact> _listContacts = [];
  List<Contact> get listContact => _listContacts;

  ContactViewState _state = ContactViewState.loading;
  ContactViewState get state => _state;

  _changeState(ContactViewState state) {
    _state = state;
    notifyListeners();
  }

  getAllContacts() async {
    try {
      final results = await ApiClient.getData();
      _listContacts = results.contacts;
      notifyListeners();
      _changeState(ContactViewState.none);
    } catch (e) {
      _changeState(ContactViewState.error);
    }
  }
}

enum ContactViewState { none, loading, error }
