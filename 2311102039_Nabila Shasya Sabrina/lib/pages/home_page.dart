import 'package:flutter/material.dart';
import 'form_mahasiswa_page.dart';
import 'profil_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primaryMaroon = Color(0xFF7A1F2B);
  static const Color backgroundColor = Color(0xFFFDF6F7);
  static const Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryMaroon,
        title: const Text(
          "Data Mahasiswa",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: primaryMaroon,
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Selamat Datang!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Kelola data mahasiswa dengan mudah dan cepat melalui aplikasi ini.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "MENU UTAMA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryMaroon,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 15),

            // FORM MAHASISWA
            _menuCard(
              icon: Icons.edit_document,
              title: "Form Mahasiswa",
              subtitle: "Input dan simpan data mahasiswa",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FormMahasiswaPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            // PROFIL DEVELOPER
            _menuCard(
              icon: Icons.person,
              title: "Profil Developer",
              subtitle: "Informasi pembuat aplikasi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfilPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFFF8EDEE),
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.info_outline,
                    color: primaryMaroon,
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      "Pilih menu di atas untuk mulai mengelola data mahasiswa.",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _menuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: const Color(0xFFF8EDEE),
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.arrow_right_alt,
                color: primaryMaroon,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: primaryMaroon,
            ),
          ],
        ),
      ),
    );
  }
}