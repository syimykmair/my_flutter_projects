import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
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
      appBar: AppBar(title: Text('Первый Экран'), centerTitle: true),
      body: Center(
        child: ElevatedButton(onPressed: 
        (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>SecondPage()),);
        },
         child: Text('Перейти на второй экран')),
      ),
    );
     }
   
}
class SecondPage extends StatelessWidget{
   SecondPage ({super.key});
   
     @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второй Экран',), centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: 
        (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>ThirdPage()),);
        },
         child: Text('Перейти на третий экран')),
      ),
    );
     }
   
}
class ThirdPage extends StatelessWidget{
   ThirdPage ({super.key});
   
     @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Третий Экран',), centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: 
        (){
          Navigator.popUntil(
            context, (route) => route.isFirst
            );
        },
         child: Text('Вернуться на первый экран')),
      ),
    );
     }
   
}