// lib/screens/profil_screen.dart
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 65,
              backgroundColor: Color(0xFFF8BBD0), 
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                // Widget Text untuk inisial
                child: Text(
                  "AAM",
                  style: TextStyle(
                    fontSize: 35, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF06292), 
                    letterSpacing: 2, 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Aisyah Anis Mazaya",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF880E4F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "2311102095",
              style: TextStyle(
                fontSize: 17, 
                color: Colors.pink, 
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.keyboard_return, color: Color(0xFFF06292)),
              label: const Text(
                "Kembali ke Awal", 
                style: TextStyle(color: Color(0xFFF06292)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}