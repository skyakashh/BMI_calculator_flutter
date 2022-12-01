import 'package:flutter/material.dart';
import 'dart:math';

class Calculator_brain {
  Calculator_brain({required this.height, required this.weight});
  final int height;
  final int weight;
  double bmi = 25;
  String calBMI(){
   bmi= weight / (pow(height/100 , 2));
    return bmi.toStringAsFixed(1);
  }

  String get_result(){
    if(bmi >= 25) return 'OVERWEIGHT';
    else if(bmi>=18.5)  return 'NORMAL';
    else return 'UNDERWEIGHT';
  }

  String get_inter(){
    if(bmi >= 25) return 'Mote ho tum , gym jaana shuru kro';
    else if(bmi>=18.5)  return 'badhiyan aadmi ho tum';
    else return 'khaao peo thoda ...kuposhit';
  }
}