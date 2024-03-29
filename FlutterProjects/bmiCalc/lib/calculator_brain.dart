import 'dart:math';
import 'input_page.dart';


class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;

  late double _bmi ;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25){
      return 'Overweight';
    }else if(_bmi >18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25){
      return 'Please Exercise More';
    }else if(_bmi >18.5){
      return 'Keep it Up';
    }else{
      return 'Please Eat More';
    }
  }
}