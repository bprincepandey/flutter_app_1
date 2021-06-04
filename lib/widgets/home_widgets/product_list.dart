import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/home_detail_page.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.products.length,
      itemBuilder: (context, index) {
        final product = ProductModel.getByPosition(index);
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
      width: 0,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle,
        color: Theme.of(context).cardColor
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
        color: Theme.of(context).canvasColor,
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
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).accentColor,
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
              buttonPadding: EdgeInsets.zero,
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
                    "Add to cart"
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}