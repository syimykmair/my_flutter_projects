import 'package:flutter/material.dart';
import 'package:flutter_news_app/newsHome.dart';

class NewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Новостной канал',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: TextTheme(titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14,)
          ),
      ),
      home: NewsHome(),
    );
  }
}