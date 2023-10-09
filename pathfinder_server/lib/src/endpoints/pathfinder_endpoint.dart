import 'package:pathfinder_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PathfinderEndpoint extends Endpoint {
  Future<List<PathfinderRoute>> getAvailablRoutes(Session session) async {
    return await PathfinderRoute.find(session);
  }

  Future<void> addSampleRoute(Session session) async {
    var v = await PathfinderRoute.findSingleRow(
      session,
      where: (p0) => p0.id.equals(10),
    );
    if (v != null) {
      return;
    }

    var vpi = VisitPointImage(
      id: 1,
      url: 'https://api.mganczarczyk.pl/cyberpunk-background',
      description: 'Cyberpunk 2077 is awesome',
    );

    VisitPoint vp = VisitPoint(
      id: 1,
      name: 'Night City',
      description: 'The city of dreams',
      lat: 48.25,
      long: 52.11,
      images: [vpi],
    );

    var pr = PathfinderRoute(
      name: 'Night City Tour',
      description: 'A tour around Night City',
      points: [vp],
    );

    await PathfinderRoute.insert(session, pr);
  }
}
