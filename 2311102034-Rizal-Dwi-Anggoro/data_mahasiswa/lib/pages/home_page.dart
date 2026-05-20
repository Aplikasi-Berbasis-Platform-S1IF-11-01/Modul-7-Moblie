// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'form_mahasiswa_page.dart';
import 'profil_developer_page.dart';

/// Halaman utama — menggunakan StatefulWidget
/// karena menyimpan daftar mahasiswa yang bisa berubah
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar data mahasiswa yang tersimpan
  final List<Mahasiswa> _daftarMahasiswa = [];

  // ── Navigasi ke form dan tunggu hasil (Navigator.push) ───────
  Future<void> _bukaFormMahasiswa() async {
    final Mahasiswa? hasil = await Navigator.push<Mahasiswa>(
      context,
      MaterialPageRoute(builder: (_) => const FormMahasiswaPage()),
    );

    // Jika ada data yang dikembalikan dari form, tambahkan ke list
    if (hasil != null) {
      setState(() {
        _daftarMahasiswa.add(hasil);
      });
    }
  }

  // ── Navigasi ke halaman profil developer ────────────────────
  void _bukaProfilDeveloper() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilDeveloperPage()),
    );
  }

  // ── Hapus data mahasiswa ────────────────────────────────────
  void _hapusMahasiswa(int index) {
    setState(() {
      _daftarMahasiswa.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data mahasiswa dihapus'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Profil Developer',
            onPressed: _bukaProfilDeveloper,
          ),
        ],
      ),

      // ── Body ─────────────────────────────────────────────────
      body: Column(
        children: [
          // Banner Header
          _buildBannerHeader(),

          // Daftar Mahasiswa
          Expanded(
            child: _daftarMahasiswa.isEmpty
                ? _buildEmptyState()
                : _buildListMahasiswa(),
          ),
        ],
      ),

      // ── FAB Tambah Mahasiswa ──────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormMahasiswa,
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(
          'Tambah Mahasiswa',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // ── Widget: Banner Header ──────────────────────────────────
  Widget _buildBannerHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang! 👋',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      'Sistem Data Mahasiswa',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Statistik
          Row(
            children: [
              _buildStatChip(
                Icons.people,
                '${_daftarMahasiswa.length}',
                'Mahasiswa',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text(
            '$value $label',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Empty State ─────────────────────────────────────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_add_alt_1,
              size: 64,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Belum ada data mahasiswa',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap tombol di bawah untuk menambahkan\ndata mahasiswa baru',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: List Mahasiswa ──────────────────────────────────
  Widget _buildListMahasiswa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: SectionHeader(
            title: 'Daftar Mahasiswa',
            icon: Icons.list_alt,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            itemCount: _daftarMahasiswa.length,
            itemBuilder: (context, index) {
              final mhs = _daftarMahasiswa[index];
              return _MahasiswaCard(
                mahasiswa: mhs,
                nomor: index + 1,
                onHapus: () => _hapusMahasiswa(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────
/// Card Mahasiswa (StatelessWidget)
// ──────────────────────────────────────────────────────────────
class _MahasiswaCard extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final int nomor;
  final VoidCallback onHapus;

  const _MahasiswaCard({
    required this.mahasiswa,
    required this.nomor,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppTheme.primaryColor,
      const Color(0xFF7B1FA2),
      const Color(0xFF00838F),
      const Color(0xFFE65100),
      const Color(0xFF2E7D32),
    ];
    final cardAccent = colors[(nomor - 1) % colors.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: cardAccent, width: 5),
        ),
        boxShadow: [
          BoxShadow(
            color: cardAccent.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: cardAccent,
                  radius: 22,
                  child: Text(
                    '$nomor',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    mahasiswa.nama,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline,
                      color: Colors.redAccent, size: 22),
                  onPressed: onHapus,
                  tooltip: 'Hapus',
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Info detail
            Row(
              children: [
                _DetailChip(
                  icon: Icons.badge_outlined,
                  label: mahasiswa.nim,
                  color: cardAccent,
                ),
                const SizedBox(width: 10),
                _DetailChip(
                  icon: Icons.class_outlined,
                  label: mahasiswa.kelas,
                  color: cardAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _DetailChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}