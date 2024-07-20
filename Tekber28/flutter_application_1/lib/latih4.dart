import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Latih4(),
  ));
}

class Latih4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent[100],
          title: Text('Menu Gambar Pahlawan'),
        ),
        backgroundColor: Colors.blue,
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan1.jpg', // Ubah sesuai dengan path gambar nanas
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ir Soekarno',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan2()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan3.jpg', // Ubah sesuai dengan path gambar anggur
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mohammad Hatta',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan3()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan5.jpg', // Ubah sesuai dengan path gambar nanas
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bung Tomo',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan4()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan7.jpg', // Ubah sesuai dengan path gambar jeruk
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ki Hajar Dewantara',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan5()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan9.jpg', // Ubah sesuai dengan path gambar jeruk
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kapten Pattimura',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotPahlawan6()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/pahlawan11.jpg', // Ubah sesuai dengan path gambar jeruk
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cut Nyak Dien',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan2.jpg', // Ubah sesuai dengan path gambar nanas
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Ir Soekarno.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan4.jpg', // Ubah sesuai dengan path gambar nanas
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Mohammad Hatta.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan6.jpg', // Ubah sesuai dengan path gambar nanas
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Bung Tomo.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan8.jpg', // Ubah sesuai dengan path gambar jeruk
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Ki Hajar Dewantara.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan10.jpg', // Ubah sesuai dengan path gambar jeruk
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Kapten Pattimura.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotPahlawan6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pahlawan12.jpg', // Ubah sesuai dengan path gambar jeruk
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Pahlawan Cut Nyak Dien.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
