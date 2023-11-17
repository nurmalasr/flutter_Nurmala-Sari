import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/models/contact_model.dart';

// Events
abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent({required this.contact});
}

// States
abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> contacts;

  ContactLoadedState({required this.contacts});
}

// Bloc
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitialState());
  final List<Contact> contacts = [];

  @override
  ContactState get initialState => ContactInitialState();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is AddContactEvent) {
      contacts.add(event.contact);
      yield ContactLoadedState(contacts: List.from(contacts));
    }
  }
}
