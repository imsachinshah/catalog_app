import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HomePage({Key? key}) : super(key: key);
  String name = "imsachinshah";

  int days = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    Catalog.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

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
        child: (Catalog.items != null )
            ? ListView.builder(
                itemCount: Catalog.items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: Catalog.items![index],
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
