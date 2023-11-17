import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:praktikum/bloc/contacts/contacts_bloc.dart';
import 'package:praktikum/models/contact_model.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is ContactInitialState) {
          return _buildInitialUI();
        } else if (state is ContactLoadedState) {
          return _buildContactList(state.contacts);
        }
        return Container();
      },
    );
  }

  Widget _buildInitialUI() {
    return Scaffold(
        // Add UI components for the initial state
        // ...
        );
  }

  Widget _buildContactList(List<Contact> contacts) {
    return Scaffold(
        // Add UI components for displaying contacts
        // ...
        );
  }
}
