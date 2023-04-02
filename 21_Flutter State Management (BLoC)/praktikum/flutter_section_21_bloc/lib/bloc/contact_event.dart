part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => List.empty();
}

class CreateContact extends ContactEvent {
  final ContactModel contact;

  CreateContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final ContactModel contact;

  DeleteContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class LoadContact extends ContactEvent {}

class UpdateContact extends ContactEvent {
  final ContactModel contact;

  UpdateContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class ContactErrored extends ContactEvent {}
