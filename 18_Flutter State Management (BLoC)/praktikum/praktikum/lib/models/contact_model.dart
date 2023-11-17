import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String date;
  final Color color;
  final String? filePath;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    this.filePath,
  });
}
