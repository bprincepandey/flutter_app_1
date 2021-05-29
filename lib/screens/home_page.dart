import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
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
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (ProductModel.products != null && ProductModel.products.isNotEmpty)
        ? 
        // ListView.builder(
        //   itemCount: ProductModel.products.length,
        //   itemBuilder: (context, index) => ProductWidget(
        //     product: ProductModel.products[index]
        //   )
        // )
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: ProductModel.products.length,
          itemBuilder: (context, index) {
            final product = ProductModel.products[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: GridTile(
                header: Container(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                ),
                child: Image.network(product.image),
                footer: Container(
                  child: Text(
                    product.price.toString(),
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                ),
              ),
            );
          }
        )
        : Center(
          child: CircularProgressIndicator(),
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
