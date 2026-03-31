import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Профиль'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Уведомления'),
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Конфиденциальность'),
        ),
        ListTile(
          leading: Icon(Icons.palette),
          title: Text('Тема'),
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Помощь'),
        ),
      ],
    );
  }
}