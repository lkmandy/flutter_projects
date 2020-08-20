import 'package:flutter/material.dart';

// Entry point of all flutter projects
void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        title: Text("I Am Poor"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/coronavirus.jpg'),
        ),
      ),
    )),
  );
}
