class ProductList {
  String? id;
  String? name;
  String? moq;
  String? price;
  String? discountedPrice;

  ProductList({this.id, this.name, this.moq, this.price, this.discountedPrice});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    moq = json["moq"];
    price = json["price"];
    discountedPrice = json["discounted_price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["moq"] = moq;
    data["price"] = price;
    data["discounted_price"] = discountedPrice;
    return data;
  }
}