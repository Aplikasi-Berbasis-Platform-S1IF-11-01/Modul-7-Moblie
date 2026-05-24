// lib/pages/profil_developer_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

/// Halaman Profil Developer — StatelessWidget
/// Tidak ada state yang perlu dikelola
class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context), // Navigator.pop
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Hero Section ─────────────────────────────────
            _buildHeroSection(),

            // ── Informasi Developer ───────────────────────────
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: 'Informasi Developer',
                    icon: Icons.info_outline,
                  ),
                  const SizedBox(height: 16),
                  InfoCard(
                    icon: Icons.person,
                    label: 'Nama',
                    value: 'Rizal Dwi Anggoro',
                    iconColor: AppTheme.primaryColor,
                  ),
                  InfoCard(
                    icon: Icons.badge,
                    label: 'NIM',
                    value: '2311102034',
                    iconColor: const Color(0xFF7B1FA2),
                  ),
                  InfoCard(
                    icon: Icons.class_,
                    label: 'Kelas',
                    value: 'IF-11-01',
                    iconColor: const Color(0xFF00838F),
                  ),
                  InfoCard(
                    icon: Icons.school,
                    label: 'Program Studi',
                    value: 'Teknik Informatika',
                    iconColor: const Color(0xFFE65100),
                  ),
                  InfoCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'rizaldwianggoro@student.telkomuniversity.ac.id',
                    iconColor: const Color(0xFF2E7D32),
                  ),

                  const SizedBox(height: 24),

                  // ── Teknologi yang Digunakan ────────────────
                  SectionHeader(
                    title: 'Teknologi',
                    icon: Icons.code,
                  ),
                  const SizedBox(height: 16),
                  _buildTeknologiGrid(),

                  const SizedBox(height: 24),

                  // ── Tentang Aplikasi ─────────────────────────
                  SectionHeader(
                    title: 'Tentang Aplikasi',
                    icon: Icons.apps,
                  ),
                  const SizedBox(height: 16),
                  _buildAboutCard(),

                  const SizedBox(height: 30),

                  // ── Tombol Kembali ───────────────────────────
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.home_outlined),
                      label: const Text('Kembali ke Beranda'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Widget: Hero Section ────────────────────────────────────
  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 52,
              backgroundColor: AppTheme.secondaryColor.withOpacity(0.3),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Rizal Dwi Anggoro',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Flutter Developer · Mahasiswa Aktif',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),
          // Badge
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '🎓 Teknik Informatika',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Grid Teknologi ──────────────────────────────────
  Widget _buildTeknologiGrid() {
    final tekList = [
      {'icon': Icons.flutter_dash, 'label': 'Flutter', 'color': 0xFF027DFD},
      {'icon': Icons.code,         'label': 'Dart',    'color': 0xFF00B4AB},
      {'icon': Icons.palette,      'label': 'Material', 'color': 0xFF7B1FA2},
      {'icon': Icons.font_download,'label': 'Google Fonts', 'color': 0xFFE65100},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.4,
      ),
      itemCount: tekList.length,
      itemBuilder: (_, i) {
        final item  = tekList[i];
        final color = Color(item['color'] as int);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(item['icon'] as IconData, color: color, size: 22),
              const SizedBox(width: 8),
              Text(
                item['label'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Widget: About Card ──────────────────────────────────────
  Widget _buildAboutCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.15)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _aboutRow(Icons.verified, 'Nama Aplikasi', 'Data Mahasiswa App'),
          const Divider(height: 16),
          _aboutRow(Icons.build_circle_outlined, 'Versi', '1.0.0'),
          const Divider(height: 16),
          _aboutRow(Icons.calendar_today_outlined, 'Tahun', '2024'),
          const Divider(height: 16),
          _aboutRow(Icons.description_outlined, 'Deskripsi',
              'Aplikasi manajemen data mahasiswa.'),
        ],
      ),
    );
  }

  Widget _aboutRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppTheme.primaryColor),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppTheme.textSecondary,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}