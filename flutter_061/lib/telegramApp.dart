import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const TelegramApp());
}

class TelegramApp extends StatefulWidget {
  const TelegramApp({super.key});

  @override
  State<TelegramApp> createState() => TelegramAppState();
}

class TelegramAppState extends State<TelegramApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorSchemeSeed: const Color(0xFF2AABEE),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2AABEE),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E1621),
        colorSchemeSeed: const Color(0xFF2AABEE),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF17212B),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2AABEE),
        ),
      ),
      home: HomePage(
        onToggleTheme: toggleTheme,
        themeMode: themeMode,
      ),
    );
  }
}