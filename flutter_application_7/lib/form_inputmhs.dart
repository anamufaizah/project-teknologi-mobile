import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormEntryMhs extends StatefulWidget {
  @override
  State<FormEntryMhs> createState() => _FormEntryMhsState();
}

class _FormEntryMhsState extends State<FormEntryMhs> {
  final formKey = GlobalKey<FormState>();
  TextEditingController xnim = TextEditingController();
  TextEditingController xnama = TextEditingController();
  TextEditingController xprodi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('INPUT DATA MAHASISWA'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.amber[100],
              child: TextFormField(
                controller: xnim,
                decoration: InputDecoration(
                    label: Text('Masukkan NIM'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.amber[100],
              child: TextFormField(
                controller: xnama,
                decoration: InputDecoration(
                    label: Text('Masukkan Nama'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.amber[100],
              child: TextFormField(
                controller: xprodi,
                decoration: InputDecoration(
                    label: Text('Masukkan Jurusan'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jurusan tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  simpan_data();
                }
              },
              child: Text('SIMPAN'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> simpan_data() async {
    String uri = "http://localhost/tugasflutter/koneksi.php";
    try {
      final respon = await http.post(Uri.parse(uri), body: {
        'xnim': xnim.text,
        'xnama': xnama.text,
        'xprodi': xprodi.text,
      });
      if (respon.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Simpan Berhasil!')));
        Navigator.pop(
            context, true); // Navigate back to main menu and return true
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
