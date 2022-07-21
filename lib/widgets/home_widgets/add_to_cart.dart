import 'package:catalog_app/core/my_store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog_model.dart';
import 'package:catalog_app/widgets/themes.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.blueColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart
            ? const Icon(
                Icons.done,
                color: Colors.white,
              )
            : "Add to Cart".text.white.make());
  }
}
