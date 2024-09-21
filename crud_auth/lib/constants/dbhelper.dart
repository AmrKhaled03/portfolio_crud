import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Dbhelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

 Future<Database?> initDB() async {
  String path = await getDatabasesPath();
  String fullPath = join(path, "Portfolio.db");
  debugPrint("Database path: $fullPath"); // Check if database is created
  return openDatabase(fullPath, onCreate: _onCreate, version: 3);
}


  Future<void> _onCreate(Database db, int version) async {
    // Create both tables in one method
    await db.execute('''CREATE TABLE "Properties"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "subTitle" TEXT NOT NULL,
      "description" TEXT NOT NULL
    )''');
  }




  Future<List<Map<String, dynamic>>> getData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawQuery(sql);
  }
  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawInsert(sql);
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawDelete(sql);
  }

  Future<int> updateDate(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawUpdate(sql);
  }

Future<void> dropDB() async {
  String path = await getDatabasesPath();
  String fullPath = join(path, "Portfolio.db"); // Change "Tasks.db" to "Portfolio.db"
  return await deleteDatabase(fullPath);
}

}