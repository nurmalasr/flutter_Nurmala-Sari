import 'package:flutter/material.dart';
import 'package:praktikum/models/contact.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void edit(int index, GetContact updateContact) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] = updateContact;
      notifyListeners();
    }
  }

  void remove(int index) {
    if (index >= 0 && index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }
}
