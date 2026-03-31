import 'package:flutter/material.dart';

void main() => runApp(ThemePracticApp());

class ThemePracticApp extends StatefulWidget{
  ThemePracticApp({super.key});
  
  @override
  State<ThemePracticApp> createState() => ThemePracticAppState(); 
  
}

class ThemePracticAppState extends State<ThemePracticApp>{
  
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(){
    setState(() {
      themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;    
    });
  }
  
 @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      title: 'Theme Practice',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurpleAccent
        ),
      ),
      home: HomePage(onToggleTheme: toggleTheme, themeMode: themeMode),
    );
  }
}

class HomePage extends StatelessWidget{
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  HomePage ({super.key, 
  required this.onToggleTheme,
  required this.themeMode
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThemeData & ThemeMode'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleTheme,
        child: Icon(themeMode==ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
        ),
        body: Center(
          child: Text(themeMode==ThemeMode.light? 'Светлая тема' : 'Темная тема', 
          style: TextStyle(fontSize: 30),),
        ),
    );
  }
  
}
  