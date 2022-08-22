import 'dart:core';

class Product {
  late String name;
  late String description;
  String? detail;
  late double price;
  late double total;
  late double rating;
  late int discount;
  late int available;
  late String image;
  late int selled;
  late String distributor;

  Product.init(this.name, this.rating, this.selled, this.total, this.discount,
      this.image);

  Product(this.total, this.discount, this.image);
}
