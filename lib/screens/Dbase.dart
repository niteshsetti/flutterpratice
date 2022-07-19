// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:first/screens/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> get_path() async {
    final database = openDatabase(
        join(await getDatabasesPath(), 'doggie_database.db'),
        version: 1, onCreate: (Database db, int version) {
           db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });
    return database;
  }
}

class Doginsert extends DatabaseConnection {
  Future<Database> database = dbc.get_path();
  Future<int> insert_dog(Dog dog) async {
    final db = await database;
    return db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetch_dog() async {
    final db = await database;
    final List<Map<String, dynamic>> dogs = await db.query("dogs");
    return dogs;
  }

  Future<int> update_dog(Dog dog) async {
    final db = await database;
    return db.update("dogs", dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<int> delete_dog(int index) async {
    final db = await database;
    return db.delete("dogs", where: 'id = ?', whereArgs: [index]);
  }
}

DatabaseConnection dbc = DatabaseConnection();
Doginsert databaseConnection = Doginsert();
