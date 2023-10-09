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
          accountEmail: null,
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
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("uwu"),
            ],
          ),
        ),
      ],
    );
  }
}
