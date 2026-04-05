import 'package:flutter/material.dart';
import 'package:flutter_control_2_2/detailsPage.dart';

class CatalogApp extends StatelessWidget {
  CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Каталог'), centerTitle: true),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              
            ),
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
            leading: Icon(Icons.menu),
            title: Text('Item ${index+1}'),
            subtitle: Text('Описание элемента ${index+1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(
                  title: 'Item ${index+1}',                
          description: 'Описание элемента ${index+1}',
                ),
                ),
              );
            },
            ),
          );
        },
      ),
    );
  }
}
