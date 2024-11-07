class Product {
  List<String>? images;
  String? name;
  String? brand;
  String? price;
  String? description;
  String? color;

  Product(
      {this.images,
      this.name,
      this.brand,
      this.price,
      this.description,
      this.color});

  Product.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    name = json['name'];
    brand = json['brand'];
    price = json['price'];
    description = json['description'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    data['name'] = name;
    data['brand'] = brand;
    data['price'] = price;
    data['description'] = description;
    data['color'] = color;
    return data;
  }
}
