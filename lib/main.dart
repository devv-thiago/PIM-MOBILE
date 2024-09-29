import 'package:flutter/material.dart';
import 'package:urban_green/view/homepage.dart';
import 'package:urban_green/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}