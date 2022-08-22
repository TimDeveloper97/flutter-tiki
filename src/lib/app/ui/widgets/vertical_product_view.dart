import 'package:androidstudio/views/controls/percent_indicator_view.dart';
import 'package:androidstudio/views/controls/star_rating_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/product.dart';
import '../../shares/colors.dart';
import '../../shares/configs.dart';

final oCcy = NumberFormat("#,##0 ₫", "en_US");

class VerticalProduct extends StatefulWidget {
  final List<Product> products;

  const VerticalProduct({Key? key, required this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _verticalProduct();
}

class _verticalProduct extends State<VerticalProduct> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: GridView.builder(
        itemCount: widget.products.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(2),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(color: Colors.white),
                cardItem(widget.products[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget cardItem(Product product) {
  return Container(
    width: 140,
    padding: const EdgeInsets.all(2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          product.Image,
          height: 120,
          width: 170,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.Name,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const SizedBox(height: 2),
            StarRating(rating: product.Rating, onRatingChanged: (rating) => {}, color: Colors.amber, size: 13),
            Padding(padding: const EdgeInsets.only(top: 2), child: Text(
              ' | Đã bán ' + product.Selled.toString(),
              maxLines: 2,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 9,
                fontWeight: FontWeight.normal,
              ),
            ),)
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const SizedBox(height: 2),
            Text(
              oCcy.format(int.parse(product.Total.toString())),
              style: const TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            boxDiscount(product.Discount),
          ],
        ),
      ],
    ),
  );
}

Widget boxDiscount(int discount) {
  return Container(
    padding: const EdgeInsets.all(2),
    margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.redAccent.withOpacity(0.3),
      border: Border.all(color: Colors.red, width: 1),
    ),
    child: Text(
      '-' + discount.toString() + '%',
      style: const TextStyle(
        color: Colors.red,
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
