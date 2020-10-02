import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Column(
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              margin: EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(20.0),
                //   bottomRight: Radius.circular(20.0),
                // ),
                image: DecorationImage(
                  image: NetworkImage('http://bit.ly/flutter_tiger'),
                  fit: BoxFit.contain,
                ),
                gradient: LinearGradient(
                  // Alignment( x , y)
                  // begin: Alignment(0.0, -0.5),
                  // end: Alignment(0.0, 0.5),
                  //colors: [Colors.purple[50], Colors.purple[500]],
                  colors: [
                    Colors.amber,
                    Colors.amberAccent,
                    Colors.yellow,
                    Colors.pink,
                  ],
                  stops: [
                    0.5,
                    0.6,
                    0.7,
                    0.8,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
