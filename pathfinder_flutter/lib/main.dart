import 'package:flutter/material.dart';
import 'package:pathfinder_flutter/core/themeData.dart';
import 'package:pathfinder_flutter/routes/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathfinder',
      theme: pathfinderThemeData(context),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
