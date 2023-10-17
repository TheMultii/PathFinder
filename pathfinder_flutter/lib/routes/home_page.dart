import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
import 'package:pathfinder_flutter/components/drawer.dart';
import 'package:pathfinder_flutter/core/route_deep.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Client client = Client('http://192.168.1.34:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  final Box _hiveBox = Hive.box<dynamic>("routes");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFetching = false;

  Future<void> getAllRoutes() async {
    setState(() => isFetching = true);
    final List<PathfinderRoute> routes =
        await client.pathfinder.getAvailablRoutes();

    _hiveBox.put('routes', RouteDeep.routeDeepToJson(routes));
    setState(() => isFetching = false);
  }

  @override
  void initState() {
    super.initState();

    getAllRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "PathFinder",
          textAlign: TextAlign.center,
        ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              duration: 2000.ms,
              color: Theme.of(context).colorScheme.primary,
            ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: isFetching
                ? [
                    const Text("Available routes are loading..."),
                    const CircularProgressIndicator(),
                  ]
                : [
                    const Text("Available routes loaded successfully."),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => scaffoldKey.currentState!.openDrawer(),
                      child: const Text("Show routes"),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
