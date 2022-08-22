// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:androidstudio/app/controller/home/home_controller.dart';
import 'package:androidstudio/app/data/model/category.dart';
import 'package:androidstudio/app/ui/theme/colors.dart';
import 'package:androidstudio/app/ui/theme/configs.dart';
import 'package:androidstudio/app/ui/widgets/header_view.dart';
import 'package:androidstudio/app/ui/widgets/horizontal_category_view.dart';
import 'package:androidstudio/app/ui/widgets/vertical_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../../widgets/banner_view.dart';
import '../../widgets/deal_host_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.appBackground,
        body: GetBuilder<HomeController>(
          builder: (_) => CustomScrollView(
            controller: _.controller,
            slivers: [
              SliverAppBar(
                backgroundColor: MColors.app,
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                title: header(),
                actions: <Widget>[
                  if (_.isHideAction) ...actions(_.fadeInFadeOut)
                ],
                bottom: AppBar(
                  backgroundColor: MColors.app,
                  title: Container(
                    width: MediaQuery.of(context).size.width,
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
                  actions: <Widget>[
                    if (!_.isHideAction) ...actions(_.fadeInFadeOut)
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  banner(),
                  DealHostView(),
                  category(),
                  suggest(),
                  items(),
                ]),
              ),
            ],
          ),
        ));
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
              Category.init('NGON', 'assets/images/ngon.png'),
              Category.init('Giày thể thao nam', 'assets/images/shoeman.png'),
              Category.init('Balo', 'assets/images/backpack.png'),
              Category.init(
                  'Sách tư duy - Kỹ năng sống', 'assets/images/book.png'),
              Category.init(
                  'Điện thoại Smartphone', 'assets/images/smartphone.png'),
              Category.init('Tiểu thuyết', 'assets/images/novel.png'),
              Category.init(
                  'Truyện tranh, manga, Comic', 'assets/images/manga.png'),
              Category.init('Truyện ngắn - Tản văn - Tap...',
                  'assets/images/shortbook.png'),
              Category.init('Bàn ghế làm việc', 'assets/images/table.png'),
              Category.init('Kem chống nắng', 'assets/images/sunscreen.png'),
              Category.init(
                  'Sách Học Tiếng Anh', 'assets/images/englishbook.png'),
              Category.init('Tã quần', 'assets/images/pants.png'),
              Category.init(
                  'Phụ kiện nhà bếp khác', 'assets/images/accessory.png'),
              Category.init('Khác', 'assets/images/other.png'),
              Category.init('Bình giữ nhiệt', 'assets/images/water.png'),
              Category.init('Tác phẩm kinh điển', 'assets/images/story.png'),
              Category.init('Tủ', 'assets/images/cabinet1.png'),
              Category.init('Kệ & Tủ', 'assets/images/cabinet.png'),
              Category.init('Kem và sữa dưỡng da', 'assets/images/lotion.png'),
              Category.init('Sữa rửa mặt', 'assets/images/faceclean.png'),
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
              Category.init('Dành cho bạn', 'assets/images/foryou.png'),
              Category.init('Đi chợ Siêu Sale', 'assets/images/sale.png'),
              Category.init('Deal Siêu Hot', 'assets/images/fire.png'),
              Category.init('Rẻ vô đối', 'assets/images/cheap.png'),
              Category.init('Hàng mới', 'assets/images/new.png'),
              Category.init('Xu hướng thời trang', 'assets/images/clother.png'),
              Category.init('Trending', 'assets/images/heart.png'),
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
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: VerticalProduct(products: [
                Product.init('IPhone 11 Pro-Max', 3.0, 1111, 590000, 13,
                    'assets/images/image1.jpg'),
                Product.init('Kem đánh răng + sữa rửa mặt', 3.5, 1111, 809000,
                    37, 'assets/images/image2.jpg'),
                Product.init('Yên xe đạp nhật (Chính hãng)', 4.5, 1111, 114000,
                    43, 'assets/images/image3.png'),
                Product.init('Ốp điện thoại', 2.3, 1111, 225000, 4,
                    'assets/images/image4.png'),
                Product.init('Dầu gội đầu sunlife', 3.6, 1111, 428000, 23,
                    'assets/images/image5.jpg'),
                Product.init('Siri (Mỹ)', 1.4, 1111, 89000, 50,
                    'assets/images/image6.jpg'),
                Product.init('Máy hút bụi đa năng', 5.0, 1111, 990000, 49,
                    'assets/images/image7.png'),
                Product.init('Chảo chống dính siêu bền', 4.0, 1111, 870000, 37,
                    'assets/images/image8.jpg'),
                Product.init('Xạc đa năng (Chính hãng)', 2.8, 1111, 140000, 51,
                    'assets/images/image9.jpg'),
              ]),
            ),
            OutlinedButton(
              onPressed: () {
                print("more item");
              },
              style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      color: MColors.app,
                      width: 1.0,
                      style: BorderStyle.solid))),
              child: Text(
                "Xem Thêm",
                style: TextStyle(color: MColors.app),
              ),
            ),
          ],
        ),
      ),
    );
