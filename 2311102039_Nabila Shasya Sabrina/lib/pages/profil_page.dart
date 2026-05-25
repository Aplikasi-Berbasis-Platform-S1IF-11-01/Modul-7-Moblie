import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  static const Color primaryMaroon =
      Color(0xFF7A1F2B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F7),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryMaroon,
        foregroundColor: Colors.white,
        title: const Text(
          "Profil Developer",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // HEADER PROFILE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: primaryMaroon,
                borderRadius:
                    BorderRadius.circular(24),
              ),

              child: const Column(
                children: [

                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Colors.white24,
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Nabila Shasya Sabrina",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Mahasiswa Informatika",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // CARD INFORMASI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black12,
                    blurRadius: 10,
                    offset:
                        const Offset(0, 4),
                  ),
                ],
              ),

              child: const Column(
                children: [

                  ListTile(
                    leading: Icon(
                      Icons.badge,
                      color: primaryMaroon,
                    ),
                    title: Text("NIM"),
                    subtitle:
                        Text("2311102039"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.school,
                      color: primaryMaroon,
                    ),
                    title: Text("Program Studi"),
                    subtitle:
                        Text("S1 Informatika"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: primaryMaroon,
                    ),
                    title: Text("Email"),
                    subtitle: Text(
                      "shsyaaaaa06@gmail.com",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // CARD DESKRIPSI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(
                    0xFFF8EDEE),
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Tentang Aplikasi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Aplikasi Flutter Form Mahasiswa by Nabila Shasya Sabrina.",
                    textAlign:
                        TextAlign.justify,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.arrow_back,
                ),

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      primaryMaroon,
                  foregroundColor:
                      Colors.white,
                  padding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 15,
                  ),
                ),

                onPressed: () {
                  Navigator.pop(
                      context);
                },

                label: const Text(
                  "Kembali",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}