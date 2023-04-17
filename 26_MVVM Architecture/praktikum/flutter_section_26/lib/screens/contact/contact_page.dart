import 'package:flutter/material.dart';
import 'package:flutter_section_26/item_data.dart';
import 'package:flutter_section_26/models/contact.dart';
import 'package:flutter_section_26/screens/contact/contact_viewmodel.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ContactViewModel>(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Center(
          child: _body(viewModel),
        ),
      ),
    );
  }

  Widget _body(ContactViewModel viewModel) {
    final isLoading = viewModel.state == ContactViewState.loading;
    final isError = viewModel.state == ContactViewState.error;

    if (isLoading) {
      return const CircularProgressIndicator();
    } else if (isError) {
      return const Text(
        'Tidak ada Data',
        style: TextStyle(fontSize: 30, color: Colors.red),
      );
    } else {
      return _itemList(viewModel.listContact);
    }
  }

  Widget _itemList(List<Contact> listContact) => listContact.isEmpty
      ? const Center(
          child: Text(
            'Tidak ada Data',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
        )
      : ListView.builder(
          itemCount: listContact.length,
          itemBuilder: (context, index) {
            var contact = listContact[index];
            return ItemData(
              title: contact.name,
              subtitle: contact.phone,
            );
          });
}
