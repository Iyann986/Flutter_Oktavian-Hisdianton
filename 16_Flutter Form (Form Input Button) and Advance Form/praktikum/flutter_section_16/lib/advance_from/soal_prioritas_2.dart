import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_section_16/advance_from/file_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';

class AdvanceFormContact extends StatefulWidget {
  const AdvanceFormContact({super.key});

  @override
  State<AdvanceFormContact> createState() => _AdvanceFormContactState();
}

class Contact {
  String name;
  String phone;

  Contact({required this.name, required this.phone});
}

class _AdvanceFormContactState extends State<AdvanceFormContact> {
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

  // variabel untuk menyimpan data yang diinputkan
  String name = '';
  String number = '';
  DateTime? date;
  Color color = Colors.black;
  File? file;

  // method untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  // method untuk menampilkan color picker
  void _selectColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select a color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: color,
                onColorChanged: (newColor) {
                  setState(() {
                    color = newColor;
                  });
                },
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // method untuk menampilkan file picker
  Future<void> _selectFile(BuildContext context) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path);
      });
      if (Platform.isAndroid) {
        final fileInfo = FileInfo(
          pickedFile.path,
          await _getMimeType(pickedFile.path),
        );
        _openFile(fileInfo);
      } else if (Platform.isIOS) {
        _openFile(PlatformFile(
          name: pickedFile.path.split('/').last,
          path: pickedFile.path,
          size: await File(pickedFile.path).length(),
        ));
      }
    }
  }

  void _openFile(dynamic file) async {
    try {
      final result = await OpenFile.open(file.path);
      print(result);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> _getMimeType(String path) async {
    final mimeType = await FileTypeHelper.getFileMimeType(path);
    if (mimeType != null) {
      return mimeType;
    }
    return '*/*';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.security_update_good_outlined),
              Column(
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
                  // const SizedBox(height: 15.0),
                  const Divider(
                    color: Colors.grey,
                    height: 5,
                    thickness: 3,
                    indent: 10,
                    endIndent: 10,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: buildForm(),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750A4),
                ),
                child: Text(date == null
                    ? 'Select a date'
                    : 'Selected date: ${date.toString()}'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                ),
                onPressed: () {
                  _selectColor(context);
                },
                child: const Text('Select a color'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6750A4),
                ),
                child: Text(file == null ? 'Select a file' : 'File selected'),
                onPressed: () {
                  _selectFile(context);
                },
              ),
              const SizedBox(
                height: 16.0,
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
        ),
      ),
    );
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
}
