import 'package:flutter/material.dart';
import 'package:flutter_section_25/data/api_client.dart';
import 'package:flutter_section_25/models/contact.dart';
import 'package:flutter_section_25/pages/item_contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Contact>(
        future: ApiClient().getContacts(),
        builder: (context, snapshot) {
          var contact = snapshot.data ?? Contact();
          return Center(
            child: _initState(
              snapshot,
              child: ItemContact(
                contact: contact,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _initState(AsyncSnapshot<Contact> snapshot, {Widget? child}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return const Text(
        'Terjadi Kesalahan',
        style: TextStyle(fontSize: 50, color: Colors.red),
      );
    } else {
      return child ?? Container();
    }
  }
}
