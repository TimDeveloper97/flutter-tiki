import 'package:androidstudio/shares/colors.dart';
import 'package:androidstudio/shares/configs.dart';
import 'package:androidstudio/views/controls/header_view.dart';
import 'package:flutter/material.dart';

import '../controls/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePageState();
}

class _homePageState extends State<HomePage> with TickerProviderStateMixin {
  static const int offset = 28;
  static const int sizeAction = 100;

  late double width, swidth;
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

    if(_controller.offset >= point) {
      animation.value = 1;
    }

    if(_controller.offset > 0 && _controller.offset < offset){
      animation.value = 1.0 * (point - _controller.offset) / point;
      width = swidth - animation.value * sizeAction;
      print('${width}');
    }
    else if(_controller.offset > offset && _controller.offset < offset * 2){
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
    swidth = width = MediaQuery.of(context).size.width;
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

Widget banner() => BannerView(images: [],);

Widget dealHost(){
  return Container();
}

Widget category(){
  return Container();
}
