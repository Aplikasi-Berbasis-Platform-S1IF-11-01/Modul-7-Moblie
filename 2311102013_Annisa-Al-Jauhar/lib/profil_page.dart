import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Avatar card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF8B6F47),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF6EC).withOpacity(0.25),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFFDF6EC).withOpacity(0.5), width: 3),
                    ),
                    child: const Icon(Icons.person_rounded, size: 50, color: Color(0xFFFDF6EC)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Annisa Al Jauhar',              
                    style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFFFDF6EC),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mahasiswa Teknik Informatika',  
                    style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFFFDF6EC).withOpacity(0.85)),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF6EC).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Semester 6',                  
                      style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFFFDF6EC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Info detail
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF6EC),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE8D5BC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF4A3728)),
                  ),
                  const SizedBox(height: 14),
                  _InfoRow(icon: Icons.badge_outlined, label: 'NIM', value: '2311102014'),           
                  _InfoRow(icon: Icons.school_outlined, label: 'Universitas', value: 'Universitas Telkom '),
                  _InfoRow(icon: Icons.email_outlined, label: 'Email', value: 'jauharannisaal2gmail.com'),    
                  _InfoRow(icon: Icons.phone_outlined, label: 'Telepon', value: '088858898809', isLast: true), 
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tentang aplikasi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E6D0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFDDBF96)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, color: Color(0xFF8B6F47), size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Tentang Aplikasi',
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF4A3728)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aplikasi Data Mahasiswa dibuat menggunakan Flutter sebagai tugas mata kuliah Pemrograman Mobile. '
                    'Fitur utama meliputi input data mahasiswa, navigasi antar halaman, dan notifikasi SnackBar.',
                    style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF6B5240), height: 1.6),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['Flutter', 'Dart', 'Google Fonts', 'Material 3']
                        .map((t) => _TechChip(label: t))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home_rounded, size: 20),
                label: const Text('Kembali ke Home'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;
  const _InfoRow({required this.icon, required this.label, required this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF8B6F47)),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Text(label, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B6F47))),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF4A3728)),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(color: Color(0xFFE8D5BC), height: 1),
      ],
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF8B6F47).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF8B6F47).withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: const Color(0xFF6B5240)),
      ),
    );
  }
}