// ignore_for_file: use_build_context_synchronously

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
  final Client client = Client('http://10.10.62.98:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  final Box _hiveBox = Hive.box<dynamic>("routes");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFetching = false, hasNoRoutesAvailable = false;

  Future<void> getAllRoutes() async {
    setState(() => isFetching = true);
    try {
      final List<PathfinderRoute> routes =
          await client.pathfinder.getAvailablRoutes();

      _hiveBox.put('routes', RouteDeep.routeDeepToJson(routes));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );

      final data = _hiveBox.get("routes");
      if (data == null) {
        setState(() {
          isFetching = false;
          hasNoRoutesAvailable = true;
        });
        return;
      }
      List<PathfinderRoute> routes = RouteDeep.routeDeepFromJson(data);
      if (routes.isEmpty) {
        setState(() {
          isFetching = false;
          hasNoRoutesAvailable = true;
        });
        return;
      }
    }
    setState(() {
      isFetching = false;
      hasNoRoutesAvailable = false;
    });
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
          child: isFetching
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Available routes are loading..."),
                    SizedBox(height: 10),
                    CircularProgressIndicator(),
                  ],
                )
              : !hasNoRoutesAvailable
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Available routes loaded successfully."),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              scaffoldKey.currentState!.openDrawer(),
                          child: const Text("Show routes"),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("No routes available."),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => getAllRoutes(),
                          child: const Text("Reload routes"),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
