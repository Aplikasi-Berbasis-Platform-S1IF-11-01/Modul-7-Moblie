import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ProfilePage menggunakan StatelessWidget
/// karena hanya menampilkan data statis profil developer
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ── Data developer (ganti sesuai data diri) ──
  static const String _namaDeveloper = 'Rafaldo Al Maqdis';
  static const String _nimDeveloper = '2311102099';
  static const String _kelasDeveloper = 'IF-11-01';
  static const String _deskripsi =
      'Mahasiswa aktif Teknik Informatika yang memiliki minat di bidang '
      'pengembangan aplikasi mobile menggunakan Flutter. Bersemangat '
      'mempelajari teknologi terbaru dan membuat solusi digital yang '
      'bermanfaat bagi masyarakat.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar dengan tombol kembali ──
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context), // Navigator.pop kembali
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF48CAE4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // ── Hero Section dengan avatar ──
            _buildHeroSection(),

            // ── Konten profil ──
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Kartu informasi personal
                  _buildInfoCard(),

                  const SizedBox(height: 20),

                  // Kartu deskripsi
                  _buildDescriptionCard(),

                  const SizedBox(height: 20),

                  // Kartu skills
                  _buildSkillsCard(),

                  const SizedBox(height: 32),

                  // Tombol kembali
                  _buildBackButton(context),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Widget: Bagian hero dengan avatar dan nama ──
  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF48CAE4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          // ── Placeholder foto profil ──
          Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                // Mengganti Icon dengan ClipOval + Image.asset
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profileweb.jpg', // Pastikan ekstensinya .jpg ya!
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

          const SizedBox(height: 16),

          // Nama developer
          Text(
            _namaDeveloper,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          // Badge kelas & NIM
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBadge(Icons.class_rounded, _kelasDeveloper),
              const SizedBox(width: 10),
              _buildBadge(Icons.badge_rounded, _nimDeveloper),
            ],
          ),
        ],
      ),
    );
  }

  // ── Widget: Badge kecil di hero section ──
  Widget _buildBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu informasi personal ──
  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFECEAFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.info_outline_rounded,
                    color: Color(0xFF6C63FF), size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                'Informasi Personal',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF3D3773),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),
          const Divider(color: Color(0xFFEEECFF), thickness: 1.5),
          const SizedBox(height: 14),

          // Baris data
          _buildInfoRow(Icons.person_rounded, 'Nama Lengkap', _namaDeveloper),
          const SizedBox(height: 14),
          _buildInfoRow(Icons.badge_rounded, 'Nomor Induk Mahasiswa', _nimDeveloper),
          const SizedBox(height: 14),
          _buildInfoRow(Icons.class_rounded, 'Kelas', _kelasDeveloper),
          const SizedBox(height: 14),
          _buildInfoRow(Icons.school_rounded, 'Program Studi', 'Teknik Informatika'),
        ],
      ),
    );
  }

  // ── Widget: Satu baris informasi di kartu ──
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFECEAFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF6C63FF), size: 18),
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
                  color: const Color(0xFF9E99C8),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF3D3773),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Widget: Kartu deskripsi singkat ──
  Widget _buildDescriptionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFECEAFF), Color(0xFFE0F7FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFDDD8FF), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('✏️', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                'Tentang Saya',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF3D3773),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _deskripsi,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: const Color(0xFF5A5490),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu skills / teknologi ──
  Widget _buildSkillsCard() {
    const skills = [
      ('Flutter', '💙'),
      ('Dart', '🎯'),
      ('Firebase', '🔥'),
      ('Git', '🌿'),
      ('UI/UX', '🎨'),
      ('REST API', '🔗'),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('⚡', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                'Teknologi & Skills',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF3D3773),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Grid skill chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map((skill) => _buildSkillChip(skill.$1, skill.$2))
                .toList(),
          ),
        ],
      ),
    );
  }

  // ── Widget: Chip skill individual ──
  Widget _buildSkillChip(String label, String emoji) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFECEAFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDD8FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6C63FF),
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Tombol kembali ──
  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context), // Navigator.pop kembali
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_rounded, size: 20),
            const SizedBox(width: 8),
            Text(
              'Kembali ke Beranda',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
