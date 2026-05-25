import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/mahasiswa_model.dart';
import 'daftar_mahasiswa_page.dart';
import 'form_mahasiswa_page.dart';
import 'profil_developer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ← List disimpan di sini supaya tidak hilang
  final List<MahasiswaModel> _daftarMahasiswa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_rounded),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilDeveloperPage())),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, Color(0xFF7B8FFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Halo! 👋',
                            style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text('Selamat Datang',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(
                            '${_daftarMahasiswa.length} mahasiswa terdaftar',
                            style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.school_rounded,
                      size: 70, color: Colors.white24),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Text('Menu Utama',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark)),
            const SizedBox(height: 16),

            _MenuCard(
              icon: Icons.people_rounded,
              title: 'Daftar Mahasiswa',
              subtitle: '${_daftarMahasiswa.length} mahasiswa terdaftar',
              color: const Color(0xFF9C27B0),
              onTap: () async {
                // Push ke DaftarMahasiswaPage dengan pass list
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DaftarMahasiswaPage(
                      daftarMahasiswa: _daftarMahasiswa,
                      onDataChanged: () => setState(() {}),
                    ),
                  ),
                );
                setState(() {}); // refresh setelah balik
              },
            ),
            const SizedBox(height: 12),
            _MenuCard(
              icon: Icons.edit_note_rounded,
              title: 'Tambah Mahasiswa',
              subtitle: 'Input data mahasiswa baru',
              color: AppTheme.primary,
              onTap: () async {
                final result = await Navigator.push<MahasiswaModel>(
                  context,
                  MaterialPageRoute(builder: (_) => const FormMahasiswaPage()),
                );
                if (result != null) {
                  setState(() => _daftarMahasiswa.add(result));
                }
              },
            ),
            const SizedBox(height: 12),
            _MenuCard(
              icon: Icons.person_pin_rounded,
              title: 'Profil Developer',
              subtitle: 'Informasi pembuat aplikasi',
              color: AppTheme.secondary,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilDeveloperPage())),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: color.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppTheme.textDark)),
                    Text(subtitle,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: AppTheme.textLight)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }
}