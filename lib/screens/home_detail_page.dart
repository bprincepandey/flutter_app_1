import "package:flutter/material.dart";
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Product product;

  const HomeDetailPage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: EdgeInsets.all(16),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.red[900]
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Buy"
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        // bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Hero(
                tag: Key(product.id.toString()),
                child: Image.network(
                  product.image,
                  height: MediaQuery.of(context).size.height * 0.3, // takes height of App
                  // width: MediaQuery.of(context).size.width, // takes height of App
                )
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: MyTheme.creamColor,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
            product.name,
            style: TextStyle(
              color: MyTheme.darkBluishColor,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
          Text(
            product.desc,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16
            )
          ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}