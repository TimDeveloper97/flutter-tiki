import 'dart:ui';
import 'package:androidstudio/app/data/model/category.dart';
import 'package:flutter/material.dart';
import '../theme/configs.dart';

class HorizontalCategory extends StatefulWidget {
  final List<Category> category;

  const HorizontalCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _horizontalCategory();
}

class _horizontalCategory extends State<HorizontalCategory> {
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
            height: 130,
            child: ListView.builder(
              itemCount: widget.category.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = widget.category[index];
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

Widget cardItem(Category category) {
  return Container(
    width: 100,
    height: 110,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            category.image,
            height: 40,
            width: 40,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.3),

          ),
        ),
        const SizedBox(height: 5),
        Flexible(
            child: Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ))
      ],
    ),
  );
}
