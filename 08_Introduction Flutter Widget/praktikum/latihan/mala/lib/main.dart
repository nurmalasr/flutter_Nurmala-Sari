import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
          title: const Text('Halo semua, namaku Mala!'),
        ),
        body: Center(child: Text('material')
        ), 
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                ),
                child: Text('drawer header')),
                ListTile(title: Text('title1')),
                ListTile(title: Text('title2'))
            ]
              )
        ),
        bottomNavigationBar: NavigationBar(indicatorColor: Colors.green,
        destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.abc), label: 'home'),
        NavigationDestination(icon: Icon(Icons.abc), label: 'settings'),
          ])
        ));
  }
}

