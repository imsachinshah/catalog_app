import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  // HomePage({Key? key}) : super(key: key);

  String name = "imsachinshah";
  int days = 30;
  final dummyItems = List.generate(10, (index) => Catalog.items[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Catalog App",
        textScaleFactor: 1.5,
        softWrap: false,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyItems.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyItems[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
