import 'dart:convert';

import 'package:catalog_app/core/my_store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

import 'package:catalog_app/models/catalog_model.dart';
import 'package:catalog_app/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HomePage({Key? key}) : super(key: key);
  String name = "imsachinshah";

  int days = 30;

  // final url =
  //     "https://my-json-server.typicode.com/imsachinshah/foody_json/products";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));

    // final response = await http.get(Uri.parse(url));
    // print('Response status: ${response.statusCode}');

    // final catalogJson = response.body;

    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');

    final decodeData = jsonDecode(catalogJson);

    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, _, status) {
            return FloatingActionButton(
              onPressed: () => context.vxNav.push(Uri.parse(MyRoutes.cartRoute)),
              backgroundColor: MyTheme.blueColor,
              child: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ).badge(
              color: Colors.grey[500],
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            );
          }),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              10.heightBox,
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                const CatalogList().py12().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
