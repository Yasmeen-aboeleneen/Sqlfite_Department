import 'package:flutter/material.dart';
import 'package:sqflite_department/Database/sqldb.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  Sqldb sqldb = Sqldb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqldb.readData("SELECT * FROM 'notes'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        MaterialButton(
          onPressed: () async {
            await sqldb.deleteMyDatabase();
          },
          child:const Text("Delete Data"),
        ),
        FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Center(
                              child: Text("${snapshot.data![index]['note']}"))),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: readData(),
        )
      ],
    ));
  }
}
