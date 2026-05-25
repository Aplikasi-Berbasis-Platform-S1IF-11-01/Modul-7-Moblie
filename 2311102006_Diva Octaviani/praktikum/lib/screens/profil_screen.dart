import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A0A2E), Color(0xFF2D1054)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7C3AED), Color(0xFF9B59B6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                          color: const Color(0xFFBB86FC), width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C3AED).withOpacity(0.5),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.person_rounded,
                        size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Diva Octaviani',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xFF9B59B6), width: 1),
                    ),
                    child: Text(
                      'Mahasiswa',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: const Color(0xFFBB86FC),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _InfoTile(
                      icon: Icons.person_rounded,
                      label: 'Nama',
                      value: 'Diva Octaviani'),
                  _InfoTile(
                      icon: Icons.badge_rounded,
                      label: 'NIM',
                      value: '2311102006'),
                  _InfoTile(
                      icon: Icons.class_rounded,
                      label: 'Kelas',
                      value: 'PS1IF-11-REG01'),
                  _InfoTile(
                      icon: Icons.school_rounded,
                      label: 'Program Studi',
                      value: 'Teknik Informatika'),
                  _InfoTile(
                      icon: Icons.business_rounded,
                      label: 'Universitas',
                      value: 'Universitas Telkom Purwokerto'),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, size: 18),
                      label: const Text('Kembali'),
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
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E0D3A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3D1A6E), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF9B59B6), size: 20),
          const SizedBox(width: 14),
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 13, color: Colors.white54),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
