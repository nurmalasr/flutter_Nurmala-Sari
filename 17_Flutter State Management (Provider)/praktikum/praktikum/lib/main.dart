import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:praktikum/models/contact.dart';

import 'galery.dart';
import 'package:provider/provider.dart';
import 'package:praktikum/view_model/contact_provider.dart' as contact_store;
import 'package:dio/dio.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => contact_store.Contact(),
        )
      ],
      child: const ContactApp(),
    ),
  );
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = const Color(0xFFE7E0EC);
  PlatformFile? _selectedFile;

  String name = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        backgroundColor: const Color(0xFF6200EE),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Galery'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const GaleryPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ContactPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 25,
            ),
            const SizedBox(height: 18),
            const Text(
              'Create New Contact',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            const Text(
              'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            // Form Name
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    onChanged: (String value) {
                      name = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Insert your name',
                      filled: true,
                      fillColor: Color.fromARGB(255, 186, 185, 185),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Form Nomor HP
                  TextFormField(
                    controller: phoneNumberController,
                    onChanged: (String value) {
                      phoneNumber = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '08 ...',
                      filled: true,
                      fillColor: Color.fromARGB(255, 186, 185, 185),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Date Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Date'),
                      TextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1991),
                            lastDate: DateTime(DateTime.now().year + 5),
                          );

                          if (selectedDate != null) {
                            setState(() {
                              _dueDate = selectedDate;
                            });
                          }
                        },
                        child: const Text('Select'),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(_dueDate),
                  ),
                  const SizedBox(height: 12),
                  // Color Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Color'),
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: _currentColor,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(_currentColor),
                          ),
                          child: const Text('Pick Color'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Pick Your Color'),
                                  content: BlockPicker(
                                    pickerColor: _currentColor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        _currentColor = color;
                                      });
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('File: ${_selectedFile?.name ?? 'None'}'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
                      if (result != null && result.files.isNotEmpty) {
                        contactProvider.setSelectedFile(result.files.first);
                      }
                    },
                    child: Text('Pick File'),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (!formkey.currentState!.validate()) return;

                formkey.currentState!.save();

                contactProvider.add(GetContact(
                  name: name,
                  phoneNumber: phoneNumber,
                  date: _dueDate,
                  color: _currentColor,
                  filePath: _selectedFile?.path ?? '',
                ));
                nameController.clear();
                phoneNumberController.clear();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFF6750a4)),
              child: const Text('Submit'),
            ),

            const SizedBox(height: 12),
            // List View Contact

            Expanded(
              child: ListView.builder(
                itemCount: contactProvider.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(contactProvider.contacts[index].name[0]
                          .toUpperCase()),
                    ),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: contactProvider.contacts[index].name,
                            style: const TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C1B1F),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: contactProvider.contacts[index].phoneNumber,
                            style: const TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C1B1F),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: DateFormat('dd-MM-yyyy')
                                .format(contactProvider.contacts[index].date),
                            style: const TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C1B1F),
                              letterSpacing: 0.25,
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          TextSpan(
                            text: 'Color: ',
                            style: const TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C1B1F),
                              letterSpacing: 0.25,
                            ),
                            children: [
                              WidgetSpan(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: contactProvider.contacts[index].color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            editContact(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void editContact(int index) {
    final contactProvider =
        Provider.of<contact_store.Contact>(context, listen: false);
    final GetContact contactToEdit = contactProvider.contacts[index];
    nameController = TextEditingController(text: contactToEdit.name);
    phoneNumberController =
        TextEditingController(text: contactToEdit.phoneNumber);
    DateTime editedDate = DateTime.now();
    editedDate = contactToEdit.date;
    Color editedColor = contactToEdit.color;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                    onPressed: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: editedDate,
                        firstDate: DateTime(1991),
                        lastDate: DateTime(currentDate.year + 5),
                      );

                      if (selectDate != null) {
                        setState(() {
                          editedDate = selectDate;
                        });
                      }
                    },
                    child: const Text(
                      'Select',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Color'),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                color: editedColor, // Display the current color
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      editedColor,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick your color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor:
                                  editedColor, // Pass the current color
                              onColorChanged: (color) {
                                setState(() {
                                  editedColor =
                                      color; // Update the edited color
                                });
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Pick Color',
                    style: TextStyle(
                      color: Color(0xFF49454F),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final contactProvider = Provider.of<contact_store.Contact>(
                      context,
                      listen: false);
                  contactProvider.edit(
                      index,
                      GetContact(
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        date: editedDate,
                        color: editedColor,
                        filePath: _selectedFile?.path ?? '',
                      ));
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFF6750A4),
                ),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteContact(int index) {
    final contactProvider =
        Provider.of<contact_store.Contact>(context, listen: false);
    contactProvider.remove(index);
  }
}
