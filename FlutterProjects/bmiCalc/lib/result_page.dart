import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import 'reuse_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
              style: kTitleTextStyle,
            ),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiResult.toUpperCase(),style: kBMITextStyle,),
                  Text(interpretation.toUpperCase(),
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,),
                ],
              ),
              updateColor: kActiveCardColor,
            ),
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),

    );
  }
}