import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rows & Columns',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rows & Columns'),
        ),
        body: Home(),
        backgroundColor: Color(0xf5f5dc),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Takes the full width of screen
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Row(
        // To order children in a column
        // verticalDirection: VerticalDirection.up,
        // To order children in a row
        // textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: createSquares(5),
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue,
    ];

    List<Widget> squares = List<Widget>();
    while (i < numSquares) {
      Expanded square = Expanded(
        flex: i,
        child: Container(
          color: colors[i],
          width: 100,
          height: 100,
          child: Text(i.toString()),
        ),
      );
      i++;
      squares.add(square);
    }
    return squares;
  }
}
