import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar lingkaran (Bonus Desain)
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.amber[700],
                child: const Icon(
                  Icons.account_circle,
                  size: 90,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              
              // Container Card untuk info Developer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Text(
                      'Nisrina Amalia Iffatunnisa',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Informatics Engineering Student',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Divider(height: 30, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outline, size: 18, color: Colors.amber),
                        SizedBox(width: 8),
                        Text('developer@student.com'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Navigator.pop untuk kembali ke Home
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home),
                label: const Text('Kembali ke Utama'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}