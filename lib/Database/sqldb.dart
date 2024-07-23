import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDB();
      return _db;
    } else {
      return _db;
    }
  }

  intialDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "databasename.db");
    Database myDB = await openDatabase(path, onCreate: _onCreate);
    return myDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
   
   CREATE TABLE "notes" (
   
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
      notes TEXT NOT NULL
   )

''');
    print('CREATE DATABASE AND TABLE=====================================');
  }
}
