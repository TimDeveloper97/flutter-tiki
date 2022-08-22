// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:get/get.dart';

class ShellController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
