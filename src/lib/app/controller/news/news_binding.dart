// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:get/get.dart';
import 'news_controller.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
