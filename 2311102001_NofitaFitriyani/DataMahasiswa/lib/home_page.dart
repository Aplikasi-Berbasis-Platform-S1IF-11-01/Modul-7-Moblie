import 'package:flutter/material.dart';

import 'form_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Mahasiswa'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFB71234).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.school,
                  size: 80,
                  color: Color(0xFFB71234),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Telkom University',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB71234),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sistem Pendataan Mahasiswa',
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black54
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB71234),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_document),
                    SizedBox(width: 12),
                    Text(
                      'Input Data Mahasiswa', 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFB71234),
                  side: const BorderSide(color: Color(0xFFB71234), width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 12),
                    Text(
                      'Profil Developer', 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
