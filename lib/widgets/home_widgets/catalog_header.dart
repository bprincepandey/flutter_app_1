import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Catalogue App",
            style: TextStyle(
              color: Theme.of(context).accentColor,
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
