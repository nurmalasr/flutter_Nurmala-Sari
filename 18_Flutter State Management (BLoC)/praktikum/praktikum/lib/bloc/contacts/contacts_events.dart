import 'package:praktikum/models/contact_model.dart';

abstract class ContactsEvent {}

class AddContactEvent extends ContactsEvent {
  final Contact contact;

  AddContactEvent({required this.contact});
}
