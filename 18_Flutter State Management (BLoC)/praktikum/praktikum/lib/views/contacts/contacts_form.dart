import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:praktikum/bloc/contacts/contacts_bloc.dart';
import 'package:praktikum/models/contact_model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:praktikum/utils/validators.dart';
import 'package:praktikum/views/contacts/contacts_page.dart';

class ContactList extends StatefulWidget {
  final List<Contact> contacts;

  ContactList({required this.contacts});

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  void _deleteContact(Contact contact) {
    setState(() {
      widget.contacts.remove(contact);
    });
  }

  void _showContactDetail(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${contact.name}'),
              Text('Telephone: ${contact.phoneNumber}'),
              Text('Date: ${contact.date}'),
              Text('Color: ${contact.color.toString()}'),
              if (contact.filePath != null) Text('File: ${contact.filePath}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contacts.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final contact = widget.contacts[index];
        final initial = contact.name.isNotEmpty ? contact.name[0] : '';

        return ListTile(
          leading: CircleAvatar(
            child: Text(initial),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteContact(contact);
                },
              ),
              IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  _showContactDetail(context, contact);
                },
              ),
            ],
          ),
          onTap: () {
            // Handle tap on contact
          },
        );
      },
    );
  }
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Colors.orange;
  PlatformFile? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is ContactInitialState) {
          return _buildInitialUI(context);
        } else if (state is ContactLoadedState) {
          return _buildContactList(context, state.contacts);
        }
        return Container();
      },
    );
  }

  Widget _buildInitialUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Color(0xFF6750A4),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6750A4),
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.phone_android,
                size: 30.0,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Create New Contacts",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made.",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Insert Your Name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        filled: true,
                        fillColor: Color(0xFFEFE4FB),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (!isValidName(value)) {
                          return 'Invalid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: "Telephone",
                        hintText: "+62 ...",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        filled: true,
                        fillColor: Color(0xFFEFE4FB),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (!isValidPhoneNumber(value)) {
                          return 'Invalid Phone Number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}'),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(1991),
                      lastDate: DateTime(_selectedDate.year + 5),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    }
                  },
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Color:'),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: _selectedColor,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Pick Your Color'),
                            content: BlockPicker(
                              pickerColor: _selectedColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Pick Color'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitForm(context);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            Text(
              "List Contacts",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ContactList(contacts: context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactList(BuildContext context, List<Contact> contacts) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Color(0xFF6750A4),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6750A4),
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add UI components for displaying contacts
            ContactList(contacts: contacts),
          ],
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final String name = nameController.text;
      final String phone = phoneController.text;
      final String date = DateFormat('dd-MM-yyyy').format(_selectedDate);

      // Create Contact object and dispatch an event
      final Contact newContact = Contact(
        name: name,
        phoneNumber: phone,
        date: date,
        color: _selectedColor,
      );
      context.read<ContactBloc>().add(AddContactEvent(contact: newContact));

      // Clear form fields
      nameController.clear();
      phoneController.clear();

      // Reset date and color to default
      setState(() {
        _selectedDate = DateTime.now();
        _selectedColor = Colors.orange;
      });
    }
  }
}
