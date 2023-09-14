import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('List Materi Alterra : '),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                    Text('Introduction Flutter'),
                    Text('Flutter Widget'),
                    Text('Fundamental OOP'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(24, (index) => Text('Nurmala Sari')),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text('drawer header'),
              ),
              ListTile(title: Text('title1')),
              ListTile(title: Text('title2')),
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

