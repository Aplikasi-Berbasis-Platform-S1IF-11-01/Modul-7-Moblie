import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ProfilePage — StatelessWidget
/// Menampilkan profil developer Azaria Nanda Putri
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ── Data developer ──
  static const String _nama = 'Azaria Nanda Putri';
  static const String _nim = '2311102099';
  static const String _kelas = 'IF-11-01';
  static const String _prodi = 'Informatika';
  static const String _deskripsi =
      'Mahasiswi aktif Program Studi Informatika yang penuh semangat '
      'dan kreativitas. Memiliki ketertarikan di bidang pengembangan '
      'aplikasi mobile, desain UI/UX, dan teknologi digital. Percaya '
      'bahwa kode yang baik itu seperti puisi — indah dan bermakna. 🌸';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE8739A), Color(0xFFF4A7C3)],
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
            // ── Hero Section ──
            _buildHeroSection(),

            // ── Konten ──
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  _buildInfoCard(),
                  const SizedBox(height: 16),
                  _buildDescCard(),
                  const SizedBox(height: 16),
                  _buildSkillsCard(),
                  const SizedBox(height: 16),
                  _buildHobbiesCard(),
                  const SizedBox(height: 28),
                  _buildBackButton(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Widget: Hero section dengan avatar bunga ──
  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 38),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE8739A), Color(0xFFF4A7C3), Color(0xFFFFD6E7)],
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
          // Stack avatar + dekorasi bunga
          Stack(
            alignment: Alignment.center,
            children: [
              // Lingkaran halo luar
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
              ),
              // Avatar utama
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text('🌸', style: TextStyle(fontSize: 52)),
                ),
              ),
              // Dekorasi bunga kecil pojok
              Positioned(
                top: 0,
                right: 80,
                child: Text('✿', style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.6))),
              ),
              Positioned(
                bottom: 0,
                left: 80,
                child: Text('✾', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5))),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Nama
          Text(
            _nama,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          Text(
            'Flutter Developer 🎀',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 12),

          // Badge NIM & Kelas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeroBadge('🪪', _nim),
              const SizedBox(width: 10),
              _buildHeroBadge('🏫', _kelas),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBadge(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 11,
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
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardTitle('💌', 'Informasi Personal'),
          const SizedBox(height: 14),
          Divider(color: const Color(0xFFFFD6E7), thickness: 1.5),
          const SizedBox(height: 12),
          _buildInfoRow('👩', 'Nama Lengkap', _nama),
          const SizedBox(height: 12),
          _buildInfoRow('🪪', 'NIM', _nim),
          const SizedBox(height: 12),
          _buildInfoRow('🏫', 'Kelas', _kelas),
          const SizedBox(height: 12),
          _buildInfoRow('🎓', 'Program Studi', _prodi),
        ],
      ),
    );
  }

  // ── Widget: Kartu deskripsi ──
  Widget _buildDescCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFECF3), Color(0xFFFFF8FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFFFCCDE), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardTitle('📖', 'Tentang Saya'),
          const SizedBox(height: 12),
          Text(
            _deskripsi,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF8B5A6E),
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu skills ──
  Widget _buildSkillsCard() {
    const skills = [
      ('Flutter', '💙'),
      ('Dart', '🎯'),
      ('UI/UX', '🎨'),
      ('Figma', '🖌️'),
      ('Firebase', '🔥'),
      ('Git', '🌿'),
    ];

    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardTitle('⚡', 'Skills & Teknologi'),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => _buildChip(s.$2, s.$1)).toList(),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu hobi ──
  Widget _buildHobbiesCard() {
    const hobbies = [
      ('🎵', 'Musik'),
      ('📚', 'Membaca'),
      ('✈️', 'Traveling'),
      ('☕', 'Ngopi'),
      ('🎨', 'Menggambar'),
    ];

    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardTitle('🌺', 'Hobi & Minat'),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: hobbies
                .map(
                  (h) => Column(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFECF3),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: const Color(0xFFFFCCDE), width: 1),
                        ),
                        child: Center(
                          child: Text(h.$1,
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        h.$2,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC49BAA),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // ── Helper: Wrapper kartu putih ──
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8739A).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: const Color(0xFFFFD6E7), width: 1),
      ),
      child: child,
    );
  }

  // ── Helper: Judul kartu ──
  Widget _buildCardTitle(String emoji, String title) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF8B4A62),
          ),
        ),
      ],
    );
  }

  // ── Helper: Satu baris info ──
  Widget _buildInfoRow(String emoji, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFFFECF3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: const Color(0xFFC49BAA),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF8B4A62),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Helper: Skill chip ──
  Widget _buildChip(String emoji, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECF3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFCCDE), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE8739A),
            ),
          ),
        ],
      ),
    );
  }

  // ── Tombol kembali ──
  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🏠', style: TextStyle(fontSize: 18)),
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
