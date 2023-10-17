import 'package:pathfinder_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PathfinderEndpoint extends Endpoint {
  Future<List<PathfinderRoute>> getAvailablRoutes(Session session) async {
    return await PathfinderRoute.find(session);
  }
}
