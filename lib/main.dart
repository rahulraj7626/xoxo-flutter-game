import 'package:flutter/material.dart';
import 'package:simple_game/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoXo Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const XoxoHome(),
    );
  }
}
