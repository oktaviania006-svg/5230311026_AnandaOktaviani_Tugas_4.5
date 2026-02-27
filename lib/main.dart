import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const WisataPage(),
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  final List<Map<String, String>> dataWisata = const [
    {
      "nama": "Pantai Kuta",
      "lokasi": "Bali",
      "rating": "4.8",
      "harga": "Rp 25.000",
      "gambar":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=60",
      "deskripsi":
          "Pantai Kuta terkenal dengan pasir putih dan sunset yang indah. Cocok untuk berselancar dan menikmati suasana liburan.",
    },
    {
      "nama": "Candi Borobudur",
      "lokasi": "Magelang",
      "rating": "4.9",
      "harga": "Rp 50.000",
      "gambar":
          "https://images.unsplash.com/photo-1596402184320-417e7178b2cd?auto=format&fit=crop&w=800&q=60",
      "deskripsi":
          "Candi Borobudur merupakan candi Buddha terbesar di dunia dan menjadi salah satu warisan budaya UNESCO.",
    },
    {
      "nama": "Gunung Bromo",
      "lokasi": "Jawa Timur",
      "rating": "4.7",
      "harga": "Rp 35.000",
      "gambar":
          "https://images.pexels.com/photos/356807/pexels-photo-356807.jpeg?auto=compress&cs=tinysrgb&w=800",
      "deskripsi":
          "Gunung Bromo terkenal dengan pemandangan sunrise terbaik di Indonesia dan hamparan lautan pasir yang luas.",
    },
    {
      "nama": "HeHa Sky View",
      "lokasi": "Yogyakarta",
      "rating": "4.6",
      "harga": "Rp 20.000",
      "gambar":
          "https://images.unsplash.com/photo-1605540436563-5bca919ae766?auto=format&fit=crop&w=800&q=60",
      "deskripsi":
          "HeHa Sky View adalah destinasi wisata kekinian di Yogyakarta yang menawarkan pemandangan kota dari ketinggian. Cocok untuk berfoto, menikmati sunset, dan bersantai bersama keluarga atau teman.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Explore Wisata"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 420, // Lebar standar Android
            ),
            child: ListView.builder(
              itemCount: dataWisata.length,
              itemBuilder: (context, index) {
                final wisata = dataWisata[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(wisata: wisata),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.network(
                            wisata["gambar"]!,
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wisata["nama"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                  Text(wisata["lokasi"]!),
                                  const Spacer(),
                                  const Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.orange,
                                  ),
                                  Text(wisata["rating"]!),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                wisata["harga"]!,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> wisata;

  const DetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(wisata["nama"]!), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    wisata["gambar"]!,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wisata["nama"]!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            Text(wisata["lokasi"]!),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange),
                            Text("Rating ${wisata["rating"]}"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          wisata["deskripsi"]!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Harga Tiket: ${wisata["harga"]}",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Tiket berhasil dipesan!"),
                              ),
                            );
                          },
                          child: const Text(
                            "Pesan Sekarang",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
