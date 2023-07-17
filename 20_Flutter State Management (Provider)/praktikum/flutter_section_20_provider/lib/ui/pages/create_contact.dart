import 'package:flutter/material.dart';

import 'package:flutter_section_20_provider/ui/controllers/contact_provider.dart';
import 'package:flutter_section_20_provider/ui/models/contact_model.dart';
import 'package:flutter_section_20_provider/ui/pages/home_contact.dart';
import 'package:provider/provider.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({Key? key}) : super(key: key);

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  late TextEditingController contactName;
  late TextEditingController phoneNumberController;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    contactName = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contactName.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        title: const Text(
          "Create Contact",
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  shadowColor: Colors.black54,
                  elevation: 5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Nama harus diisi oleh user.";
                      }
                      return null;
                    },
                    controller: contactName,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black54,
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  shadowColor: Colors.black54,
                  elevation: 5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Nomor telepon harus diisi oleh user.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 13,
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelText: "Phone Number",
                      hintText: "(+62)",
                      counterText: "",
                      prefixIcon: Icon(Icons.phone),
                      prefixIconColor: Colors.black54,
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
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    formKey.currentState!.save();

                    contactProvider.addContact(
                      ContactModel(
                        contactName.text,
                        phoneNumberController.text,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeContact()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 30),
                      backgroundColor: Colors.green[400],
                      padding: const EdgeInsets.all(15),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: const Text(
                    "Add Contact",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
