import 'package:androidstudio/shares/colors.dart';
import 'package:androidstudio/shares/configs.dart';
import 'package:androidstudio/views/controls/header_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header(),
          Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                padding: MConfigs.paddingPage,
                child: body(),
              )),
          footer(),
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
    child: HeaderView(),
  );
}

Widget body(){
  return Container();
}

Widget footer(){
  return  Container(
    padding: const EdgeInsets.all(8.0),
    color: Colors.blue,
    alignment: Alignment.center,
    child: Text("Footer"),
  );
}