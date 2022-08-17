import 'package:androidstudio/models/Category.dart';
import 'package:androidstudio/shares/colors.dart';
import 'package:androidstudio/shares/configs.dart';
import 'package:androidstudio/views/controls/deal_host_view.dart';
import 'package:androidstudio/views/controls/header_view.dart';
import 'package:androidstudio/views/controls/horizontal_category_view.dart';
import 'package:androidstudio/views/controls/vertical_product_view.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../controls/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePageState();
}

class _homePageState extends State<HomePage> with TickerProviderStateMixin {
  static const int offset = 28;
  static const int sizeAction = 100;

  late double width, sWidth;
  late bool isHideAction = true;
  late ScrollController _controller;
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    animation.forward(from: 1);

    super.initState();
  }

  _scrollListener() {
    print('offset: ${_controller.offset}');
    var point = _controller.position.minScrollExtent + offset;

    if (_controller.offset >= point) {
      animation.value = 1;
    }

    if (_controller.offset > 0 && _controller.offset < offset) {
      animation.value = 1.0 * (point - _controller.offset) / point;
      width = sWidth - animation.value * sizeAction;
      print('${width}');
    } else if (_controller.offset > offset && _controller.offset < offset * 2) {
      animation.value = 1.0 * (_controller.offset - point) / point;
    }

    if (_controller.offset > point && !_controller.position.outOfRange) {
      setState(() {
        isHideAction = false;
      });
    }
    if (_controller.offset < point && !_controller.position.outOfRange) {
      setState(() {
        isHideAction = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    sWidth = width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MColors.appBackground,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            backgroundColor: MColors.app,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: header(),
            actions: <Widget>[if (isHideAction) ...actions(_fadeInFadeOut)],
            bottom: AppBar(
              backgroundColor: MColors.app,
              title: Container(
                width: width,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: MConfigs.homeSearch,
                        prefixIcon: Icon(Icons.search),
                      )),
                ),
              ),
              actions: <Widget>[if (!isHideAction) ...actions(_fadeInFadeOut)],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              banner(),
              dealHost(),
              category(),
              suggest(),
              items(),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Container(
    padding: MConfigs.paddingHeader,
    color: MColors.app,
    height: MConfigs.heightHeader,
    child: const HeaderView(),
  );
}

List<Widget> actions(Animation<double> _fadeInFadeOut) {
  return [
    FadeTransition(
      opacity: _fadeInFadeOut,
      child: IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.shopping_cart_outlined),
        onPressed: () {},
      ),
    ),
    FadeTransition(
      opacity: _fadeInFadeOut,
      child: IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.notifications_none),
        onPressed: () {},
      ),
    ),
  ];
}

Widget banner() => Container(
      child: const BannerView(
        images: [
          "assets/images/banner1.png",
          "assets/images/banner2.jpg",
          "assets/images/banner3.png",
          "assets/images/banner4.jpg",
          "assets/images/banner5.png",
          "assets/images/banner6.jpg",
          "assets/images/banner7.jpg",
          "assets/images/banner8.jpg",
          "assets/images/banner9.jpeg",
          "assets/images/banner10.png",
        ],
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
    );

Widget dealHost() => DealHostView();

Widget category() {
  return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Card(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Gợi Ý Hôm Nay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: HorizontalCategory(category: [
              Category('NGON', 'assets/images/ngon.png'),
              Category('Giày thể thao nam', 'assets/images/shoeman.png'),
              Category('Balo', 'assets/images/backpack.png'),
              Category('Sách tư duy - Kỹ năng sống', 'assets/images/book.png'),
              Category('Điện thoại Smartphone', 'assets/images/smartphone.png'),
              Category('Tiểu thuyết', 'assets/images/novel.png'),
              Category('Truyện tranh, manga, Comic', 'assets/images/manga.png'),
              Category('Truyện ngắn - Tản văn - Tap...', 'assets/images/shortbook.png'),
              Category('Bàn ghế làm việc', 'assets/images/table.png'),
              Category('Kem chống nắng', 'assets/images/sunscreen.png'),
              Category('Sách Học Tiếng Anh', 'assets/images/englishbook.png'),
              Category('Tã quần', 'assets/images/pants.png'),
              Category('Phụ kiện nhà bếp khác', 'assets/images/accessory.png'),
              Category('Khác', 'assets/images/other.png'),
              Category('Bình giữ nhiệt', 'assets/images/water.png'),
              Category('Tác phẩm kinh điển', 'assets/images/story.png'),
              Category('Tủ', 'assets/images/cabinet1.png'),
              Category('Kệ & Tủ', 'assets/images/cabinet.png'),
              Category('Kem và sữa dưỡng da', 'assets/images/lotion.png'),
              Category('Sữa rửa mặt', 'assets/images/faceclean.png'),
            ]),
          ),
        ]),
      ));
}

Widget suggest() {
  return Container(
    width: double.infinity,
    height: 180,
    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Danh Mục Nổi Bật',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: HorizontalCategory(category: [
              Category('Dành cho bạn', 'assets/images/foryou.png'),
              Category('Đi chợ Siêu Sale', 'assets/images/sale.png'),
              Category('Deal Siêu Hot', 'assets/images/fire.png'),
              Category('Rẻ vô đối', 'assets/images/cheap.png'),
              Category('Hàng mới', 'assets/images/new.png'),
              Category('Xu hướng thời trang', 'assets/images/clother.png'),
              Category('Trending', 'assets/images/heart.png'),
            ]),
          ),
        ],
      ),
    ),
  );
}

Widget items() => Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: VerticalProduct(products: [
                Product.Items('IPhone 11 Pro-Max', 3.0, 1111,590000, 13, 'assets/images/image1.jpg'),
                Product.Items('Kem đánh răng + sữa rửa mặt', 3.5, 1111, 809000, 37, 'assets/images/image2.jpg'),
                Product.Items('Yên xe đạp nhật (Chính hãng)', 4.5, 1111, 114000, 43, 'assets/images/image3.png'),
                Product.Items('Ốp điện thoại', 2.3, 1111, 225000, 4, 'assets/images/image4.png'),
                Product.Items('Dầu gội đầu sunlife', 3.6, 1111, 428000, 23, 'assets/images/image5.jpg'),
                Product.Items('Siri (Mỹ)', 1.4, 1111, 89000, 50, 'assets/images/image6.jpg'),
                Product.Items('Máy hút bụi đa năng', 5.0, 1111, 990000, 49, 'assets/images/image7.png'),
                Product.Items('Chảo chống dính siêu bền', 4.0, 1111, 870000, 37, 'assets/images/image8.jpg'),
                Product.Items('Xạc đa năng (Chính hãng)', 2.8, 1111, 140000, 51, 'assets/images/image9.jpg'),
              ]),
            )
          ],
        ),
      ),
    );


