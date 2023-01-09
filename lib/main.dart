import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/detail_task.dart';
import 'package:todo_app/view/home_screen.dart';
import 'package:todo_app/view/update_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.inder().fontFamily,
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xFF302D52),
              ),
              button: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Color(0xFFFDDEA5)))),
      home: const AddTask(),
    );
  }
}
