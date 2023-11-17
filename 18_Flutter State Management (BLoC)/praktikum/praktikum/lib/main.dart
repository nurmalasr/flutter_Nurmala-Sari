import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/contacts/contacts_bloc.dart';
import 'package:praktikum/views/contacts/contacts_page.dart';
import 'package:praktikum/views/gallery/gallery_detail.dart';
import 'package:praktikum/views/gallery/gallery_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/gallery': (context) => GalleryPage(),
        '/detail': (context) => GalleryDetail(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF6750A4),
      ),
      home: BlocProvider(
        create: (context) => ContactBloc(),
        child: ContactPage(),
      ),
    );
  }
}
