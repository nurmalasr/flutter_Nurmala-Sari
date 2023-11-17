import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';
import 'login_page.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int _selectedIndex = -1;
  final _formKey = GlobalKey<FormState>();
  String? username;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  int? _selectedContactId;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _refreshContactList();
  }

  // Function to load the username from shared preferences
  _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  _refreshContactList() async {
    List<Map<String, dynamic>> contacts = await _dbHelper.getContacts();
    setState(() {
      _selectedContactId = null;
      nameController.text = '';
      phoneController.text = '';
      // Update the contact list
      // ...
    });
  }

  _submitContact() async {
    Map<String, dynamic> contact = {
      'name': nameController.text,
      'phoneNumber': phoneController.text,
    };

    if (_selectedContactId == null) {
      // Add new contact
      await _dbHelper.insertContact(contact);
    } else {
      // Update existing contact
      contact['id'] = _selectedContactId;
      await _dbHelper.updateContact(contact);
    }

    _refreshContactList();
  }

  _deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _refreshContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6750A4),
        title: Text("Contacts"),
        actions: [
          // Display the username in the AppBar
          username != null
              ? Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Hello, $username!",
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              : SizedBox.shrink(),
          // Add a logout button in the AppBar
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
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
                "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
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
              key: _formKey,
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
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        if (!isValidName(value)) {
                          return 'Name is not valid';
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
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        }
                        if (!isValidPhoneNumber(value)) {
                          return 'Phone number is not valid';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_selectedIndex == -1) {
                          // Mode tambah kontak baru
                          addContact();
                        } else {
                          // Mode edit kontak
                          editContact();
                        }
                        printContacts();
                        _formKey.currentState!.reset();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF6750A4),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    child: Text(
                      _selectedIndex == -1 ? "Submit" : "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "List Contacts",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ContactList(
              contacts: contacts,
              onEdit: (index) {
                setState(() {
                  _selectedIndex = index;
                  nameController.text = contacts[index].name;
                  phoneController.text = contacts[index].phoneNumber;
                });
              },
              onDelete: (index) {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ), // Menampilkan daftar kontak
          ],
        ),
      ),
    );
  }

  void addContact() {
    setState(() {
      final String name = nameController.text;
      final String phone = phoneController.text;
      contacts.add(Contact(name: name, phoneNumber: phone));
      nameController.clear();
      phoneController.clear();
    });
  }

  void editContact() {
    setState(() {
      final String name = nameController.text;
      final String phone = phoneController.text;
      contacts[_selectedIndex] = Contact(name: name, phoneNumber: phone);
      nameController.clear();
      phoneController.clear();
      _selectedIndex = -1; // Reset selectedIndex setelah edit
    });
  }

  void printContacts() {
    print(contacts.map((contact) {
      return {'title': contact.name, 'subtitle': contact.phoneNumber};
    }).toList());
  }

  bool isValidName(String name) {
    if (name.isEmpty) return false;
    final words = name.split(' ');
    if (words.length < 2) return false;
    for (final word in words) {
      if (word.isEmpty) return false;
      if (word[0] != word[0].toUpperCase()) return false;
      if (!word.codeUnits.every(
          (unit) => unit >= 65 && unit <= 90 || unit >= 97 && unit <= 122))
        return false;
    }
    return true;
  }

  bool isValidPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;
    if (!phoneNumber.startsWith('0')) return false;
    if (!RegExp(r'^[0-9]{8,15}$').hasMatch(phoneNumber)) return false;
    return true;
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.phoneNumber,
  });
}

class ContactList extends StatefulWidget {
  final List<Contact> contacts;
  final void Function(int) onEdit;
  final void Function(int) onDelete;

  ContactList(
      {required this.contacts, required this.onEdit, required this.onDelete});

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
            child: Initicon(
              text: initial,
              backgroundColor: Colors.green,
            ),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  widget.onEdit(index);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.onDelete(index);
                },
              ),
            ],
          ),
          onTap: () {
            print('Tapped on ${contact.name}');
          },
        );
      },
    );
  }
}

_logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("username");

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
