// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:androidstudio/app/controller/news/news_binding.dart';
import 'package:androidstudio/app/controller/shell/shell_binding.dart';
import 'package:androidstudio/app/ui/mobile/news/news_page.dart';
import 'package:androidstudio/main.dart';
import 'package:get/get.dart';
import '../controller/home/home_binding.dart';
import '../ui/mobile/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.INITIAL, page: () => ShellPage(), binding: ShellBinding()),
    GetPage(name: Routes.ACCOUNT, page: () => null, binding: null),
    GetPage(name: Routes.NOTIFICATION, page: () => null, binding: null),
    GetPage(name: Routes.NEWS, page: () => const NewsPage(), binding: NewsBinding()),
    GetPage(name: Routes.SIGNIN, page: () => null, binding: null),
    GetPage(name: Routes.SIGNUP, page: () => null, binding: null),
  ];
}
