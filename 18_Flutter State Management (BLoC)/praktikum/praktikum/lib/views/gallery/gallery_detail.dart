import 'package:flutter/material.dart';

class GalleryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Column(
      children: [
        Image.network(imageUrl),
      ],
    );
  }
}
