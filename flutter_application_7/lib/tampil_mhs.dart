import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form_inputmhs.dart'; // Pastikan file ini ada di direktori yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TampilDataMhs(),
    );
  }
}

class TampilDataMhs extends StatefulWidget {
  @override
  State<TampilDataMhs> createState() => _TampilDataMhsState();
}

class _TampilDataMhsState extends State<TampilDataMhs> {
  List mhsdata = [];

  Future<void> bacaData() async {
    String uri = "http://localhost/tugasflutter/koneksi.php";
    try {
      final respon = await http.get(Uri.parse(uri));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          mhsdata = data;
        });
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    bacaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Data Mahasiswa'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: mhsdata.length,
                  itemBuilder: (context, index) {
                    final mhs = mhsdata[index];
                    final nim = mhs['nim'] ?? 'N/A';
                    final nama = mhs['nama'] ?? 'N/A';
                    final prodi = mhs['prodi'] ?? 'N/A';

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(nim[0]),
                          backgroundColor: Colors.blueAccent,
                        ),
                        title: Text(
                          '$nim -- $nama',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        subtitle: Text(
                          prodi,
                          style: TextStyle(
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormEntryMhs(),
                  ),
                );
                if (result == true) {
                  bacaData();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text('Input Data'),
            ),
          ],
        ),
      ),
    );
  }
}
