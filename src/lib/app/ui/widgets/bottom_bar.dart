import 'package:androidstudio/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function onClicked;
  final int index;
  BottomNavBar( {Key? key, required this.index, required this.onClicked}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  setBottomBarIndex(index) {
    setState(() {
      widget.onClicked(index);
      print('${index}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double height = 60;
    return SizedBox(
      width: size.width,
      height: height,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: MColors.app, child: const Icon(Icons.local_fire_department_outlined, color: Colors.white), elevation: 0.1, onPressed: () {}),
          ),
          SizedBox(
            width: size.width,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_filled,
                    color: widget.index == 0 ? Colors.blue : Colors.grey.shade400,
                    size: 30,
                  ),
                  onPressed: () {
                    setBottomBarIndex(0);
                  },
                  padding: const EdgeInsets.only(bottom: 5),
                  splashRadius: 20,
                  splashColor: Colors.white,
                ),
                IconButton(
                    icon: Icon(
                      Icons.newspaper_outlined,
                      color: widget.index == 1 ? Colors.blue : Colors.grey.shade400,
                      size: 30,
                    ),
                    padding: const EdgeInsets.only(bottom: 5),
                    splashRadius: 20,
                    onPressed: () {
                      setBottomBarIndex(1);
                    }),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: widget.index == 2 ? Colors.blue : Colors.grey.shade400,
                      size: 30,
                    ),
                    padding: const EdgeInsets.only(bottom: 5),
                    splashRadius: 20,
                    onPressed: () {
                      setBottomBarIndex(2);
                    }),
                IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: widget.index == 3 ? Colors.blue : Colors.grey.shade400,
                      size: 30,
                    ),
                    padding: const EdgeInsets.only(bottom: 5),
                    splashRadius: 20,
                    onPressed: () {
                      setBottomBarIndex(3);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = MColors.appBackground
      ..style = PaintingStyle.fill;

    double cover = 20;

    Path path = Path();
    path.moveTo(0, cover); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.42, 0, size.width * 0.43, cover);
    path.arcToPoint(Offset(size.width * 0.57, cover), radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.57, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, cover);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
