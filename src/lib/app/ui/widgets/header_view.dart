import 'package:androidstudio/app/ui/theme/colors.dart';
import 'package:androidstudio/app/ui/theme/configs.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

late BuildContext _context;

class HeaderView extends StatefulWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _headerView();
}

class _headerView extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Row(
      children: [
        const Text(
          'FREESHIP',
          style: headline1,
        ),
        const Text(
          '+',
          style: TextStyle(
            fontSize: 18,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.62,
          child: Image.asset(
            'assets/images/tiki.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

