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
      routes: {
        '/addTask': (context) => const AddTask(),
        '/detail': (context) => const DetailTask(),
        '/edit': (context) => const UpdateTask(),
        '/done': (context) => const HomeScreen(),
        '/delete': (context) => const HomeScreen(),
        '/update': (context) => const HomeScreen(),
      },
      theme: ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xFF302D52),
              ),
              headline2: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF302D52)),
              headline3: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF302D52)),
              headline6: TextStyle(
                  fontSize: 14, letterSpacing: 1, color: Color(0xFF767676)),
              button: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Color(0xFFFDDEA5)))),
      home: const HomeScreen(),
    );
  }
}
