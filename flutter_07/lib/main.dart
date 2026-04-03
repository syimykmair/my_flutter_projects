import 'package:flutter/material.dart';
import 'package:flutter_07/reqistrationPage.dart';

void main() => runApp(ReqistrationApp());

class ReqistrationApp extends StatelessWidget{
   const ReqistrationApp ({super.key});
   
     @override
     Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Регистрация',
    home: ReqistrationPage(),
   );
     }

   
}