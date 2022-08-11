import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  final List<String> images;

  const BannerView({Key? key, required this.images}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _bannerView();
}

class _bannerView extends State<BannerView> {
  late PageController _pageController;
  int activePage = 1;

  List<Widget> Indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return GestureDetector(
        onTap: () {
          // print('${index}');
          setState(() {
            activePage = index;
            _pageController.animateToPage(activePage, duration: const Duration(milliseconds: 2000), curve: Curves.easeInOutCubic);
          });
        },
        child: Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: currentIndex == index ? Colors.black : Colors.black26, shape: BoxShape.circle),
        ),
      );
    });
  }

  @override
  void initState() {
    // print('${widget.images.length}');
    _pageController = PageController(viewportFraction: 0.8, initialPage: activePage);
  }

  @override
  Widget build(BuildContext context) {
    // print('${widget.images.length}');
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: widget.images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(widget.images, pagePosition, active);
              }),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: Indicators(widget.images.length, activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 5 : 15;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}
