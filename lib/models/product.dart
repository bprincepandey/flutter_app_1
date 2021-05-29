class Product {
  final String title;
  final String type;
  final String description;
  final String filename;
  final double height;
  final double width;
  final double price;
  final num rating;

  Product({this.title, this.type, this.description, this.filename, this.height, this.width, this.price, this.rating});
}

final products = [
  Product(
    title: "Test 1",
    type: "OK",
    description: "Description of this product is awesome.",
    filename: "not_found",
    height: 200,
    width: 200,
    price: 50,
    rating: 5
  )
];