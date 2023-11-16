import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pathfinder_client/pathfinder_client.dart';
import 'package:pathfinder_flutter/core/route_deep.dart';
import 'package:pathfinder_flutter/routes/home_page.dart';
import 'package:pathfinder_flutter/routes/route_navigation_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: Column(
        children: [
          DrawerHeader(),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatefulWidget {
  const DrawerHeader({super.key});

  @override
  State<DrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<DrawerHeader> {
  final Box _hiveBox = Hive.box<dynamic>("routes");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(
            "PathFinder",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: const Opacity(
            opacity: .5,
            child: Text(
              "Marcel Gańczarczyk",
            ),
          ),
          otherAccountsPictures: [
            ClipOval(
              child: Image.network(
                "https://gitlab.mganczarczyk.pl/uploads/-/system/user/avatar/1/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: .5,
              image: NetworkImage(
                "https://images.pexels.com/photos/2310713/pexels-photo-2310713.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
            child: const ListTile(
              title: Text(
                "Home Screen",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: Icon(
                Icons.home,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(left: 16, right: 16),
          child: const Text(
            "> Available routes:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: ValueListenableBuilder(
            valueListenable: Hive.box<dynamic>("routes").listenable(),
            builder: (BuildContext context, box, Widget? child) {
              final data = _hiveBox.get("routes");

              if (data == null) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              List<PathfinderRoute> routes = RouteDeep.routeDeepFromJson(data);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...routes
                      .map(
                        (PathfinderRoute route) => InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              route.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              route.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11,
                              ),
                            ),
                            leading: const Icon(
                              Icons.location_pin,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  if (routes.isEmpty) const Text("No routes available."),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
