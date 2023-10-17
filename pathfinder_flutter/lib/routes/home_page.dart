import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
import 'package:pathfinder_flutter/components/drawer.dart';
import 'package:pathfinder_flutter/components/pathfinder_bottom_sheet_modal.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Client client = Client('http://192.168.1.34:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  List<PathfinderRoute> routes = [];
  List<LatLng> pathToNearestPoint = [];
  double currentDistanceToNextPoint = -1;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> drawLine({VisitPoint? point}) async {
    if (point?.long == null) return;
    var point2 = LatLng(49.7835438, 19.0589105);

    Uri url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${point!.long},${point.lat};${point2.longitude},${point2.latitude}?steps=true&annotations=true&geometries=geojson&overview=full');
    http.Response response = await http.get(url);

    var router =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
    List<LatLng> routepoints = [];
    for (int i = 0; i < router.length; i++) {
      var split = router[i]
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .split(",");
      routepoints.add(
        LatLng(
          double.parse(split[1]),
          double.parse(split[0]),
        ),
      );
    }
    setState(() {
      pathToNearestPoint = routepoints;
    });
  }

  Position? position;
  Timer? gpsTimer;

  @override
  void initState() {
    super.initState();

    getAllRoutes();
    getCurrentPosition();
    gpsTimer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      getCurrentPosition();
    });
    getFakeRoute().then((value) => drawLine(point: routes[0].points[0]));
  }

  @override
  void dispose() {
    gpsTimer?.cancel();
    super.dispose();
  }

  Future<void> getFakeRoute() async {
    final Random random = Random();

    final points = <VisitPoint>[];
    for (int i = 0; i < 3; i++) {
      points.add(VisitPoint(
        name: 'Point $i',
        description: 'Description $i',
        lat: 49.7835438 +
            random.nextDouble() * 0.025 * (random.nextBool() ? 1 : -1),
        long: 19.0589105 +
            random.nextDouble() * 0.025 * (random.nextBool() ? 1 : -1),
        images: [],
      ));
    }

    final route = PathfinderRoute(
        name: 'Night City Tour',
        description: 'Tour around the Night City',
        points: points);

    setState(() {
      routes = [route];
    });
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position p) {
      const Distance distance = Distance();
      final double meter = distance(
        LatLng(p.latitude, p.longitude),
        LatLng(49.7835438, 19.0589105),
      );

      setState(() {
        position = p;
        currentDistanceToNextPoint = meter;
      });
    }).catchError((e) {
      debugPrint(e);
    });
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
          routes.isNotEmpty ? routes[0].name : 'Pathfinder',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FlutterMap(
                options: MapOptions(
                  minZoom: 10.0,
                  maxZoom: 18.0,
                  center: LatLng(49.7835438, 19.0589105),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'pathfinder',
                  ),
                  PolylineLayer(
                    polylineCulling: false,
                    polylines: [
                      Polyline(
                        points: pathToNearestPoint,
                        gradientColors: const [
                          Color.fromARGB(255, 255, 0, 0),
                          Color.fromARGB(255, 255, 127, 0),
                          Color.fromARGB(255, 255, 255, 0),
                          Color.fromARGB(255, 0, 255, 0),
                          Color.fromARGB(255, 0, 0, 255),
                          Color.fromARGB(255, 75, 0, 130),
                          Color.fromARGB(255, 143, 0, 255),
                        ],
                        strokeWidth: 6,
                      )
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(49.7835438, 19.0589105),
                        width: 40,
                        height: 40,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 40,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Positioned(
                                top: 3,
                                left: 7,
                                child: ClipOval(
                                  child: Image.network(
                                    "https://api.mganczarczyk.pl/tairiku/ai/streetmoe?safety=true",
                                    fit: BoxFit.cover,
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      if (position != null && routes.isNotEmpty)
                        ...routes[0]
                            .points
                            .map((visitPoint) => Marker(
                                  point: LatLng(
                                    visitPoint!.lat,
                                    visitPoint.long,
                                  ),
                                  width: 40,
                                  height: 40,
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        debugPrint(e.name);
                                      },
                                      child: const Icon(
                                        Icons.location_pin,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                    );
                                  },
                                ))
                            .toList(),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 32,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black45,
                height: 50,
                child: Center(
                  child: Text(
                    "latitude: ${position?.latitude},\nlongitude: ${position?.longitude}\nvDistance: $currentDistanceToNextPoint",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
