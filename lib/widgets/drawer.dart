import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String profileUrl =
      "https://cdn.vox-cdn.com/thumbor/yzPdGsXFWCHbNMlDWHhPROUzVeI=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/8378039/baby-groot-guardians.0.jpg";

  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.deepPurple,
        child: ListView(padding: const EdgeInsets.all(0), children: [
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.all(0),
            accountName: const Text(
              "Sachin Shah",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: const Text("imsachinshah0@gmail.com",
                style: TextStyle(color: Colors.white)),
            currentAccountPicture:
                CircleAvatar(backgroundImage: NetworkImage(profileUrl)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
              // print("I am tapped");
            },
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            textColor: Colors.white,
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            textColor: Colors.white,
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            textColor: Colors.white,
            title: Text(
              "Mail me",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            textColor: Colors.white,
            title: Text(
              "Setting",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          )
        ]));
  }
}
