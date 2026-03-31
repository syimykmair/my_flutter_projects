import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page View пример'),
          centerTitle: true,
        ),
        body: PageView(
          children: [
            page('Добро пожаловать', Colors.blue),
            page(' Курс по Flutter', const Color.fromARGB(255, 51, 255, 0)),
            page('Mobile', Colors.orange)
          ],
        ),
      ),
    );
}
}

Widget page(String text, Color color){
  return Container(
      color: color,
      child: Center(
        child: Text(text,style: TextStyle(fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold)),
      ),
  );
}