import 'package:flutter/material.dart';
import 'package:simple_game/features/game/presentation/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/game/presentation/bloc/xoxo_bloc.dart';

void main() {
  runApp(
    BlocProvider<XoxoBloc>(
      create: (context) => XoxoBloc(),
      child: const MyApp(),
    ),
  );
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
      debugShowCheckedModeBanner: false,
      home: const XoxoHome(),
    );
  }
}
