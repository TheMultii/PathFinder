import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pathfinder_flutter/core/themeData.dart';
import 'package:pathfinder_flutter/core/visited_routes.dart';
import 'package:pathfinder_flutter/routes/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VisitedRoutesAdapter());
  await Hive.openBox('routes');
  await Hive.openBox('visited_routes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PathFinder',
      theme: pathfinderThemeData(context),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
