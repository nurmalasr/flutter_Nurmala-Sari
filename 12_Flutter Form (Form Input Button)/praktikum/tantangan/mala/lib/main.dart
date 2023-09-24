import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6750A4), 
      ),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6750A4),
        title: Text("Contacts"),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      addContact();
                      printContacts();
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
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "List Contacts",
              style:TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )
            ),
            ContactList(contacts: contacts), // Menampilkan daftar kontak
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

  void printContacts() {
    print(contacts.map((contact) {
      return {'title': contact.name, 'subtitle': contact.phoneNumber};
    }).toList());
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

  ContactList({required this.contacts});

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
                  print('Edit ${contact.name}');
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Delete ${contact.name}');
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





















