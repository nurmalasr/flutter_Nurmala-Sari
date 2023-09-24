import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  bool checkValueCPlusPlus = false;
  bool checkValueDart = false;
  bool checkValuePHP = false;
  List<Map<String, String>> data_kontak = [
    {"title": "Kepala SUku", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Bahasa Cinta", "jenis_kelamin": "perempuan"},
    {"title": "Bendahara Sekolah", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Matematika", "jenis_kelamin": "Perempuan"},
    {"title": "Guru Biologi", "jenis_kelamin": "Laki-laki"}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Muchson App'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey,
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mala'),
                      Text('Mala'),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text('List Anak Didik'),
                  TextField(
                    controller: inputControllers,
                    onChanged: (inputControllers) {
                      print('$inputControllers');
                    },
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Laki-laki',
                        groupValue: radioValue,
                        onChanged: (String? value) {
                          setState(() {
                            radioValue = value ?? '';
                            print('Nilai dari radio value =  $radioValue');
                          });
                        },
                      ),
                      Text('Laki - laki'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Perempuan',
                        groupValue: radioValue,
                        onChanged: (String? value) {
                          setState(() {
                            radioValue = value ?? '';
                            print('Nilai dari radio value =  $radioValue');
                          });
                        },
                      ),
                      Text('Perempuan'),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Checkbox(
                        value: checkValueCPlusPlus,
                        checkColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValueCPlusPlus = value ?? false;
                            print('C++: $checkValueCPlusPlus');
                          });
                        },
                      ),
                      Text('C++'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkValueDart,
                        checkColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValueDart = value ?? false;
                            print('Dart: $checkValueDart');
                          });
                        },
                      ),
                      Text('Dart'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkValuePHP,
                        checkColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValuePHP = value ?? false;
                            print('PHP: $checkValuePHP');
                          });
                        },
                      ),
                      Text('PHP'),
                    ],
                  ),
                  Divider(),
                  DropdownButton(
                    value: dropDownValue,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text('pilihan 1'),
                      ),
                      DropdownMenuItem(value: 1, child: Text('pilihan 2')),
                      DropdownMenuItem(value: 2, child: Text('pilihan 3'))
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        dropDownValue = value ?? 0;
                        print('$dropDownValue');
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      setState(() {
                        data_kontak.add({
                          "title": "${inputControllers.text}",
                          "jenis_kelamin": "$radioValue"
                        });
                      });

                      print('data_kontak : $data_kontak');
                    },
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: data_kontak.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text('${data_kontak[index]["title"]}'),
                          subtitle:
                              Text('${data_kontak[index]["jenis_kelamin"]}'),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.green;
    }
    return Colors.grey;
  }
}
