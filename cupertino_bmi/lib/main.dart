import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './bmi.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), title: Text('BMI')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings_solid),
                title: Text('Settings')),
          ],
        ),
        tabBuilder: (context, i) {
          if (i == 0) {
            return Bmi();
          } else {
            return Settings();
          }
        });
  }
}
