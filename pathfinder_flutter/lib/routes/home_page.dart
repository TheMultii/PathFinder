import 'package:flutter/material.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
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
  List<VisitPointImage> tests = [];

  @override
  void initState() {
    super.initState();

    getAllRoutes();
  }

  void getAllRoutes() async {
    await client.pathfinder.addSampleImage();
    final xuwu = await client.pathfinder.getAvailableImages();
    setState(() {
      tests = xuwu;
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
            ...tests.map(
              (e) => Text(
                e.toString(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
