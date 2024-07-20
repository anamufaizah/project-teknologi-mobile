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
          backgroundColor: Colors.blue,
          title: Text(
            'Gambar Rumah Adat Nusantara',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.pink,
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DasbotRumah1()),
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
                      'images/rumah1.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Sumatera Utara',
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
                  MaterialPageRoute(builder: (context) => DasbotRumah2()),
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
                      'images/rumah2.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Riau',
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
                  MaterialPageRoute(builder: (context) => DasbotRumah3()),
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
                      'images/rumah3.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Jawa Tengah',
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
                  MaterialPageRoute(builder: (context) => DasbotRumah4()),
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
                      'images/rumah4.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Jakrata',
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
                  MaterialPageRoute(builder: (context) => DasbotRumah5()),
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
                      'images/rumah5.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Bali',
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
                  MaterialPageRoute(builder: (context) => DasbotRumah6()),
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
                      'images/rumah6.jpg',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rumah Adat Provinsi Papua',
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

class DasbotRumah1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah1a.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Provinsi Sumatera Utara.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotRumah2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah2a.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Provinsi Riau.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotRumah3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah3a.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Provinsi Jawa Tengah.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotRumah4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah4a.jpg', // Ubah sesuai dengan path gambar jeruk
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Provinsi Jakarta.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotRumah5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah5a.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Provinsi Bali.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DasbotRumah6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Adat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/rumah6a.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Ini adalah halaman detail untuk Rumah Adat Hanoi.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
