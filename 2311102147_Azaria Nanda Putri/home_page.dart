import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_mahasiswa_page.dart';
import 'profile_page.dart';

/// HomePage — StatelessWidget, halaman utama bertema pink calm
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar pink gradient ──
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.favorite_rounded, size: 24),
              tooltip: 'Profil Developer',
              onPressed: () => _navigateToProfile(context),
            ),
          ),
        ],
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
            // ── Hero Banner ──
            _buildHeroBanner(),

            const SizedBox(height: 22),

            // ── Stat chips ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildStatRow(),
            ),

            const SizedBox(height: 26),

            // ── Menu Cards ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu Utama',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF8B4A62),
                    ),
                  ),
                  const SizedBox(height: 14),

                  _buildMenuCard(
                    context,
                    emoji: '🎀',
                    bgColor: const Color(0xFFFFECF3),
                    accentColor: const Color(0xFFE8739A),
                    title: 'Input Data Mahasiswa',
                    subtitle: 'Tambahkan data nama, NIM, dan kelas',
                    onTap: () => _navigateToForm(context),
                  ),

                  const SizedBox(height: 14),

                  _buildMenuCard(
                    context,
                    emoji: '🌸',
                    bgColor: const Color(0xFFFFF0F8),
                    accentColor: const Color(0xFFC8659A),
                    title: 'Profil Developer',
                    subtitle: 'Kenalan dengan si pembuat app',
                    onTap: () => _navigateToProfile(context),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ── Quote card bawah ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildQuoteCard(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ── Widget: Hero banner ──
  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 34),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE8739A), Color(0xFFF4A7C3), Color(0xFFFFD6E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar placeholder dengan efek bunga
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Avatar
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.6), width: 2.5),
                ),
                child: const Center(
                  child: Text('🌸', style: TextStyle(fontSize: 38)),
                ),
              ),
              const SizedBox(width: 14),
              // Dekorasi bunga kecil
              Column(
                children: const [
                  Text('✿', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  SizedBox(height: 4),
                  Text('✾', style: TextStyle(fontSize: 14, color: Colors.white54)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            'Haii, Selamat Datang! 🎀',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          Text(
            'Sistem Data\nMahasiswa',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          // Badge status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('💕', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 6),
                Text(
                  'Aplikasi aktif & siap dipakai',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Stat row ──
  Widget _buildStatRow() {
    return Row(
      children: [
        _buildStatChip('🎓', 'Mahasiswa'),
        const SizedBox(width: 10),
        _buildStatChip('🏫', 'Kelas'),
        const SizedBox(width: 10),
        _buildStatChip('🪪', 'NIM'),
      ],
    );
  }

  Widget _buildStatChip(String emoji, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE8739A).withOpacity(0.12),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFFFFD6E7), width: 1),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFC49BAA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Widget: Menu card ──
  Widget _buildMenuCard(
    BuildContext context, {
    required String emoji,
    required Color bgColor,
    required Color accentColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8739A).withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: const Color(0xFFFFD6E7), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                // Emoji icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: accentColor.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 26)),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF8B4A62),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: const Color(0xFFC49BAA),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: accentColor,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Widget: Quote motivasi bawah ──
  Widget _buildQuoteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFECF3), Color(0xFFFFF5FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFCCDE), width: 1),
      ),
      child: Row(
        children: [
          const Text('✨', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"Belajar itu indah,\nseperti bunga yang mekar."',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF8B4A62),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '— Semangat terus! 💪🌸',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: const Color(0xFFC49BAA),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToForm(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const FormMahasiswaPage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child,
            ),
          );
        },
      ),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProfilePage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
