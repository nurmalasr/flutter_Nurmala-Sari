import 'package:flutter/material.dart';
import 'package:praktikum/models/contact_model.dart';

class ContactsDetail extends StatelessWidget {
  final Contact contact;

  ContactsDetail({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${contact.name}'),
        Text('Phone: ${contact.phoneNumber}'),
      ],
    );
  }
}
