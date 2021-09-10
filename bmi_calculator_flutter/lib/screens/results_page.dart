import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({ @required this.bmiResult, @required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult.toUpperCase(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(child:  BottomCalculateButton(
            buttonTitle: 'Re-calculate'.toUpperCase(),
            onTap: (){
              Navigator.pop(context);
            },
          ),),
        ],
      ),
    );
  }
}
