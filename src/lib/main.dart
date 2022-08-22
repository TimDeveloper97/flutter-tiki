import 'package:androidstudio/app/ui/theme/colors.dart';
import 'package:androidstudio/app/ui/theme/configs.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/localization_service.dart';
import 'app/ui/mobile/account/account_page.dart';
import 'app/ui/mobile/home/home_page.dart';
import 'app/ui/mobile/news/news_page.dart';
import 'app/ui/mobile/notification/notification_page.dart';
import 'app/ui/theme/styles.dart';
import 'app/ui/widgets/bottom_bar.dart';

void main() {
  runApp(GetMaterialApp(
    title: MConfigs.nameProject,
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
  ));
}

class ShellPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _shellPage();
}

class _shellPage extends State<ShellPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MColors.appBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          NewsPage(),
          NotificationPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          index: _currentIndex,
          onClicked: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
