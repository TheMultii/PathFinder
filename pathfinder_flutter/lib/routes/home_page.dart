import 'package:flutter/material.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
import 'package:pathfinder_flutter/components/route_card.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Client client = Client('http://192.168.1.34:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  List<PathfinderRoute> routes = [];

  @override
  void initState() {
    super.initState();

    getAllRoutes();
  }

  void getAllRoutes() async {
    await client.pathfinder.addSampleRoute();
    final xroutes = await client.pathfinder.getAvailablRoutes();
    setState(() {
      routes = xroutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...routes.map(
              (route) => RouteCard(
                route: route,
              ),
            )
          ],
        ),
      ),
    );
  }
}
