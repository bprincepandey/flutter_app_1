import "package:flutter/material.dart";
import 'package:flutter_application_1/models/product.dart';

class ProductWidget extends StatelessWidget {

  final Product product;

  const ProductWidget({Key key, @required this.product})
  : assert(product != null),
  super (key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          print("${product.name} pressed");
        },
        leading: Image.network(product.image),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          "\$${product.price}",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}