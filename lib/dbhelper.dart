import 'dart:io';
//import 'package:diss_app/Models/ResultsModel.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    // Get the application documents directory path
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'hackathondb.db');
    // Copy the database file from assets if it doesn't exist in documents directory
    ByteData data = await rootBundle.load('lib/assets/hackathondb.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
    // Open the database
    _database = await openDatabase(path, readOnly: true);
    return _database!;
  }

  static Future<void> deleteEntry(String timestamp) async {
    final db = await database;
    await db.delete(
      'Notifications', // replace with your actual table name
      where: 'Timestamp = ?',
      whereArgs: [timestamp],
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    final results = await db.rawQuery('SELECT * '
        'FROM Notifications; ');
    return results;
  }
}
