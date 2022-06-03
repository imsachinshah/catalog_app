import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // "Catalog App".text.xl5.bold.make(),
        Text(
          "Catalog App",
          textScaleFactor: 3,
          style: Theme.of(context).textTheme.titleMedium,
          
        ),
        "Treanding Products".text.xl2.make()
      ],
    );
  }
}
