import 'package:androidstudio/shares/colors.dart';
import 'package:androidstudio/shares/configs.dart';
import 'package:androidstudio/views/controls/bottom_bar.dart';
import 'package:androidstudio/views/pages/account_page.dart';
import 'package:androidstudio/views/pages/home_page.dart';
import 'package:androidstudio/views/pages/news_page.dart';
import 'package:androidstudio/views/pages/notification_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MConfigs.nameProject,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      home: ShellPage(),
    );
  }
}


class ShellPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _shellPage();
}

List<Widget> _widgetOptions = <Widget>[
  HomePage(),
  NewsPage(),
  NotificationPage(),
  AccountPage(),
];

class _shellPage extends State<ShellPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MColors.appBackground,
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavBar(index: _currentIndex, onClicked: (index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }
}
