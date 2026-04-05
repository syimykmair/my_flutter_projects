import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String description;

  const DetailsPage({
    super.key,
    required this.title,
    required this.description,
  });
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(widget.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: isFavorite
                    ? LinearGradient(colors: [Colors.green, Colors.lightGreen])
                    : LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                      ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // центрируем
                    children: [
                      Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        isFavorite
                            ? 'Добавлено в избранное'
                            : 'Добавить в избранное',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            
             TextButton(
                onPressed: () {
                  Navigator.pop(context);},
                child: Text(
                  'Назад',
                  style: TextStyle(
                    fontSize: 16,
                     
                  ))
             )
            
          ],
        ),
      ),
    );
  }
}
