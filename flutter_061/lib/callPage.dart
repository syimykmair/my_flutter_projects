import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  final List<Map<String, dynamic>> calls = const [
    {'name': 'Алия', 'type': 'incoming', 'time': '10:30'},
    {'name': 'Санжар', 'type': 'outgoing', 'time': '09:45'},
    {'name': 'Айбек', 'type': 'missed', 'time': 'Вчера'},
  ];

  Icon getCallIcon(String type) {
    switch (type) {
      case 'incoming':
        return const Icon(Icons.call_received, color: Colors.green);
      case 'outgoing':
        return const Icon(Icons.call_made, color: Colors.blue);
      case 'missed':
        return const Icon(Icons.call_missed, color: Colors.red);
      default:
        return const Icon(Icons.call);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(call['name']![0]),
          ),
          title: Text(call['name']!),
          subtitle: Text(call['time']!),
          trailing: getCallIcon(call['type']!),
          onTap: () {},
        );
      },
    );
  }
}