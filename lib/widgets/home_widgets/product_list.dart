import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/home_detail_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.products.length,
      itemBuilder: (context, index) {
        final product = ProductModel.products[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(product: product)
            )
          ),
          child: ProductItem(product: product)
        );
      },
      
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : assert(product != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: 100,
      height: 150,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle,
        color: Colors.white
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(image: product.image)
          ),
          ProductDetails(name: product.name, desc: product.desc, price: product.price),
        ]
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyTheme.creamColor,
      ),
      child: Image.network(image, width: 100, height: 200),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final name, desc, price;

  const ProductDetails({Key key, this.name, this.desc, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: MyTheme.darkBluishColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey[500]
            )
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Buy"
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),
              )
            ],
          )
        ],
      )
    );
  }
}