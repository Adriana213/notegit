import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'student.dart';
import 'teacher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/student': (context) => student(),
        '/teacher': (context) => teacher(),
      },
    );
  }
}
git int