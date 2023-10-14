import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

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
                "https://api.mganczarczyk.pl/tairiku/random/wallpaper?safety=true",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(right: 0),
                child: const Text(
                  "> Dostępne trasy:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              ...[1, 2, 3, 4]
                  .map(
                    (e) => InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "Trasa $e",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "Opis trasy $e",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: const Icon(
                          Icons.location_pin,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
