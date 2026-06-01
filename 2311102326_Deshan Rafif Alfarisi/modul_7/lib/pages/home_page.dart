import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_mahasiswa_page.dart';
import 'profil_developer_page.dart';

/// HomePage - StatefulWidget sebagai halaman utama
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // List untuk menyimpan data mahasiswa yang sudah diinput
  final List<Map<String, String>> _dataMahasiswa = [];
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _navigateToForm() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FormMahasiswaPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );

    if (result != null) {
      setState(() {
        _dataMahasiswa.add(result);
      });
    }
  }

  void _navigateToProfil() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ProfilDeveloperPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.school_rounded, color: Color(0xFFD7C7A1)),
            const SizedBox(width: 8),
            Text('Data Mahasiswa',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_rounded),
            tooltip: 'Profil Developer',
            onPressed: _navigateToProfil,
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF145A43), Color(0xFF2F8F6F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2F8F6F).withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.dashboard_rounded,
                          color: Color(0xFFD7C7A1),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang! 👋',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Kelola data mahasiswa dengan mudah',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: const Color(0xFFD7C7A1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Statistik
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.people_alt_rounded,
                            color: Color(0xFFD7C7A1), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Total Data: ${_dataMahasiswa.length} mahasiswa',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      icon: Icons.person_add_rounded,
                      label: 'Tambah\nMahasiswa',
                      onTap: _navigateToForm,
                      color: const Color(0xFF2F8F6F),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMenuCard(
                      icon: Icons.info_rounded,
                      label: 'Profil\nDeveloper',
                      onTap: _navigateToProfil,
                      color: const Color(0xFFD7C7A1),
                      textColor: const Color(0xFF0F0F0F),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.list_alt_rounded,
                      color: Color(0xFFD7C7A1), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Daftar Mahasiswa',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // List Mahasiswa
            Expanded(
              child: _dataMahasiswa.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_rounded,
                            size: 64,
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Belum ada data mahasiswa',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tekan tombol + untuk menambah data',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _dataMahasiswa.length,
                      itemBuilder: (context, index) {
                        final data = _dataMahasiswa[index];
                        return _buildMahasiswaCard(data, index);
                      },
                    ),
            ),
          ],
        ),
      ),
      // FAB untuk menambah mahasiswa
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToForm,
        backgroundColor: const Color(0xFF2F8F6F),
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text(
          'Tambah',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Widget untuk menu card
  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
    Color textColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: textColor),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk card data mahasiswa
  Widget _buildMahasiswaCard(Map<String, String> data, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF145A43).withValues(alpha: 0.8),
            const Color(0xFF145A43).withValues(alpha: 0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2F8F6F).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar dengan nomor urut
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2F8F6F),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Info mahasiswa
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['nama'] ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.badge_rounded,
                        size: 14, color: Color(0xFFD7C7A1)),
                    const SizedBox(width: 4),
                    Text(
                      data['nim'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFFD7C7A1),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.class_rounded,
                        size: 14, color: Color(0xFFD7C7A1)),
                    const SizedBox(width: 4),
                    Text(
                      data['kelas'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFFD7C7A1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Delete button
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded,
                color: Colors.white38, size: 20),
            onPressed: () {
              setState(() {
                _dataMahasiswa.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.delete_rounded,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Text('Data berhasil dihapus!',
                          style: GoogleFonts.poppins()),
                    ],
                  ),
                  backgroundColor: Colors.red.shade700,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
