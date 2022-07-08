import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog_model.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  // Function to add ids in detail Url
  
  Future<void> _onTap(BuildContext context, index) {
    final catalog = CatalogModel.items![index];
    return context.vxNav.push(
      Uri(path: MyRoutes.homeDetailsRoute, queryParameters: {
        "id": catalog.id.toString(),
      }),
      params: catalog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                onTap: () => _onTap(context, index),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                  onTap: () => _onTap(context, index),
                  child: CatalogItem(catalog: catalog));
            });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg
                .color(Theme.of(context).primaryColor)
                .bold
                .make(),
            catalog.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl2.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 10),
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    )
        .color(Theme.of(context).cardColor)
        .roundedLg
        .square(130)
        .make()
        .pLTRB(6, 9, 6, 9);
  }
}
