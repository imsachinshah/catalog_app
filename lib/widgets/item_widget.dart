

import 'package:catalog_app/models/catalog_model.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
              color: MyTheme.lightTheme(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
