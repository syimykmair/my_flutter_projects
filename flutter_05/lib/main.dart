import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'imperativ Navigation',
      home: FirstPage(),
    );
    
  }

}
class FirstPage extends StatelessWidget{
   FirstPage ({super.key});
   
     @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Первый Экран')),
    );
     }
   
}