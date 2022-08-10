import 'package:flutter/material.dart';

class BannerView extends StatefulWidget{
  final List<String> images;

  const BannerView({Key? key, required this.images}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _bannerView();
}

class _bannerView extends State<BannerView>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}