import 'package:flutter/material.dart';
import 'package:praktikum/views/recommend_page.dart';
import 'package:praktikum/views/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecomendationPage(),
      routes: {
        '/result': (context) => ResultPage(
            result: 'Dummy Result'), // Ganti dengan nilai yang sesuai
      },
    );
  }
}
