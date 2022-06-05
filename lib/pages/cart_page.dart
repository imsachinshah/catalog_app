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
          title: const Text("Cart"),
        ),
        body: Column(
          children: [
            const _CartList().p32().expand(),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const _CartTotal()
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "\$99999",
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.blueColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          child: const Text(
            "Buy",
            style: TextStyle(color: Colors.white),
          ),
        ).w32(context),
      ],
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({ Key? key }) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}