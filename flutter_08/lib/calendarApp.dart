import 'package:flutter/material.dart';
import 'package:flutter_08/calendarPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CalendarApp extends StatefulWidget {
  CalendarApp ({super.key});
  
  @override
  State<CalendarApp> createState() => _CalendarAppState ();

  
}

class _CalendarAppState extends State<CalendarApp>{
  Locale _locate = Locale('ru');

  void _toggleLanguage (){
    setState(() {
      _locate = _locate.languageCode == 'ru'? Locale('en') : Locale('ru');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      locale: _locate,
      supportedLocales: [
        Locale('ru'),
        Locale('en'),
      ],
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      title: 'Календарь',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: CalendarPage(onToggleLanguage: _toggleLanguage) ,
    );
  }
  
}