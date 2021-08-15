
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.gestureDetector});

  final Color colour;
  final Widget cardChild;
  final Function gestureDetector;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureDetector,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
          padding:  EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}