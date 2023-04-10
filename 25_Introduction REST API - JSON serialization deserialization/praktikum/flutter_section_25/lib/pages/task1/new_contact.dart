import 'package:flutter/material.dart';

import '../../data/api_client.dart';
import '../../models/contact.dart';
import '../item_contact.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: FutureBuilder<Contact>(
          future: ApiClient().postContact(),
          builder: (context, snapshot) {
            var contact = snapshot.data ?? Contact();
            contact.name = "Alex Under";
            contact.phone = "0821867326725";
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
