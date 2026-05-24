import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilDeveloperScreen extends StatelessWidget {
  const ProfilDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
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
            // ── Profile Card ──────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1565C0),
                    Color(0xFF0288D1),
                    Color(0xFF00ACC1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1565C0).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nama Developer',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'NIM: 123456789',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Teknik Informatika – IF-3A',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Info Detail ───────────────────────────────────────
            _SectionCard(
              title: 'Informasi Akademik',
              icon: Icons.school_rounded,
              children: [
                _InfoTile(
                  icon: Icons.account_balance_rounded,
                  label: 'Universitas',
                  value: 'Universitas Contoh Indonesia',
                ),
                _InfoTile(
                  icon: Icons.business_rounded,
                  label: 'Fakultas',
                  value: 'Fakultas Ilmu Komputer',
                ),
                _InfoTile(
                  icon: Icons.computer_rounded,
                  label: 'Program Studi',
                  value: 'S1 Teknik Informatika',
                ),
                _InfoTile(
                  icon: Icons.calendar_month_rounded,
                  label: 'Angkatan',
                  value: '2022',
                ),
                _InfoTile(
                  icon: Icons.timeline_rounded,
                  label: 'Semester',
                  value: '6 (Enam)',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ── Tentang Aplikasi ──────────────────────────────────
            _SectionCard(
              title: 'Tentang Aplikasi',
              icon: Icons.info_rounded,
              children: [
                _InfoTile(
                  icon: Icons.app_shortcut_rounded,
                  label: 'Nama App',
                  value: 'Data Mahasiswa App',
                ),
                _InfoTile(
                  icon: Icons.layers_rounded,
                  label: 'Modul',
                  value: 'Modul 7 – Flutter',
                ),
                _InfoTile(
                  icon: Icons.code_rounded,
                  label: 'Framework',
                  value: 'Flutter & Dart',
                ),
                _InfoTile(
                  icon: Icons.star_rounded,
                  label: 'Versi',
                  value: '1.0.0',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ── Fitur ─────────────────────────────────────────────
            _SectionCard(
              title: 'Fitur Aplikasi',
              icon: Icons.featured_play_list_rounded,
              children: [
                _FeatureTile(
                  icon: Icons.widgets_rounded,
                  text: 'StatefulWidget & StatelessWidget',
                ),
                _FeatureTile(
                  icon: Icons.swap_horiz_rounded,
                  text: 'Navigator.push & Navigator.pop',
                ),
                _FeatureTile(
                  icon: Icons.font_download_rounded,
                  text: 'Google Fonts (Poppins)',
                ),
                _FeatureTile(
                  icon: Icons.check_box_rounded,
                  text: 'Form Validation',
                ),
                _FeatureTile(
                  icon: Icons.notifications_rounded,
                  text: 'SnackBar Notifikasi',
                ),
                _FeatureTile(
                  icon: Icons.palette_rounded,
                  text: 'Tema Warna Menarik',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── Back Button ───────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Kembali ke Beranda'),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ─── Reusable Widgets ────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1565C0), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A237E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0).withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF1565C0)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A237E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0).withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: const Color(0xFF1565C0)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: const Color(0xFF1A237E),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            size: 16,
            color: Color(0xFF1B5E20),
          ),
        ],
      ),
    );
  }
}
