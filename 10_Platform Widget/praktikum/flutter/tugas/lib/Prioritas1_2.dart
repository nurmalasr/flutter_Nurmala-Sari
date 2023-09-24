import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App'),
        ),
        body: Center(
          child: ListView(
            children: [
              ContactList(),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Home'),
              ),
              ListTile(
                title: const Text('Settings'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
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

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Nurmala Sari',
      phoneNumber: '+6281371247017',
    ),
    Contact(
      name: 'Marsya Adya Tami',
      phoneNumber: '+6289567340912',
    ),
    Contact(
      name: 'Delia Sepiana',
      phoneNumber: '+6281287327450',
    ),
        Contact(
      name: 'Agustin Elisabeth',
      phoneNumber: '+6282209347823',
    ),
        Contact(
      name: 'Zize Arhan',
      phoneNumber: '+6289745630212',
    ),
        Contact(
      name: 'Jennie Blackpink',
      phoneNumber: '+628763456289',
    ),
        Contact(
      name: 'Xafiera Putri',
      phoneNumber: '+6283458230456',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final contact = contacts[index];
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
          onTap: () {
            print('Tapped on ${contact.name}');
          },
        );
      },
    );
  }
}

