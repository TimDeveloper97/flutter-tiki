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
import '../../../translations/localization_service.dart';
import '../../theme/styles.dart';
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
                  // language(),
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

Widget language() {
  String _selectedLang = LocalizationService.locale.languageCode;
  return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Text(
            'EN' + 'hello'.tr,
            style: bodyText1,
          ),
          DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            value: _selectedLang,
            items: _buildDropdownMenuItems(),
            onChanged: (value) {
              // setState(() => _selectedLang = value);
              LocalizationService.changeLocale(value.toString());
            },
          ),
        ],
      ));
}

List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
  var list = <DropdownMenuItem<String>>[];
  LocalizationService.langs.forEach((key, value) {
    list.add(DropdownMenuItem<String>(
      value: key,
      child: Text(key),
    ));
  });
  return list;
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
              'G???i ?? H??m Nay',
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
              Category.init('Gi??y th??? thao nam', 'assets/images/shoeman.png'),
              Category.init('Balo', 'assets/images/backpack.png'),
              Category.init(
                  'S??ch t?? duy - K??? n??ng s???ng', 'assets/images/book.png'),
              Category.init(
                  '??i???n tho???i Smartphone', 'assets/images/smartphone.png'),
              Category.init('Ti???u thuy???t', 'assets/images/novel.png'),
              Category.init(
                  'Truy???n tranh, manga, Comic', 'assets/images/manga.png'),
              Category.init('Truy???n ng???n - T???n v??n - Tap...',
                  'assets/images/shortbook.png'),
              Category.init('B??n gh??? l??m vi???c', 'assets/images/table.png'),
              Category.init('Kem ch???ng n???ng', 'assets/images/sunscreen.png'),
              Category.init(
                  'S??ch H???c Ti???ng Anh', 'assets/images/englishbook.png'),
              Category.init('T?? qu???n', 'assets/images/pants.png'),
              Category.init(
                  'Ph??? ki???n nh?? b???p kh??c', 'assets/images/accessory.png'),
              Category.init('Kh??c', 'assets/images/other.png'),
              Category.init('B??nh gi??? nhi???t', 'assets/images/water.png'),
              Category.init('T??c ph???m kinh ??i???n', 'assets/images/story.png'),
              Category.init('T???', 'assets/images/cabinet1.png'),
              Category.init('K??? & T???', 'assets/images/cabinet.png'),
              Category.init('Kem v?? s???a d?????ng da', 'assets/images/lotion.png'),
              Category.init('S???a r???a m???t', 'assets/images/faceclean.png'),
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
              'Danh M???c N???i B???t',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: HorizontalCategory(category: [
              Category.init('D??nh cho b???n', 'assets/images/foryou.png'),
              Category.init('??i ch??? Si??u Sale', 'assets/images/sale.png'),
              Category.init('Deal Si??u Hot', 'assets/images/fire.png'),
              Category.init('R??? v?? ?????i', 'assets/images/cheap.png'),
              Category.init('H??ng m???i', 'assets/images/new.png'),
              Category.init('Xu h?????ng th???i trang', 'assets/images/clother.png'),
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
                Product.init('Kem ????nh r??ng + s???a r???a m???t', 3.5, 1111, 809000,
                    37, 'assets/images/image2.jpg'),
                Product.init('Y??n xe ?????p nh???t (Ch??nh h??ng)', 4.5, 1111, 114000,
                    43, 'assets/images/image3.png'),
                Product.init('???p ??i???n tho???i', 2.3, 1111, 225000, 4,
                    'assets/images/image4.png'),
                Product.init('D???u g???i ?????u sunlife', 3.6, 1111, 428000, 23,
                    'assets/images/image5.jpg'),
                Product.init('Siri (M???)', 1.4, 1111, 89000, 50,
                    'assets/images/image6.jpg'),
                Product.init('M??y h??t b???i ??a n??ng', 5.0, 1111, 990000, 49,
                    'assets/images/image7.png'),
                Product.init('Ch???o ch???ng d??nh si??u b???n', 4.0, 1111, 870000, 37,
                    'assets/images/image8.jpg'),
                Product.init('X???c ??a n??ng (Ch??nh h??ng)', 2.8, 1111, 140000, 51,
                    'assets/images/image9.jpg'),
              ]),
            ),
            OutlinedButton(
              onPressed: () {
                print("more item");
              },
              style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                      color: MColors.app,
                      width: 1.0,
                      style: BorderStyle.solid))),
              child: const Text(
                "Xem Th??m",
                style: TextStyle(color: MColors.app),
              ),
            ),
          ],
        ),
      ),
    );
