import 'package:flutter/material.dart';

class NewsHome extends StatelessWidget {
  final List<Map<String, String>> news = List.generate(
    20,
    (i) => {
      'title': 'Заголовок новости ${i + 1}',
      'subtitle': 'Описание новости ${i + 1}',
      'image': 'https://picsum.photos/seed/news$i/400/200',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новости',
          style: TextStyle(fontFamily: 'SNPro-Medium', fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(118, 142, 255, 4),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];

          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        item['image']!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4), // сверху тёмный
                              Colors.transparent, // середина прозрачная
                              Colors.black.withOpacity(0.4), // снизу тёмный
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: Text(
                          item['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1), // смещение тени по X и Y
                                blurRadius: 2, // размытие тени
                                color: const Color.fromARGB(
                                  115,
                                  255,
                                  255,
                                  255,
                                ), // цвет тени
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      item['subtitle']!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
