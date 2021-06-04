import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Product product;

  const HomeDetailPage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Theme.of(context).canvasColor,
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
                  color: Theme.of(context).cardColor,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
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
                      SizedBox(height: 15,),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
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
                "Add to cart"
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}