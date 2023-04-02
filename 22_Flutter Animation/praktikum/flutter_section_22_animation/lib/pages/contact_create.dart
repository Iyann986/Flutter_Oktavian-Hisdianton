import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../models/contact_model.dart';

class ContactCreate extends StatefulWidget {
  const ContactCreate({super.key});

  static const String route = '/createContact';

  @override
  State<ContactCreate> createState() => _ContactCreateState();
}

class _ContactCreateState extends State<ContactCreate> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: const Text('Create Contact'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.security_update_good_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: const [
                      Text(
                        'Create New Contacts',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Divider(
                        color: Colors.grey,
                        height: 5,
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 15.0),
                    ],
                  ),
                  Material(
                    shadowColor: Colors.black54,
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.black,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                      validator: _validateName,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shadowColor: Colors.black,
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Phone Number',
                        hintText: '(+62)',
                        prefixIcon: Icon(Icons.phone),
                        prefixIconColor: Colors.black,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                      validator: _validatePhone,
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ContactBloc, ContactState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();

                          if (!isValid) {
                            return;
                          }

                          final contact = ContactModel(
                            name: _nameController.text,
                            phone: _phoneController.text,
                          );

                          final duplicate = state.contacts
                              .where(
                                  (element) => element.phone == contact.phone)
                              .isNotEmpty;

                          if (duplicate) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Contact already exists'),
                              ),
                            );
                            return;
                          }

                          context
                              .read<ContactBloc>()
                              .add(CreateContact(contact: contact));

                          return Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.minPositive, 20),
                            backgroundColor: Colors.purple[400],
                            padding: const EdgeInsets.all(15),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Text(
                          'Create Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Nama harus diisi oleh user';
    } else if (value.length < 3) {
      return 'Nama terlalu pendek';
    } else {
      return null;
    }
  }

  String? _validatePhone(String? value) {
    if (isMobileNumberValid(value!)) {
      return 'Nomor telepon harus diisi oleh user';
    } else if (value.length < 8) {
      return 'Panjang nomor telepon harus minimal 8 digit';
    } else if (value.length > 15) {
      return 'Panjang nomor telepon maksimal 15 digit';
    } else {
      return null;
    }
  }

  bool isMobileNumberValid(String phoneNumber) {
    String regexPattern = r'^(?:[1-9])?[0-9]{11,15}$';
    var regExp = RegExp(regexPattern);

    if (phoneNumber.isEmpty) {
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }
}
