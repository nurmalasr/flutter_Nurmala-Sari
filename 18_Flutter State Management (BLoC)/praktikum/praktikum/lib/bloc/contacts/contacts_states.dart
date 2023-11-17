import 'package:praktikum/models/contact_model.dart';

abstract class ContactsState {}

class ContactsInitialState extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  final List<Contact> contacts;

  ContactsLoadedState({required this.contacts});
}
