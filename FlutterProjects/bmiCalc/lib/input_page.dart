import 'package:bmi_calc/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
  genderFluid,
}


class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE', ),
                  updateColor: selectedGender == Gender.male ? kActiveCardColor : kInActiveCardColor,
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                  updateColor: selectedGender == Gender.female ? kActiveCardColor : kInActiveCardColor,
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(icon: FontAwesomeIcons.marsAndVenusBurst, label: 'GENDER FLUID', ),
                  updateColor: selectedGender == Gender.genderFluid ? kActiveCardColor : kInActiveCardColor,
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.genderFluid;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                style: kLabelTextStyle,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kSliderTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ]
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0x80ffbf00),
                    inactiveTrackColor: Color(0x30ffbf00),
                    thumbColor: kBottomContainerColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: kSliderOverlayColor,
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        height = newValue.round();
                      },
                  ),
                ),
              ],
            ),
            updateColor: kInActiveCardColor,
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                updateColor: kInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kSliderTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child: ReusableCard(
                updateColor: kInActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kSliderTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              ),),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                  ),
              );
            },
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}








