import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa.dart';
import 'form_screen.dart';
import 'profil_screen.dart';

/// HomeScreen adalah StatefulWidget agar dapat menyimpan
/// daftar mahasiswa yang dikirim balik dari FormScreen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Mahasiswa> _daftarMahasiswa = [];

  // ── Navigasi ke FormScreen & tunggu hasil ─────────────────────────────────
  Future<void> _bukaForm() async {
    final result = await Navigator.push<Mahasiswa>(
      context,
      MaterialPageRoute(builder: (_) => const FormScreen()),
    );
    if (result != null) {
      setState(() => _daftarMahasiswa.add(result));
    }
  }

  // ── Navigasi ke ProfilScreen ──────────────────────────────────────────────
  void _bukaProfil() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.background,
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          IconButton(
            onPressed: _bukaProfil,
            icon: const Icon(Icons.person_rounded),
            tooltip: 'Profil Developer',
          ),
        ],
      ),

      // ── FAB untuk tambah data ─────────────────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        backgroundColor: cs.secondary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: Text(
          'Tambah Mahasiswa',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),

      body: _daftarMahasiswa.isEmpty
          ? _buildEmptyState()
          : _buildDaftarList(),
    );
  }

  // ── Empty state ───────────────────────────────────────────────────────────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF1A73E8).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 60,
              color: Color(0xFF1A73E8),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Belum Ada Data Mahasiswa',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tekan tombol + untuk menambahkan\ndata mahasiswa baru',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF6B6B8A),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _bukaForm,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Tambah Sekarang'),
          ),
        ],
      ),
    );
  }

  // ── List mahasiswa ────────────────────────────────────────────────────────
  Widget _buildDaftarList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header count
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
          child: Text(
            'Total: ${_daftarMahasiswa.length} Mahasiswa',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF6B6B8A),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            itemCount: _daftarMahasiswa.length,
            itemBuilder: (context, index) {
              final mhs = _daftarMahasiswa[index];
              return _MahasiswaCard(mahasiswa: mhs, nomor: index + 1);
            },
          ),
        ),
      ],
    );
  }
}

// ── Card widget (StatelessWidget) ─────────────────────────────────────────────
class _MahasiswaCard extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final int nomor;

  const _MahasiswaCard({required this.mahasiswa, required this.nomor});

  @override
  Widget build(BuildContext context) {
    // Warna avatar bergilir
    final avatarColors = [
      const Color(0xFF1A73E8),
      const Color(0xFF00C2A8),
      const Color(0xFFFF6B35),
      const Color(0xFF9C27B0),
    ];
    final color = avatarColors[(nomor - 1) % avatarColors.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A73E8).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar inisial
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  mahasiswa.nama.isNotEmpty
                      ? mahasiswa.nama[0].toUpperCase()
                      : '?',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mahasiswa.nama,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.badge_rounded,
                          size: 14, color: Color(0xFF6B6B8A)),
                      const SizedBox(width: 4),
                      Text(
                        mahasiswa.nim,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: const Color(0xFF6B6B8A),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.class_rounded,
                          size: 14, color: Color(0xFF6B6B8A)),
                      const SizedBox(width: 4),
                      Text(
                        mahasiswa.kelas,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: const Color(0xFF6B6B8A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Nomor urut badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '#$nomor',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}