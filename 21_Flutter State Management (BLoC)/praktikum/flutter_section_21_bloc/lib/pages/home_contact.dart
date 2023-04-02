import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import 'contact_create.dart';
import 'contact_empty.dart';
import 'contact_error.dart';
import 'contact_loading.dart';

class HomeContact extends StatelessWidget {
  const HomeContact({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<ContactBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: const Text('Contact List'),
          centerTitle: true,
        ),
        body: BlocBuilder<ContactBloc, ContactState>(
          bloc: dataBloc,
          builder: (context, state) {
            if (state is Loading) {
              return const ContactLoading();
            } else if (state is Error) {
              return const ContactError();
            } else if (state.contacts.isEmpty) {
              return const ContactEmpty();
            } else if (state is ContactLoaded || state is ContactInitial) {
              return ListView.separated(
                separatorBuilder: (_, index) => const SizedBox(height: 16),
                itemCount: state.contacts.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (_, index) {
                  final contact = state.contacts[index];
                  return ListTile(
                      leading: CircleAvatar(
                        child: Text(contact.name[0]),
                      ),
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                      tileColor: const Color.fromARGB(98, 95, 185, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context
                              .read<ContactBloc>()
                              .add(DeleteContact(contact: contact));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ));
                },
              );
            } else {
              return const ContactEmpty();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, ContactCreate.route);
          },
          backgroundColor: Colors.purple[400],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
