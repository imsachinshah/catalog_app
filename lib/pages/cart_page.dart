import 'package:catalog_app/core/my_store.dart';
import 'package:catalog_app/models/cart_model.dart';

import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Cart",
            textScaleFactor: 1.4,
          ),
        ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            _CartTotal()
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, _, status) {
              return Text(
                "\$${_cart.totalPrice}",
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                ),
              );
            }),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Buying not Supported yet!"),
              ),
            );
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.blueColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          child: const Text(
            "Buy",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white),
          ),
        ).w32(context).h(50),
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? const Center(
            child: Text(
              "Nothing To Show",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
