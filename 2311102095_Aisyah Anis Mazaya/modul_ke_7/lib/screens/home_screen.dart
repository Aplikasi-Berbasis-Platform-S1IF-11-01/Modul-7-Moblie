import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'profil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE4EC),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(Icons.stars_rounded, size: 55, color: Color(0xFFF06292)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "Selamat datang! Silakan pilih menu di bawah.",
                      style: TextStyle(fontSize: 15, color: Color(0xFF880E4F), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Menu buttons
            _buildNavButton(
              context, 
              title: "Tambah Mahasiswa", 
              icon: Icons.note_add_outlined, 
              targetScreen: const FormScreen()
            ),
            const SizedBox(height: 15),
            _buildNavButton(
              context, 
              title: "Biodata Developer", 
              icon: Icons.person_pin_outlined, 
              targetScreen: const ProfilScreen()
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, {required String title, required IconData icon, required Widget targetScreen}) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => targetScreen)),
        icon: Icon(icon),
        label: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFF06292),
          elevation: 0,
          side: const BorderSide(color: Color(0xFFF8BBD0), width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}