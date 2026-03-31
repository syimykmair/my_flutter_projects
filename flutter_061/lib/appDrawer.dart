import 'package:flutter/material.dart';
import 'package:flutter_061/callPage.dart';
import 'package:flutter_061/contactPage.dart';
import 'package:flutter_061/settingsPage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final telegramBlue = Color(0xFF2AABEE);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 170,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: telegramBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                 child: ClipOval(
                    child: Image.asset(
                      'images/my_photo.jpg', // путь к твоему фото
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover, // масштабируем и обрезаем под круг
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Сыймык Майрамбек уулу',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text('+996709049319', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      //  leading: Icon(icon, color: Colors.black), --- Это ранний вариант
      leading: Icon(icon), //--- это лучший варинат
      title: Text(title),
      onTap: onTap,
    );
  }
}
