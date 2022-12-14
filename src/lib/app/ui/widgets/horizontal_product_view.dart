import 'package:androidstudio/app/ui/widgets/percent_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/model/product.dart';
import '../theme/colors.dart';
import '../theme/configs.dart';

final oCcy = NumberFormat("#,##0 ₫", "en_US");

class HorizontalProduct extends StatefulWidget {
  final List<Product> products;

  const HorizontalProduct({Key? key, required this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _horizontalProduct();
}

class _horizontalProduct extends State<HorizontalProduct> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: SizedBox(
            height: MConfigs.heightDealHot - 80,
            child: ListView.builder(
              itemCount: widget.products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = widget.products[index];
                return Card(
                  margin: const EdgeInsets.all(2),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(color: Colors.white),
                      cardItem(item),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
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
          product.image,
          height: 120,
          width: 170,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(height: 2),
            Text(
              oCcy.format(int.parse(product.total.toString())),
              style: const TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            boxDiscount(product.discount),
          ],
        ),
        const SizedBox(height: 10),
        const PercentIndicator(
            width: 180, color: Colors.red, value: 50, max: 100),
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

Widget recentSell(String text, Function() callback) {
  return SizedBox(
    height: 45,
    child: OutlinedButton(
      onPressed: () => callback(),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: MColors.app,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(width: 2, color: Colors.white),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text = text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
