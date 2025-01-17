import 'package:flutter/material.dart';
import 'package:learn_api/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Learn API',
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}
