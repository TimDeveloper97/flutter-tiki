// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:androidstudio/app/data/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  static const int offset = 28;
  static const int sizeAction = 100;

  final HomeRepository repository;

  HomeController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    animation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
    controller = ScrollController();
    controller.addListener(scrollListener);
    animation.forward(from: 1);
  }

  // final _postsList = <Category>[].obs;
  //
  // get postList => this._postsList.value;
  //
  // set postList(value) => this._postsList.value = value;
  //
  // final _post = Category().obs;
  //
  // get post => this._post.value;
  //
  // set post(value) => this._post.value = value;

  late double width, sWidth;
  late bool isHideAction = true;
  late ScrollController controller;
  late AnimationController animation;
  late Animation<double> fadeInFadeOut;

  getAll() {
    repository.getAll().then((data) {
      // this.postList = data;
    });
  }

  scrollListener() {
    // print('offset: ${controller.offset}');
    var point = controller.position.minScrollExtent + offset;

    if (controller.offset >= point) {
      animation.value = 1;
    }

    if (controller.offset > 0 && controller.offset < offset) {
      animation.value = 1.0 * (point - controller.offset) / point;
      width = sWidth - animation.value * sizeAction;
    } else if (controller.offset > offset && controller.offset < offset * 2) {
      animation.value = 1.0 * (controller.offset - point) / point;
    }

    if (controller.offset > point && !controller.position.outOfRange) {
      isHideAction = false;
    }
    if (controller.offset < point && !controller.position.outOfRange) {
      isHideAction = true;
    }
  }

// details(post){
//   this.post = post;
//   Get.toNamed(Routes.DETAILS);
// }
}
