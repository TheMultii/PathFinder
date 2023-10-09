import 'package:pathfinder_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PathfinderEndpoint extends Endpoint {
  Future<List<VisitPointImage>> getAvailableImages(Session session) async {
    return await VisitPointImage.find(session);
  }

  Future<void> addSampleImage(Session session) async {
    var r = await VisitPointImage.findSingleRow(
      session,
      where: (p0) =>
          p0.url.equals('https://api.mganczarczyk.pl/cyberpunk-background'),
    );

    if (r != null) {
      return;
    }

    final image = VisitPointImage(
      url: 'https://api.mganczarczyk.pl/cyberpunk-background',
      description: 'Cyberpunk 2077 is awesome',
    );
    await VisitPointImage.insert(session, image);
  }
}
