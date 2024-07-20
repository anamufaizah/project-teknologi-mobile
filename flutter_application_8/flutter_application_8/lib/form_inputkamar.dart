import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormEntryKamar extends StatefulWidget {
  @override
  State<FormEntryKamar> createState() => _FormEntryKamarState();
}

class _FormEntryKamarState extends State<FormEntryKamar> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomorKamarController = TextEditingController();
  TextEditingController namaKamarController = TextEditingController();
  TextEditingController tipeKamarController = TextEditingController();
  TextEditingController hargaKamarController = TextEditingController();
  TextEditingController keteranganController =
      TextEditingController(); // New controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Warna latar belakang AppBar
        title: Text('Input Data Tamu'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[50]!,
              Colors.blue[200]!
            ], // Ubah warna dari hijau menjadi biru
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: nomorKamarController,
                label: 'Masukkan Nomor Tamu',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor kamar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: namaKamarController,
                label: 'Masukkan Nama Tamu',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama kamar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: tipeKamarController,
                label: 'Masukkan Tipe Tamu',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tipe kamar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: hargaKamarController,
                label: 'Harga Tamu Kamar',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga kamar tidak boleh kosong';
                  } else if (double.tryParse(value) == null) {
                    return 'Harga kamar harus berupa angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: keteranganController, // New input field
                label: 'Masukkan Keterangan',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Keterangan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    simpan_data();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red, // Warna latar belakang tombol 'SIMPAN'
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('SIMPAN'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Future<void> simpan_data() async {
    String uri = "http://localhost/tugasflutter/kon.php";
    try {
      final respon = await http.post(Uri.parse(uri), body: {
        'nomor': nomorKamarController.text,
        'nama': namaKamarController.text,
        'tipe': tipeKamarController.text,
        'harga': hargaKamarController.text,
        'keterangan': keteranganController.text, // New data field
      });
      if (respon.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Simpan Berhasil!')));
        Navigator.pop(context, true); // Navigate back to main menu
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Simpan Gagal!')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
    }
  }
}
