// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:androidstudio/app/data/provider/home_provider.dart';
import 'package:androidstudio/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(repository: HomeRepository(apiClient: HomeProvider(httpClient: http.Client())));
    });
  }
}
