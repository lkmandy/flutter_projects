import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './util.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController;
  TextEditingController weightController;
  int unit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    heightController = TextEditingController();
    weightController = TextEditingController();

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('BMI')),
        child: SafeArea(
            minimum: EdgeInsets.all(0),
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.network('https://bit.ly/img_bmi'),
                          Util.paddingTop,
                          Row(
                            children: <Widget>[
                              Util.paddingLeft,
                              Container(
                                  width: width / 3,
                                  child: Text(
                                    'Height',
                                    style: Util.textStyle,
                                  )),
                              Expanded(
                                  child: CupertinoTextField(
                                style: Util.textStyle,
                                controller: heightController,
                                decoration: Util.textFieldDecoration,
                                onChanged: null,
                              )),
                              Util.paddingLeft,
                            ],
                          ),
                          Util.paddingTop,
                          Row(
                            children: <Widget>[
                              Util.paddingLeft,
                              Container(
                                  width: width / 3,
                                  child: Text(
                                    'Weigth',
                                    style: Util.textStyle,
                                  )),
                              Expanded(
                                  child: CupertinoTextField(
                                style: Util.textStyle,
                                controller: weightController,
                                decoration: Util.textFieldDecoration,
                                onChanged: null,
                              )),
                              Util.paddingLeft,
                            ],
                          ),
                          Expanded(
                              child: Container(
                            child: Util.paddingTop,
                          )),
                          CupertinoButton.filled(
                            child: Text('Calculate BMI'),
                            onPressed: showResult,
                          ),
                          Util.paddingTop,
                        ],
                      ))));
            })));
  }

  void onSetting(int value) {
    setState(() {
      unit = value;
    });
  }

  void showResult() async {
    double _height;
    double _weight;
    int unit = await Util.getSettings();
    _height = double.tryParse(heightController.text);
    _weight = double.tryParse(weightController.text);

    double result = Util.calculateBMI(_height, _weight, unit);
    String message = 'Your BMI is ' + result.toStringAsFixed(2);
    var dialog = CupertinoAlertDialog(
      title: Text('Result'),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
