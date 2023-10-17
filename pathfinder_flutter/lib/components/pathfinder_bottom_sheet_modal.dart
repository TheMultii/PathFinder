import 'package:flutter/material.dart';
import 'package:pathfinder_client/pathfinder_client.dart';

class PathFinderBottomSheetModal extends StatelessWidget {
  final VisitPoint visitPoint;

  const PathFinderBottomSheetModal({
    super.key,
    required this.visitPoint,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.75,
      maxChildSize: 0.75,
      minChildSize: 0.75,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Theme.of(context).colorScheme.background,
            ),
            height: MediaQuery.of(context).size.height * .75,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 30,
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    visitPoint.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      child: Image.network(
                        "https://api.mganczarczyk.pl/tairiku/random/streetmoe?seed=${visitPoint.name}",
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${visitPoint.lat.toStringAsFixed(3)} / ${visitPoint.long.toStringAsFixed(3)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
