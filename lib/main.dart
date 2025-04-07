import 'package:flutter/material.dart';
import 'package:learning_module_app/screens/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Learning App',
      theme: ThemeData(
        // primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
        // scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

