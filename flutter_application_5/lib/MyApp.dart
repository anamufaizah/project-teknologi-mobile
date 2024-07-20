import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MenuMakanan(),
  ));
}

class MenuMakanan extends StatefulWidget {
  @override
  _MenuMakananState createState() => _MenuMakananState();
}

class _MenuMakananState extends State<MenuMakanan> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 175, 175),
        title: Text('Menu Makanan Gilang Muhammad (A12.2021.06574)'),
      ),
      body: Column(
        children: [
          Text(
            'Halo Selamat Datang! silahkan pilih menu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cafe.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          _scrollOffset -= MediaQuery.of(context).size.width;
                          _scrollController.animateTo(
                            _scrollOffset,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildMenuItem(
                                context,
                                'Pisang Goreng Madu',
                                25000,
                                'images/makanan1.jpg',
                                'Pisang Goreng manis yang terdiri dari pisang keju dan madu yang digoreng garing.',
                              ),
                              buildMenuItem(
                                context,
                                'Kentang Goreng',
                                15000,
                                'images/makanan2.jpg',
                                'Kentang goreng renyah yang dibalut mayonaise dan akan mendapatkan sauce yang meleleh.',
                              ),
                              buildMenuItem(
                                context,
                                'Pancake Ice Cream',
                                35000,
                                'images/makanan3.jpg',
                                'Pancake manis dilapisi madu yang manis, kemudian diberi ice cream dingin vanilla.',
                              ),
                              buildMenuItem(
                                context,
                                'Croffle Ice Cream',
                                28000,
                                'images/makanan4.jpg',
                                'Croffle coklat renyah dilapisi madu kemudia diberi ice cream vanilla dingin.',
                              ),
                              buildMenuItem(
                                context,
                                'Chips and Chese',
                                19000,
                                'images/makanan5.jpg',
                                'Chips renyah diberi parutan keju yang meleleh, memeberi kesan renyah dan lumer.',
                              ),
                              buildMenuItem(
                                context,
                                'Mix Platter',
                                35000,
                                'images/makanan6.jpg',
                                'Kentang Goreng yang gurih disajikan bersama sosis dan nugget.',
                              ),
                              buildMenuItem(
                                context,
                                'Spaghetti Meatball',
                                45000,
                                'images/makanan7.jpeg',
                                'Spaghetti yang lembut dan creamy dilapisi dengan topping bakso.',
                              ),
                              buildMenuItem(
                                context,
                                'Pizza',
                                50000,
                                'images/makanan8.jpeg',
                                'Pizza khas Italia yang dihiasi berbagai macam toping sosis, daging.',
                              ),
                              buildMenuItem(
                                context,
                                'Chicken Wings',
                                30000,
                                'images/makanan9.jpeg',
                                'Potongan sayap ayam yang kecil yang manis dan dihiasi sauce mayonaise.',
                              ),
                              buildMenuItem(
                                context,
                                'Chicken Salted Egg',
                                27000,
                                'images/makanan10.jpeg',
                                'Ayam goreng tepung yang dibaluri dengan bumbu salted egg yang asin dan gurih.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          _scrollOffset += MediaQuery.of(context).size.width;
                          _scrollController.animateTo(
                            _scrollOffset,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String nama, int harga,
      String imagePath, String deskripsi) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMenuMakanan(
              nama: nama,
              harga: harga,
              imagePath: imagePath,
              deskripsi: deskripsi,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 220, // Ubah ukuran width card di sini
              height: 220, // Ubah ukuran height card di sini
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Rp $harga',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMenuMakanan(
                      nama: nama,
                      harga: harga,
                      imagePath: imagePath,
                      deskripsi: deskripsi,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Beli'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailMenuMakanan extends StatefulWidget {
  final String nama;
  final int harga;
  final String imagePath;
  final String deskripsi;

  const DetailMenuMakanan({
    Key? key,
    required this.nama,
    required this.harga,
    required this.imagePath,
    required this.deskripsi,
  }) : super(key: key);

  @override
  _DetailMenuMakananState createState() => _DetailMenuMakananState();
}

class _DetailMenuMakananState extends State<DetailMenuMakanan> {
  int jumlahPesanan = 1;
  late int totalHarga;

  @override
  void initState() {
    super.initState();
    totalHarga = widget.harga;
  }

  void hitungTotalHarga() {
    setState(() {
      totalHarga = widget.harga * jumlahPesanan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Menu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/caffe2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                widget.nama,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Harga: Rp ${widget.harga}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.deskripsi,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (jumlahPesanan > 1) {
                          jumlahPesanan--;
                          hitungTotalHarga();
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                    label: Text('Remove'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$jumlahPesanan',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        jumlahPesanan++;
                        hitungTotalHarga();
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text('Tambah'),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Total Rp $totalHarga',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
