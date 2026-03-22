import 'package:flutter/material.dart';
import 'package:flutter_feedback/feedBackScreen.dart';

class  FeedBackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(debugShowCheckedModeBanner: false,
    home: FeedBackScreen(),
    );
  }
}