import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_page.dart';
import 'profil_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.school_rounded, size: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _WelcomeBanner(),
              const SizedBox(height: 28),
              Text(
                'MENU UTAMA',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF8B6F47),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.edit_note_rounded,
                title: 'Form Mahasiswa',
                subtitle: 'Input dan simpan data mahasiswa',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FormPage()),
                ),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.person_rounded,
                title: 'Profil Developer',
                subtitle: 'Informasi pembuat aplikasi',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilPage()),
                ),
              ),
              const SizedBox(height: 28),
              _InfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF8B6F47),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF6EC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.school_rounded, color: Color(0xFFFDF6EC), size: 32),
          ),
          const SizedBox(height: 14),
          Text(
            'Selamat Datang!',
            style: GoogleFonts.poppins(
              color: const Color(0xFFFDF6EC),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Aplikasi manajemen data mahasiswa sederhana.',
            style: GoogleFonts.poppins(
              color: const Color(0xFFFDF6EC).withOpacity(0.85),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF6EC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE8D5BC)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E6D0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF8B6F47), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: const Color(0xFF4A3728),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF8B6F47)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFB8975A)),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6D0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDDBF96)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline_rounded, color: Color(0xFF8B6F47), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Pilih menu di atas untuk mulai mengelola data mahasiswa.',
              style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF6B5240), height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
