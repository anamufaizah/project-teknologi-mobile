import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form_inputpesanan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TampilDataPesanan(),
    );
  }
}

class TampilDataPesanan extends StatefulWidget {
  @override
  _TampilDataPesananState createState() => _TampilDataPesananState();
}

class _TampilDataPesananState extends State<TampilDataPesanan> {
  List pesanandata = [];

  Future<void> bacaData() async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.get(Uri.parse(uri));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          pesanandata = data;
        });
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  Future<void> hapusData(String jenis_sepatu) async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.delete(
        Uri.parse(uri),
        body: jsonEncode({
          'jenis_sepatu': jenis_sepatu,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (respon.statusCode == 200) {
        bacaData();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data berhasil dihapus')));
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to delete data: $e');
    }
  }

  Future<void> editData(int id, String jenis_sepatu, String nama, String alamat,
      String no_telefon, String email) async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.put(
        Uri.parse(uri),
        body: jsonEncode({
          'id': id.toString(),
          'jenis_sepatu': jenis_sepatu,
          'nama': nama,
          'alamat': alamat,
          'no_telefon': no_telefon,
          'email': email,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (respon.statusCode == 200) {
        bacaData();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data berhasil diperbarui')));
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to update data: $e');
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
        title: Text('Listview Data Pesanan'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[50]!, Colors.green[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: pesanandata.length,
                  itemBuilder: (context, index) {
                    final pesanan = pesanandata[index];
                    final id = pesanan['id'] ?? 'N/A';
                    final jenis_sepatu = pesanan['jenis_sepatu'] ?? 'N/A';
                    final nama = pesanan['nama'] ?? 'N/A';
                    final alamat = pesanan['alamat'] ?? 'N/A';
                    final no_telefon = pesanan['no_telefon'] ?? 'N/A';
                    final email = pesanan['email'] ?? 'N/A';

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          '$jenis_sepatu -- $nama',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alamat,
                              style: TextStyle(
                                color: Colors.green[700],
                              ),
                            ),
                            Text(
                              'Telefon: $no_telefon',
                              style: TextStyle(
                                color: Colors.green[700],
                              ),
                            ),
                            Text(
                              'Email: $email',
                              style: TextStyle(
                                color: Colors.green[700],
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                              onPressed: () {
                                // Menampilkan form edit
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    final jenisSepatuController =
                                        TextEditingController(
                                            text: jenis_sepatu);
                                    final namaController =
                                        TextEditingController(text: nama);
                                    final alamatController =
                                        TextEditingController(text: alamat);
                                    final noTelefonController =
                                        TextEditingController(text: no_telefon);
                                    final emailController =
                                        TextEditingController(text: email);

                                    return AlertDialog(
                                      title: Text('Edit Data'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: jenisSepatuController,
                                              decoration: InputDecoration(
                                                labelText: 'Jenis Sepatu',
                                              ),
                                            ),
                                            TextField(
                                              controller: namaController,
                                              decoration: InputDecoration(
                                                labelText: 'Nama',
                                              ),
                                            ),
                                            TextField(
                                              controller: alamatController,
                                              decoration: InputDecoration(
                                                labelText: 'Alamat',
                                              ),
                                            ),
                                            TextField(
                                              controller: noTelefonController,
                                              decoration: InputDecoration(
                                                labelText: 'No. Telefon',
                                              ),
                                            ),
                                            TextField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Save'),
                                          onPressed: () {
                                            editData(
                                              id,
                                              jenisSepatuController.text,
                                              namaController.text,
                                              alamatController.text,
                                              noTelefonController.text,
                                              emailController.text,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                hapusData(id);
                              },
                            ),
                          ],
                        ),
                      ),
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
                      builder: (context) => FormInputPesanan(bacaData)),
                );
              },
              child: Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }
}
