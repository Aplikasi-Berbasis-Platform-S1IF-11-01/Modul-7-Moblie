import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ProfilDeveloperPage - StatelessWidget untuk menampilkan profil developer
class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.code_rounded, color: Color(0xFFD7C7A1)),
            const SizedBox(width: 8),
            Text('Profil Developer',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Avatar / Profile Picture
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF2F8F6F), Color(0xFFD7C7A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2F8F6F).withValues(alpha: 0.4),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xFF145A43),
                child: Text(
                  'DR',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD7C7A1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Nama Developer
            Text(
              'Deshan Rafif Alfarisi',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            // Badge Mahasiswa
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2F8F6F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Mobile App Developer',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Detail Info Cards
            _buildInfoCard(
              icon: Icons.badge_rounded,
              title: 'NIM',
              value: '2311102326',
              color: const Color(0xFF2F8F6F),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.class_rounded,
              title: 'Kelas',
              value: 'S1-IF-11-01',
              color: const Color(0xFF145A43),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.school_rounded,
              title: 'Program Studi',
              value: 'S1 - Informatika',
              color: const Color(0xFF2F8F6F),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.book_rounded,
              title: 'Mata Kuliah',
              value: 'Aplikasi & Basis Data Perancangan',
              color: const Color(0xFF145A43),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.widgets_rounded,
              title: 'Modul',
              value: 'Modul 7 - Flutter',
              color: const Color(0xFF2F8F6F),
            ),
            const SizedBox(height: 32),

            // Tech Stack
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF145A43).withValues(alpha: 0.6),
                    const Color(0xFF2F8F6F).withValues(alpha: 0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF2F8F6F).withValues(alpha: 0.4),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.build_rounded,
                          color: Color(0xFFD7C7A1), size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'Tech Stack',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFD7C7A1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildTechChip('Flutter'),
                      _buildTechChip('Dart'),
                      _buildTechChip('Google Fonts'),
                      _buildTechChip('Material 3'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Copyright
            Text(
              '© 2025 Deshan Rafif Alfarisi',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white38,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Widget untuk info card
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFD7C7A1), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFFD7C7A1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk tech chip
  Widget _buildTechChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2F8F6F).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2F8F6F).withValues(alpha: 0.6),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
