import 'package:flutter/material.dart';
import 'form_page.dart';
import 'profil_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A237E), Color(0xFF3F51B5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_stories, size: 70, color: Colors.amber),
                SizedBox(height: 10),
                Text(
                  "Data Mahasiswa",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // Menu Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                _buildMenuButton(
                  context, 
                  label: "Tambah Data", 
                  icon: Icons.add_moderator,
                  page: const FormMahasiswaPage(),
                  isPrimary: true
                ),
                const SizedBox(height: 20),
                _buildMenuButton(
                  context, 
                  label: "Developer", 
                  icon: Icons.code,
                  page: const ProfilDeveloperPage(),
                  isPrimary: false
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, {required String label, required IconData icon, required Widget page, required bool isPrimary}) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        icon: Icon(icon, color: isPrimary ? Colors.white : Colors.indigo),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? const Color(0xFF1A237E) : Colors.white,
          foregroundColor: isPrimary ? Colors.white : Colors.indigo,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
        ),
      ),
    );
  }
}