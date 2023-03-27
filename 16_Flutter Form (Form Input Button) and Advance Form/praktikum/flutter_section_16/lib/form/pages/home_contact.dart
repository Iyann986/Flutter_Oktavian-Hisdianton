import 'package:flutter/material.dart';

class HomeContactPage extends StatefulWidget {
  const HomeContactPage({super.key});

  @override
  State<HomeContactPage> createState() => _HomeContactPageState();
}

class Contact {
  String name;
  String phone;

  Contact({required this.name, required this.phone});
}

class _HomeContactPageState extends State<HomeContactPage> {
  final List<Contact> contacts = List.empty(growable: true);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  int selectedIndex = -1;

  void deleteContact(int index) {
    contacts.removeAt(index);
    setState(() {});
  }

  void editContact(int index) {
    final contact = contacts[index];
    nameController.text = contact.name;
    phoneController.text = contact.phone;
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Insert Your Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama harus diisi oleh user.';
                }
                if (value.split(' ').length < 2) {
                  return 'Nama harus terdiri dari minimal 2 kata.';
                }
                if (!value.contains(RegExp(r'^[A-Z]'))) {
                  return 'Setiap kata harus dimulai dengan huruf kapital.';
                }
                if (value.contains(RegExp(r'\d')) ||
                    value.contains(RegExp(r'[^\w\s]'))) {
                  return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Nomor',
                hintText: '+62 ...',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nomor telepon harus diisi oleh user.';
                }
                if (!value.contains(RegExp(r'^\d+$'))) {
                  return 'Nomor telepon harus terdiri dari angka saja.';
                }
                if (value.length < 8 || value.length > 15) {
                  return 'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit.';
                }
                if (!value.startsWith('0')) {
                  return 'Nomor telepon harus dimulai dengan angka 0.';
                }

                return null;
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 90,
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff6750A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String nameContact = nameController.text.trim();
                        String phoneContact = phoneController.text.trim();
                        if (nameContact.isNotEmpty && phoneContact.isNotEmpty) {
                          setState(() {
                            nameController.text = '';
                            phoneController.text = '';
                            contacts[selectedIndex].name = nameContact;
                            contacts[selectedIndex].phone = phoneContact;
                            selectedIndex = -1;
                          });
                        }
                      }
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: 90,
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff6750A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String nameContact = nameController.text.trim();
                        String phoneContact = phoneController.text.trim();
                        if (nameContact.isNotEmpty && phoneContact.isNotEmpty) {
                          setState(() {
                            nameController.text = '';
                            phoneController.text = '';
                            contacts.add(
                              Contact(
                                name: nameContact,
                                phone: phoneContact,
                              ),
                            );
                          });
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.security_update_good_outlined),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Create New Contacts',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Divider(
                        color: Colors.grey,
                        height: 5,
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: formKey,
            child: buildForm(),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'List Contacts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xffEADDFF),
                    child: Text(
                      contact.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff21005D),
                      ),
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          editContact(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              contacts.removeAt(index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
