import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<String> contacts = const [
    'Алия', 'Санжар', 'Айбек', 'Динара', 'Эрмек', 'Мадина'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final name = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(name[0]),
          ),
          title: Text(name),
          onTap: () {},
        );
      },
    );
  }
}