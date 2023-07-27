import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Color.fromARGB(255, 44, 46, 67),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 94, 98, 145),
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                Text(
                  "Logged in as Guest",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified),
            title: const Text('Verification for Buyer(Beta)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Verification for Seller'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('My Favourites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.info_circle),
            title: const Text('About Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.question_circle),
            title: const Text('FAQ'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.warning_amber_rounded),
            title: const Text('Report a Problem'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
