import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      home: Scaffold(
          backgroundColor: Colors.indigo[100],
          appBar: AppBar(
            title: Text('GridView'),
          ),
          body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final sizeX = MediaQuery.of(context).size.width;
    // final sizeY = MediaQuery.of(context).size.height;

    return Container(
        child: GridView.count(
      crossAxisCount: 2,
      children: createGallery(50),
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      padding: EdgeInsets.all(5),
    ));
  }
}

List<Widget> createGallery(int numImages) {
  List<Widget> images = List<Widget>();
  List<String> urls = List<String>();
  int i = 0;
  urls.add('https://bit.ly/2GFmmWs');
  urls.add('https://bit.ly/2F6trz8');
  urls.add('https://bit.ly/33wUiOj');
  urls.add('https://bit.ly/3cYD7Z3');
  urls.add('https://bit.ly/3cZDOBf');
  Widget carImage;
  while (i < numImages) {
    carImage = Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(urls[i % 5]),
      ),
    ));
    images.add(carImage);
    i++;
  }
  return images;
}

// List of Squares and separator for list view
List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  //squares.add(Container(color: Colors.black,));
  Widget square;
  while (i < numSquares) {
    square = Container(
      color: colors[i % 5],
      height: 100,
      width: 200,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }

  return squares;
}

Widget createSquare(int position) {
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];

  Widget square = Container(
    color: colors[position % 5],
    height: 100,
    width: 100,
    child: Text(position.toString()),
  );
  return square;
}

Widget createSeparator(int position) {
  Widget square = Container(
    height: 15,
    color: Colors.black,
    child: Text('Separator ' + position.toString()),
  );
  return square;
}
