import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building Layouts with Flutter',
      // set app theme
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff009688),
        // primaryColor: Colors.amber,
        accentColor: Color(0xff7C4DFF),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building Layouts with Flutter'),
        ),
        body: Center(
          child: Text(
            'Hello Flutter Layouts',
          ),
        ),
        // Floating Action Button
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.lightbulb_outline),
          onPressed: () {
            print('You rang');
          },
        ),
        persistentFooterButtons: <Widget>[
          IconButton(
            icon: Icon(Icons.add_comment),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_alarm),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_location),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
