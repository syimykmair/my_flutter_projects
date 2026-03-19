import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculatorScreen.dart';

class CalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: CalculatorScreen() ,
    );
  }

}