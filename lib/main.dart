import 'package:flutter/material.dart';
import 'package:sqflite_department/Screens/Home/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(),
      home:const HomeScreen(),
    );
  }
}
