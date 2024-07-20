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
        body: Center(
          child: Text('Gilang Muhammad'),
        ),
      ),
    );
  }
}
