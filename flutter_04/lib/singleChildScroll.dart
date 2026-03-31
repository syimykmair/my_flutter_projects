
import 'package:flutter/material.dart';

class SingleChildScrollViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Профиль'),centerTitle: true,),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Заголовок', style: TextStyle(
                fontSize: 24,fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Text('Очень длинный текст........\n'*45),

              SizedBox(height: 20),

              ElevatedButton(onPressed: (){}, child: Text('Сохранить'))
            ],
          ),
        ),
      ),
    );
  }

}