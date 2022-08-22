import 'package:flutter/material.dart';

class PercentIndicator extends StatefulWidget {
  final Color color;
  final double value;
  final double max;
  final double width;

  const PercentIndicator({Key? key, required this.width, required this.color, required this.value, required this.max}) : super(key: key);

  @override
  _PercentIndicator createState() => _PercentIndicator();
}

class _PercentIndicator extends State<PercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: 20,
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: widget.color.withOpacity(0.3),
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       padding: EdgeInsets.zero,
          //       iconSize: 30,
          //       splashRadius: 20,
          //       icon: const Icon(Icons.local_fire_department, color: Colors.orange),
          //       onPressed: () {},
          //     ),
          //     Text(
          //       widget.max.toString(),
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 14,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
        ),
        Container(
          width: widget.width * (widget.value / widget.max),
          height: 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: widget.color,
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const  EdgeInsets.only(bottom: 5),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 20,
                  icon: const Icon(Icons.local_fire_department, color: Colors.orange),
                  onPressed: () {},
                ),
              ),
              if (widget.value == 0)
                const Text(
                  'Vừa mở bán',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (widget.value != 0)
                Text(
                  'Đã bán ' + widget.value.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
