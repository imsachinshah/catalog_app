import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String name = "imsachinshah";
  int days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catalog App")),
      body: Center(
        child: Container(
          child: Text(
            "Welcome to $days days of Flutter by $name",
            textScaleFactor: 1.2,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
