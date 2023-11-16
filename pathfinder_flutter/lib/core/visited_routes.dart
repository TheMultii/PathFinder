import 'package:hive_flutter/hive_flutter.dart';

part 'visited_routes.g.dart';

@HiveType(typeId: 0)
class VisitedRoutes extends HiveObject {
  @HiveField(0)
  String routeName;
  @HiveField(1)
  List<int> visitedIDs = [];

  VisitedRoutes(
    this.routeName,
    this.visitedIDs,
  );
}
