import 'dart:math';

import 'package:bmi_app/Screen/homeScreen.dart';
import 'package:bmi_app/Screen/resultScrean.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          displayLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)

        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/homeScreen',
      routes: {
        '/homeScreen': (context) => const HomeScreen(),

      },
    );
  }
}
