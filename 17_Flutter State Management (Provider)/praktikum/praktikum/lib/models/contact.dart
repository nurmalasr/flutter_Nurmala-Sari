import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class GetContact {
  String name = '';
  String phoneNumber = '';
  DateTime date;
  Color color;
  PlatformFile filePath;

  GetContact({
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.color,
    required this.filePath,
  });
}
