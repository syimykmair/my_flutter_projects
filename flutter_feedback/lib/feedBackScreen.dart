import 'package:flutter/material.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  FeedBackScreenState createState() => FeedBackScreenState();
}

class FeedBackScreenState extends State<FeedBackScreen> {
  final TextEditingController firstController = TextEditingController();

  String name = "";
  bool isSent = false;
  

  void resetFeedBack() {
    setState(() {
      firstController.clear();

      isSent = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Обратная связь',

          style: TextStyle(color: Colors.black, fontFamily: 'SNPro-Medium'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Напишите нам',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 12),
             Text('Введите ваше имя и нажмите кнопку отправки.', style: TextStyle(fontFamily:'SNPro-Medium'),),

            SizedBox(height: 8),
            Text('Ваше имя',style: TextStyle(fontSize: 13,)),
            TextField(
              controller: firstController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Имя',
              ),
              onChanged: (value) {
                name = value;
              },
            ),

            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (name.trim().isEmpty) return;

                  setState(() {
                    isSent = true;
                  });

                  firstController.clear();
                },

                child: Text('Отправить'),
              ),
            ),

            SizedBox(height: 20),

            // 🔹 результат
            if (isSent)
              Text(
                'Отправлено! Спасибо, $name',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
