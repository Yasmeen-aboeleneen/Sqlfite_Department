import 'package:flutter/material.dart';
import 'package:sqflite_department/Database/sqldb.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  Sqldb sqldb = Sqldb();
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        ElevatedButton(
            onPressed: () async {
              int response = await sqldb.insertData(
                  "INSERT INTO 'notes' ('note') VALUES ('note two')");
              print("$response");
            },
            child: Container(
              child: Text("Insert Data"),
              width: 50,
              height: 20,
              color: Colors.red,
            )),
        ElevatedButton(
            onPressed: () async {
              List<Map> response =
                  await sqldb.readData("SELECT * FROM 'notes'");
              print("$response");
            },
            child: Container(
              child: Text("Read Data"),
              width: 50,
              height: 20,
              color: Colors.orange,
            )),
            ElevatedButton(
            onPressed: () async {
              List<Map> response =
                  await sqldb.readData("SELECT * FROM 'notes'");
              print("$response");
            },
            child: Container(
              child: Text("Delete Data"),
              width: 50,
              height: 20,
              color: Colors.orange,
            )),
            ElevatedButton(
            onPressed: () async {
              int response =
                  await sqldb.updatetData("UPDATE 'notes' SET 'note' = 'note six' WHERE id = 3  ");
              print("$response");
            },
            child: Container(
              child: Text("update Data"),
              width: 50,
              height: 20,
              color: Colors.orange,
            ))
      ],
    );
  }
}
