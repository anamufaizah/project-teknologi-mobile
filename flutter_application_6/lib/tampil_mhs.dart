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
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber[100],
              child: ListView.builder(
                itemCount: mhsdata.length,
                itemBuilder: (context, index) {
                  final mhs = mhsdata[index];
                  final nim = mhs['nim'] ?? 'N/A';
                  final nama = mhs['nama'] ?? 'N/A';
                  final prodi = mhs['prodi'] ?? 'N/A';

                  return ListTile(
                    title: Text('$nim -- $nama'),
                    subtitle: Text(prodi),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormEntryMhs(),
                ),
              );
            },
            child: Text(
              'Input',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
