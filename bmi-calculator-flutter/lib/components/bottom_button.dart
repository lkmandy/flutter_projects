import 'package:flutter/material.dart';

import '../constants.dart';

class BottomCalculateButton extends StatelessWidget {
  BottomCalculateButton({
    @required this.onTap, @required this.buttonTitle,
  });
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
              buttonTitle.toUpperCase(),
              style: kLargeButtonTextStyle,
            )),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
