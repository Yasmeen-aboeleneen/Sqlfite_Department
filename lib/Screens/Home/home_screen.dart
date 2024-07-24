import 'package:flutter/material.dart';
import 'package:sqflite_department/Core/Constants/colors.dart';
import 'package:sqflite_department/Screens/Home/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kveryWhite,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimary,
        title: const Text("Notes",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: kveryWhite)),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: HomeScreenBody(),
      ),
    );
  }
}
