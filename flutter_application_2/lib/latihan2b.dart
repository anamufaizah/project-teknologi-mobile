import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selamat Datang di Flutter'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow, // Set the background color here
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                        'image/fotoglg.jpg'), // Tambahkan path gambar Anda di sini
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Gilang Muhammad',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
