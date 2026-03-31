import 'package:flutter/material.dart';

class TabBarViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Приложение'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Новости'),
                Tab(text: 'Чаты'),
                Tab(text: 'Профиль'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Новости'),),
              Center(child: Text('Чаты'),),
              Center(child: Text('Профиль'),),
            ]
          ),
        ),
      ),
    );
  }
}
