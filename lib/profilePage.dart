import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String name = 'Syimyk Mairambekov';
  // String bio = ' Student';
  String city = 'Bishkek';
  int age = 22;
  List<String> interests = ["coding", "playing football", "crafting"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 217, 3),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 255, 0),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('images/my_photo.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'ArchivoBlack-Regular',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 70, 72, 74),
              ),
            ),
            // SizedBox(height: 8),
            // Text(
            //   bio,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 16),
            // ),
            SizedBox(height: 10),
            Text(
              "I'm $age",
              style: TextStyle(
                fontFamily: 'IosevkaCharonMono-BoldItalic',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 70, 72, 74),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "I'm  from $city",
              style: TextStyle(
                fontFamily: 'IosevkaCharonMono-BoldItalic',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 70, 72, 74),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "In my free time I like ${interests[0]}, "
              "sometimes ${interests[1]}, and occasionally ${interests[2]}.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IosevkaCharonMono-BoldItalic',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 70, 72, 74),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.camera_alt),
                //   iconSize: 30,
                // ),
                IconButton(
                  onPressed: () {
                    print("YouTube clicked!");
                  },
                  icon: Icon(Icons.video_library), // любая стандартная иконка
                  color: Colors.red,
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {
                    print("TikTok clicked!");
                  },
                  icon: Icon(Icons.music_note), // иконка TikTok
                  color: Colors.black,
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {
                    print("Instagram clicked!");
                  },
                  icon: Icon(Icons.camera_alt), // иконка Instagram
                  color: Colors.purple,
                  iconSize: 25,
                ),
              ],
            ),
             SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Follow pressed!");
                  },
                  child: Text("Follow"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
