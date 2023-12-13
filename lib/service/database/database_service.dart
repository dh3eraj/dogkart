import 'dart:async';

import 'package:dogkart/database/cart_db.dart';
import 'package:dogkart/database/images_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get getFullPath async {
    String dbName = "images.db";
    String path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<Database> _initialize() async {
    String path = await getFullPath;
    Database database = await openDatabase(path,
        version: 1, onCreate: onCreate, singleInstance: true);
    return database;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    ImagesDb().createTable(db);
    CartDb().createTable(db);
  }
}
