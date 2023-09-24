import 'package:flutter/material.dart';


void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App'),
        ),
        body: Center(child: const Text('This is Material App'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(title: const Text('Home'),
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