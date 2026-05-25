import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ProfilScreen adalah StatelessWidget karena tidak memerlukan
/// pengelolaan state – hanya menampilkan informasi statis.
class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
            // ── Avatar & Nama ─────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A73E8).withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar lingkaran
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 3),
                    ),
                    child: const Center(
                      child: Icon(Icons.person_rounded,
                          size: 52, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Raihan Ramadhan',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Flutter Developer',
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
            const SizedBox(height: 28),

            // ── Info cards ────────────────────────────────────────────────
            _InfoSection(
              title: 'Informasi Akademik',
              icon: Icons.school_rounded,
              items: const [
                _InfoItem(
                  icon: Icons.badge_rounded,
                  label: 'NIM',
                  value: '2311102040',
                ),
                _InfoItem(
                  icon: Icons.class_rounded,
                  label: 'Kelas',
                  value: 'IF - 11 -01',
                ),
                _InfoItem(
                  icon: Icons.account_balance_rounded,
                  label: 'Program Studi',
                  value: 'Teknik Informatika',
                ),
                _InfoItem(
                  icon: Icons.location_city_rounded,
                  label: 'Universitas',
                  value: 'Telkom University Purwokerto',
                ),
              ],
            ),
            const SizedBox(height: 16),

            _InfoSection(
              title: 'Tentang Aplikasi',
              icon: Icons.info_rounded,
              items: const [
                _InfoItem(
                  icon: Icons.code_rounded,
                  label: 'Framework',
                  value: 'Flutter 3.x',
                ),
                _InfoItem(
                  icon: Icons.language_rounded,
                  label: 'Bahasa',
                  value: 'Dart',
                ),
                _InfoItem(
                  icon: Icons.assignment_rounded,
                  label: 'Mata Kuliah',
                  value: 'Pemrograman Mobile',
                ),
                _InfoItem(
                  icon: Icons.calendar_today_rounded,
                  label: 'Semester',
                  value: 'Genap 2024/2025',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Skill chips ────────────────────────────────────────────────
            Container(
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
                      const Icon(Icons.star_rounded,
                          color: Color(0xFF1A73E8), size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'Teknologi yang Digunakan',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _SkillChip('Flutter', Color(0xFF1A73E8)),
                      _SkillChip('Dart', Color(0xFF0D47A1)),
                      _SkillChip('Google Fonts', Color(0xFF00C2A8)),
                      _SkillChip('StatefulWidget', Color(0xFF9C27B0)),
                      _SkillChip('Navigator', Color(0xFFFF6B35)),
                      _SkillChip('Material 3', Color(0xFF388E3C)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Tombol kembali ─────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Kembali ke Beranda'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Reusable InfoSection (StatelessWidget) ────────────────────────────────────
class _InfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_InfoItem> items;

  const _InfoSection({
    required this.title,
    required this.icon,
    required this.items,
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
              offset: const Offset(0, 4),  // ← Offset, bukan EdgeInsets
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1A73E8), size: 22),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: item,
              )),
        ],
      ),
    );
  }
}

// ── InfoItem ──────────────────────────────────────────────────────────────────
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF1A73E8).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF1A73E8)),
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
                  color: const Color(0xFF6B6B8A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── SkillChip ─────────────────────────────────────────────────────────────────
class _SkillChip extends StatelessWidget {
  final String label;
  final Color color;

  const _SkillChip(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}