import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'profil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0720),
      appBar: AppBar(
        title: const Text('Sistem Mahasiswa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF2D1054),
                  border: Border.all(color: const Color(0xFF7C3AED), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7C3AED).withOpacity(0.35),
                      blurRadius: 32,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 56,
                  color: Color(0xFFBB86FC),
                ),
              ),
              const SizedBox(height: 56),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FormScreen()),
                    );
                  },
                  icon: const Icon(Icons.edit_document, size: 20),
                  label: const Text('Input Data Mahasiswa'),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfilScreen()),
                    );
                  },
                  icon: const Icon(Icons.manage_accounts_rounded, size: 20),
                  label: const Text('Profil Developer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A1080),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
