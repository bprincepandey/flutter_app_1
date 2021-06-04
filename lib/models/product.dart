class ProductModel {
  static List<Product> products;

  // Get Product by ID
  static Product getById(int id) => products.firstWhere((element) => element.id == id, orElse: null);

  // Get Product by position
  static Product getByPosition(int pos) => products[pos];

}

class Product {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Product({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"]
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image
  };

}