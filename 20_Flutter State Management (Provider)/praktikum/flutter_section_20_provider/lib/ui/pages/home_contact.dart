import 'package:flutter/material.dart';
import 'package:flutter_section_20_provider/ui/controllers/contact_provider.dart';
import 'package:flutter_section_20_provider/ui/pages/contact_card.dart';
import 'package:flutter_section_20_provider/ui/pages/create_contact.dart';

import 'package:provider/provider.dart';

class HomeContact extends StatelessWidget {
  const HomeContact({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contacts'),
        centerTitle: true,
      ),
      body: (contactProvider.contact.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.people,
                    size: 50,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your contact is empty',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: contactProvider.contact
                  .map(
                    (contact) => Stack(
                      children: [
                        ContactCard(
                          contactName: contact.contactName ?? '',
                          phoneNumber: contact.phoneNumber ?? '',
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  contactProvider.deleteContact(contact);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 35,
                                  color: Colors.red.shade300,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateContact(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
