import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        /// Theme for the slider
        /// Gets the current state of the slider and permits it
        /// to modify only particular params
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveTrackColor,
          thumbColor: kBottomContainerColor,
          overlayColor: kTrackBallOverlayColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),

        /// App wide theme
        primaryColor: Color(0xFF0A0E21) ,
        scaffoldBackgroundColor: Color(0xFF0A0E21) ,
      ),
      home: InputPage(),
    );
  }
}
