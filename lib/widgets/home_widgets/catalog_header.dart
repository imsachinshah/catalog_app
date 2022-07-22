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
        Row(
          children: [
            Text(
              "Developer's Store",
              textScaleFactor: 2.5,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "!",
              textScaleFactor: 3,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.red),
            ),
          ],
        ),
        "Add New Tools to Your Setup...".text.xl2.make()
      ],
    );
  }
}
