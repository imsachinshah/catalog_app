import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(150, 50)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                ),
              ).h40(context),
              Expanded(
                flex: 0,
                child: VxArc(
                  height: 30,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: Theme.of(context).cardColor,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(Theme.of(context).primaryColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle!)
                            .make(),
                        10.heightBox,
                        Expanded(
                          flex: 0,
                          child:
                              "Magna dolores ipsum et eirmod est et, at eirmod dolor sit ut sanctus ut ea et sanctus. Et diam voluptua accusam ea eos, lorem sadipscing diam est ipsum accusam. Amet erat nonumy diam accusam dolor. Tempor elitr diam amet magna dolore aliquyam amet. No et takimata diam et. Dolore ut."
                                  .text
                                  .justify
                                  .make()
                                  .p24(),
                        ),
                      ],
                    ).py32(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
