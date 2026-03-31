import 'package:flutter/material.dart';
import 'package:flutter_061/appDrawer.dart';
import 'package:flutter_061/callPage.dart';
import 'package:flutter_061/contactPage.dart';
import 'package:flutter_061/settingsPage.dart';

class HomePage extends StatefulWidget  {
    final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  HomePage ({super.key, 
  required this.onToggleTheme,
  required this.themeMode
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    ChatPage(),
    CallPage(),
    ContactPage(),
    SettingsPage(),
  ];
  final List<String> titles = [
    'Чаты',
    'Звонки',
    'Контакты',
    'Настройки',
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
  title: Text(titles[currentIndex]),
  centerTitle: true,
),
       drawer: AppDrawer(),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onToggleTheme,
        child: Icon(
          widget.themeMode == ThemeMode.light
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF2AABEE),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      items: const[
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Чаты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Звонки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Контакты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
   );
  }
}

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final List<Map<String, String>> chats = [
    {'name': 'Алия', 'message': 'Привет! Как дела?', 'time': '10:30'},
    {'name': 'Санжар', 'message': 'Скинь документ.', 'time': '09:45'},
    {'name': 'Айбек', 'message': 'Встретимся позже?', 'time': 'Вчера'},
    {'name': 'Динара', 'message': 'Спасибо!', 'time': 'Вчера'},
    {'name': 'Эмиль', 'message': 'Привет, идем в кино?', 'time': 'Пн'},
    {'name': 'Лейла', 'message': 'Ок, договорились!', 'time': 'Вс'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(chat['name']![0]), // первая буква имени
          ),
          title: Text(chat['name']!),
          subtitle: Text(chat['message']!),
          trailing: Text(chat['time']!),
          onTap: () {
            // Здесь можно добавить логику открытия чата
          },
        );
      },
    );
  }
}

