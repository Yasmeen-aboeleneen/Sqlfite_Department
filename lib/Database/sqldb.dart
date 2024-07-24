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
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return myDB;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("onUpgrade for Database============================");
    await db.execute("ALTER TABLE notes COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
   
   CREATE TABLE "notes" (
   
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "note" TEXT NOT NULL
   )

''');
    print('CREATE DATABASE AND TABLE=====================================');
  }

  readData(String sql) async {
    //for select
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    //for insert
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updatetData(String sql) async {
    //for update
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    //for delete
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteMyDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "databasename.db");
    await deleteDatabase(path);
  }
}
