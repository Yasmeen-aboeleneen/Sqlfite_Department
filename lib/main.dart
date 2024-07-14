import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as SqfliteDataBase;
import 'package:sqflite/sqlite_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String databasesPath = await SqfliteDataBase.getDatabasesPath();
  print(databasesPath); // /data/user/0/com.example.sqflite_department/databases
  String myDbName = "testDatabase.db";
  String myDbPath = "$databasesPath/$myDbName";
  int versionDb = 1;
  SqfliteDataBase.openDatabase(
    myDbPath,
    version: versionDb,
    onCreate: (Database db, int version) {
      print(db);
      print(version);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
    );
  }
}
