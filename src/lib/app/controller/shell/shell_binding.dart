// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:androidstudio/app/controller/account/account_controller.dart';
import 'package:androidstudio/app/controller/news/news_controller.dart';
import 'package:androidstudio/app/controller/notification/notification_controller.dart';
import 'package:androidstudio/app/controller/shell/shell_controller.dart';
import 'package:androidstudio/app/data/provider/home_provider.dart';
import 'package:androidstudio/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../home/home_controller.dart';

class ShellBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(repository: HomeRepository(apiClient: HomeProvider(httpClient: http.Client()))));
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
