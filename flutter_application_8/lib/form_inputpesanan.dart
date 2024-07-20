import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormInputPesanan extends StatefulWidget {
  final Function onDataUpdated; // Tambahkan parameter callback
  FormInputPesanan(this.onDataUpdated); // Simpan callback di konstruktor

  @override
  _FormInputPesananState createState() => _FormInputPesananState();
}

class _FormInputPesananState extends State<FormInputPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _jenisSepatuController = TextEditingController();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noTelefonController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> submitData() async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.post(
        Uri.parse(uri),
        body: {
          'jenis_sepatu': _jenisSepatuController.text,
          'nama': _namaController.text,
          'alamat': _alamatController.text,
          'no_telefon': _noTelefonController.text,
          'email': _emailController.text,
        },
      );
      if (respon.statusCode == 200) {
        print('Data berhasil disimpan');
        widget.onDataUpdated(); // Panggil callback setelah data diperbarui
        Navigator.pop(context);
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      print('Failed to submit data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Input Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _jenisSepatuController,
                decoration: InputDecoration(labelText: 'Jenis Sepatu'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harap masukkan jenis sepatu';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harap masukkan nama';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harap masukkan alamat';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noTelefonController,
                decoration: InputDecoration(labelText: 'No. Telefon'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harap masukkan nomor telefon';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harap masukkan email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitData();
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
