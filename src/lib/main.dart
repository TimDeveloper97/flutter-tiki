import 'package:androidstudio/shares/configs.dart';
import 'package:androidstudio/shares/styles.dart';
import 'package:androidstudio/views/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MConfigs.nameProject,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Georgia',
        textTheme: theme,
      ),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
