import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form_inputkamar.dart'; // Make sure this file is in the correct directory

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
      home: TampilDataKamar(),
    );
  }
}

// Define the TampilDataKamar class
class TampilDataKamar extends StatefulWidget {
  @override
  _TampilDataKamarState createState() => _TampilDataKamarState();
}

class _TampilDataKamarState extends State<TampilDataKamar> {
  List kamardata = [];

  Future<void> bacaData() async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.get(Uri.parse(uri));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          kamardata = data;
        });
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  Future<void> hapusData(String nomor) async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.post(
        Uri.parse(uri),
        body: {
          'nomor': nomor,
          'action': 'delete',
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

  Future<void> editData(String nomor, String nama, String tipe, String harga,
      String keterangan) async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.put(
        Uri.parse(uri),
        body: {
          'nomor': nomor,
          'nama': nama,
          'tipe': tipe,
          'harga': harga,
          'keterangan': keterangan,
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
        title: Text('Listview Data Kamar'),
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
                  itemCount: kamardata.length,
                  itemBuilder: (context, index) {
                    final kamar = kamardata[index];
                    final nomor = kamar['nomor'] ?? 'N/A';
                    final nama = kamar['nama'] ?? 'N/A';
                    final tipe = kamar['tipe'] ?? 'N/A';
                    final harga = kamar['harga'] ?? 'N/A';
                    final keterangan = kamar['keterangan'] ?? 'N/A';

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(nomor[0]),
                          backgroundColor: Colors.green,
                        ),
                        title: Text(
                          '$nomor -- $nama',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tipe,
                              style: TextStyle(
                                color: Colors.green[700],
                              ),
                            ),
                            Text(
                              'Harga: $harga',
                              style: TextStyle(
                                color: Colors.green[700],
                              ),
                            ),
                            Text(
                              'Keterangan: $keterangan',
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
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showEditDialog(kamar);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Konfirmasi'),
                                      content: Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          child: Text('Tidak'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Ya'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            hapusData(nomor);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormEntryKamar(),
                  ),
                );
                if (result == true) {
                  bacaData();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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

  void _showEditDialog(Map kamar) {
    final nomorKamarController = TextEditingController(text: kamar['nomor']);
    final namaKamarController = TextEditingController(text: kamar['nama']);
    final tipeKamarController = TextEditingController(text: kamar['tipe']);
    final hargaKamarController = TextEditingController(text: kamar['harga']);
    final keteranganController =
        TextEditingController(text: kamar['keterangan']); // New field

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Data Kamar'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(
                  controller: nomorKamarController,
                  label: 'Nomor Kamar',
                  readOnly: true,
                ),
                _buildTextField(
                  controller: namaKamarController,
                  label: 'Nama Kamar',
                ),
                _buildTextField(
                  controller: tipeKamarController,
                  label: 'Tipe Kamar',
                ),
                _buildTextField(
                  controller: hargaKamarController,
                  label: 'Harga Kamar',
                ),
                _buildTextField(
                  controller: keteranganController,
                  label: 'Keterangan', // New field
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                editData(
                  nomorKamarController.text,
                  namaKamarController.text,
                  tipeKamarController.text,
                  hargaKamarController.text,
                  keteranganController.text,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool readOnly = false,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
