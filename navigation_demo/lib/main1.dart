import 'package:flutter/material.dart';
import 'package:navigation_demo/art_route.dart';
import 'package:navigation_demo/art_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art Design',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ArtRoute(
        art: ArtUtil.IMG_VANGOGH,
      ),
    );
  }
}
