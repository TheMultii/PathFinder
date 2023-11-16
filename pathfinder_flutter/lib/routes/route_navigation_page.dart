// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
import 'package:pathfinder_flutter/components/drawer.dart';
import 'package:pathfinder_flutter/components/pathfinder_bottom_sheet_modal.dart';
import 'package:pathfinder_flutter/core/route_deep.dart';
import 'package:pathfinder_flutter/core/visited_routes.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RouteNavigationPage extends StatefulWidget {
  final int routeId;
  final List<PathfinderRoute>? initialRoutesData;

  const RouteNavigationPage({
    Key? key,
    required this.routeId,
    this.initialRoutesData,
  }) : super(key: key);

  @override
  RouteNavigationPageState createState() => RouteNavigationPageState();
}

class RouteNavigationPageState extends State<RouteNavigationPage> {
  final Client client = Client('http://10.10.62.98:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  final Box _hiveBox = Hive.box('routes');
  final Box _visitedPointsBox = Hive.box('visited_routes');
  late VisitedRoutes vR;

  List<PathfinderRoute> routes = [];
  PathfinderRoute? selectedRoute;
  VisitPoint? currentNearestPoint;

  List<LatLng> pathToNearestPoint = [];
  double currentDistanceToNextPoint = -1;

  void endTheNavigation() {
    _visitedPointsBox.delete("route_${selectedRoute!.id}");
    Navigator.of(context).pop();
  }

  bool isCloseToTheNextPoint() {
    return currentDistanceToNextPoint < 50;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable the services',
          ),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location permissions are denied',
            ),
          ),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> drawLine({VisitPoint? point}) async {
    if (point?.long == null || position == null) return;
    var point2 = position!;

    try {
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
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Position? position;
  Timer? gpsTimer;

  VisitPoint? getNearestPoint() {
    if (position == null || selectedRoute == null) return null;
    VisitPoint? nearestPoint;

    double nearestDistance = double.infinity;
    for (var point in selectedRoute!.points) {
      if (point == null) continue;
      if (vR.visitedIDs.contains(point.id)) continue;

      Distance distance = const Distance();
      final double meter = distance(
        LatLng(position!.latitude, position!.longitude),
        LatLng(point.lat, point.long),
      );
      if (meter < nearestDistance) {
        nearestDistance = meter;
        nearestPoint = point;
      }
    }
    setState(() {
      currentDistanceToNextPoint = nearestDistance;
    });

    if (isCloseToTheNextPoint()) {
      if (!vR.visitedIDs.contains(currentNearestPoint?.id)) {
        vR.visitedIDs.add(currentNearestPoint!.id!);
        _visitedPointsBox.put("route_${selectedRoute!.id}", vR);
      }

      if (vR.visitedIDs.length == selectedRoute!.points.length) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("You've completed the route!"),
              content: const Text("Congratulations!"),
              actions: [
                TextButton(
                  child: const Text("Go back"),
                  onPressed: () {
                    endTheNavigation();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return nearestPoint;
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialRoutesData != null) {
      var r = widget.initialRoutesData!
          .where((element) => element.id == widget.routeId);
      if (r.isNotEmpty) {
        selectedRoute = r.first;
      }
    }

    if (selectedRoute == null) return;

    vR = _visitedPointsBox.get(
      "route_${selectedRoute!.id}",
      defaultValue: VisitedRoutes(
        selectedRoute!.name,
        [],
      ),
    );

    getCurrentPosition().then((value) {
      getAllRoutes().then((value) {
        var rr = routes.where((element) => element.id == widget.routeId);
        if (rr.isNotEmpty) {
          selectedRoute = rr.first;
        }
        VisitPoint? nearestPoint = getNearestPoint();

        drawLine(point: nearestPoint);
      });
    });
    gpsTimer = Timer.periodic(const Duration(seconds: 20), (Timer t) {
      getCurrentPosition().then((value) {
        VisitPoint? nearestPoint = getNearestPoint();

        drawLine(point: nearestPoint);
      });
    });
  }

  @override
  void dispose() {
    gpsTimer?.cancel();
    super.dispose();
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position p) {
      setState(() {
        position = p;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAllRoutes() async {
    try {
      final xroutes = await client.pathfinder.getAvailablRoutes();

      setState(() {
        routes = xroutes;
      });
    } catch (e) {
      final data = _hiveBox.get("routes");
      if (data == null) {
        return;
      }
      List<PathfinderRoute> r = RouteDeep.routeDeepFromJson(data);
      setState(() {
        routes = r;
      });
    }

    _hiveBox.put('routes', RouteDeep.routeDeepToJson(routes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedRoute != null ? selectedRoute!.name : 'Pathfinder',
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
                      if (position != null)
                        Marker(
                          point: LatLng(
                            position!.latitude,
                            position!.longitude,
                          ),
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
                                      "https://gitlab.mganczarczyk.pl/uploads/-/system/user/avatar/1/avatar.png",
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
                      if (position != null && selectedRoute != null)
                        ...selectedRoute!.points
                            .map(
                              (visitPoint) => Marker(
                                point: LatLng(
                                  visitPoint!.lat,
                                  visitPoint.long,
                                ),
                                width: 40,
                                height: 40,
                                builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        isScrollControlled: true,
                                        isDismissible: true,
                                        builder: (BuildContext context) {
                                          return PathFinderBottomSheetModal(
                                            visitPoint: visitPoint,
                                          );
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.location_pin,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              ),
                            )
                            .toList(),
                    ],
                  ),
                ],
              ),
            ),
            if (position != null)
              Positioned(
                bottom: 55,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black45,
                  height: 50,
                  child: Center(
                    child: Text(
                      "latitude: ${position?.latitude},\nlongitude: ${position?.longitude}\ndistance: $currentDistanceToNextPoint",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
