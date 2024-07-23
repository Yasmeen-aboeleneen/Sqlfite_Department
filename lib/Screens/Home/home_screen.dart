import 'package:flutter/material.dart';
import 'package:sqflite_department/Screens/Home/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeScreenBody(),
    );
  }
}
