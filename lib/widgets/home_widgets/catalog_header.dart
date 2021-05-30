import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Catalogue App",
            style: TextStyle(
              color: MyTheme.darkBluishColor,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
        ),
        Text(
          "Trending products",
          style: TextStyle(
            fontSize: 20
          ),
        )
      ]
    );
  }
}
