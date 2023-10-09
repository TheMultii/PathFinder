import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_client/pathfinder_client.dart';

class RouteCard extends StatelessWidget {
  final PathfinderRoute route;

  const RouteCard({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://api.mganczarczyk.pl/cyberpunk-background",
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(route.name),
                        Text(
                          route.description,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Number of points: ${route.points.length}',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FeatherIcons.chevronRight),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey[900],
        ),
      ],
    );
  }
}
