import 'dart:core';

class Product {
  late String Name;
  late String Description;
  String? Detail;
  late double Price;
  late double Total;
  late double Rating;
  late int Discount;
  late int Available;
  late String Image;
  late int Selled;
  late String Distributor;

  Product.Items(this.Name, this.Rating, this.Selled, this.Total, this.Discount, this.Image);

  Product(this.Total, this.Discount, this.Image);
  
}
