import 'package:flutter/material.dart';
import 'combine.dart'; 
import 'picker.dart'; 


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
      home: DefaultTabController(
        length: 2, // Jumlah tab (Calender dan Contacts)
        child: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
            backgroundColor: Color(0xFF6750A4),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Calender'), // Nama tab pertama
                Tab(text: 'Contacts'), // Nama tab kedua
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ContactPage(), 
              HomePage(), 
            ],
          ),
        ),
      ),
    );
  }
}





