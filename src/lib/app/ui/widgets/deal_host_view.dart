import 'package:androidstudio/app/ui/widgets/countdown_view.dart';
import 'package:androidstudio/app/ui/widgets/horizontal_product_view.dart';
import 'package:flutter/material.dart';
import '../../data/model/product.dart';
import '../theme/configs.dart';

const double height = 270;

class DealHostView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _dealHostView();
}

class _dealHostView extends State<DealHostView> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MConfigs.heightDealHot,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Card(
        child: Column(
          children: [
            dealHostCountdown(),
            dealHostProduct(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(const Duration(seconds: 1), () {
      if(mounted) {
        setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
      }
    });
  }

  Widget dealHostCountdown() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          const Text(
            'Giá Sốc',
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 1),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 30,
              splashRadius: 20,
              icon: const Icon(Icons.local_fire_department_outlined, color: Colors.red),
              onPressed: () {},
            ),
          ),
          const Text(
            'Hôm Nay',
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const CountdownTimer(duration: Duration(days: 2)),
          Expanded(child: Container(alignment: Alignment.centerRight, child: const Text(
            'Xem thêm',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          )),)
        ],
      ),
    );
  }

  Widget dealHostProduct(){
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      child: HorizontalProduct(products: [
        Product(5990000, 13, 'assets/images/image1.jpg'),
        Product(809000, 37, 'assets/images/image2.jpg'),
        Product(114000, 43, 'assets/images/image3.png'),
        Product(225000, 4, 'assets/images/image4.png'),
        Product(428000, 23, 'assets/images/image5.jpg'),
        Product(89000, 50, 'assets/images/image6.jpg'),
        Product(990000, 49, 'assets/images/image7.png'),
        Product(870000, 37, 'assets/images/image8.jpg'),
        Product(140000, 51, 'assets/images/image9.jpg'),
        Product(321000, 47, 'assets/images/image10.png'),
      ]),
    );
  }
}
