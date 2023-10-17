import 'package:pathfinder_client/pathfinder_client.dart';

class RouteDeep {
  static List<Map<String, dynamic>> routeDeepToJson(
      List<PathfinderRoute> routes) {
    List<Map<String, dynamic>> deepJson = [], deepImages = [], deepPoints = [];

    for (var routes in routes) {
      for (var point in routes.points) {
        if (point?.images != null) {
          for (var image in point!.images) {
            deepImages.add(image!.toJson());
          }
        }
      }
      for (var point in routes.points) {
        deepPoints.add({
          "id": point!.id,
          "name": point.name,
          "description": point.description,
          "images": deepImages,
          "long": point.long,
          "lat": point.lat,
        });
      }

      deepJson.add({
        "id": routes.id,
        "name": routes.name,
        "description": routes.description,
        "points": deepPoints,
      });

      deepImages = [];
      deepPoints = [];
    }

    return deepJson;
  }

  static List<PathfinderRoute> routeDeepFromJson(
    dynamic data,
  ) {
    List<PathfinderRoute> routes = [];
    List<VisitPoint> points = [];
    List<VisitPointImage> images = [];

    for (var route in data) {
      for (var point in route['points']) {
        for (var image in point['images']) {
          images.add(
            VisitPointImage(
              id: image['id'],
              url: image['url'],
              description: image['description'],
            ),
          );
        }

        points.add(
          VisitPoint(
            id: point['id'],
            name: point['name'],
            description: point['description'],
            images: images,
            long: point['long'],
            lat: point['lat'],
          ),
        );
      }

      routes.add(
        PathfinderRoute(
          id: route['id'],
          name: route['name'],
          description: route['description'],
          points: points,
        ),
      );
      images = [];
      points = [];
    }

    return routes;
  }
}
