import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/product_list.dart';

// import 'package:flutter_application_1/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var productsJson = await rootBundle.loadString("assets/files/products.json");
    var decodedData = jsonDecode(productsJson);
    var productsData = decodedData["products"];
    ProductModel.products = List.from(productsData)
      .map<Product>((product) => Product.fromMap(product))
      .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (ProductModel.products != null && ProductModel.products.isNotEmpty)
                  Expanded(child: CatalogList())
                  // CatalogList()
                else
                  Expanded(child: Center(child: CircularProgressIndicator()))
              ]
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        backgroundColor: Theme.of(context).buttonColor,
      ),
    );
  }
}
