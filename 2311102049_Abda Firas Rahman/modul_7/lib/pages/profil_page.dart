import 'package:flutter/material.dart';

class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("Profil"), backgroundColor: Colors.transparent),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.amber,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=Abda+Firas&background=1A237E&color=fff'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Abda Firas Rahman",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                  ),
                  const Text(
                    "2311102049",
                    style: TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 2),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Informatics Student",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Kembali"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}