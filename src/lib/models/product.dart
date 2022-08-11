import 'dart:core';

class Product {
  late String Name;
  late String Description;
  String? Detail;
  late double Price;
  late double Total;
  late int Discount;
  late int Available;
  late String Image;
  late int Selled;
  late String Distributor;

  Product(this.Total, this.Discount, this.Image);
}
