import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  late Database _database; // Change to non-nullable

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'contacts.db');

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phoneNumber TEXT
      )
    ''');
  }

  Future<int> insertContact(Map<String, dynamic> contact) async {
    Database db = await this.database;
    return await db.insert('contacts', contact);
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    Database db = await this.database;
    return await db.query('contacts');
  }

  Future<int> updateContact(Map<String, dynamic> contact) async {
    Database db = await this.database;
    return await db.update('contacts', contact,
        where: 'id = ?', whereArgs: [contact['id']]);
  }

  Future<int> deleteContact(int id) async {
    Database db = await this.database;
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
