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
        body: Center(child: Text('material')),
    )
    );
  }
}
