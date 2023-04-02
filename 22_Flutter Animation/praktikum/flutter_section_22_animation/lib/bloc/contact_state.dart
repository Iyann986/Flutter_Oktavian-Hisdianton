part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {
  final List<ContactModel> contacts;

  const ContactState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactInitial extends ContactState {
  const ContactInitial({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class ContactLoaded extends ContactState {
  const ContactLoaded({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class ContactCreated extends ContactState {
  const ContactCreated({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class ContactDeleted extends ContactState {
  const ContactDeleted({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class ContactUpdated extends ContactState {
  const ContactUpdated({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class Error extends ContactState {
  // final String error;
  const Error({required List<ContactModel> contacts})
      : super(contacts: contacts);
}

class Loading extends ContactState {
  const Loading({required List<ContactModel> contacts})
      : super(contacts: contacts);
}
