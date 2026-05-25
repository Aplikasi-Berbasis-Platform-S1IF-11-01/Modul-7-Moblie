import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa.dart';
import 'form_screen.dart';
import 'profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Mahasiswa> _daftarMahasiswa = [];

  Future<void> _bukaForm() async {
    final result = await Navigator.push<Mahasiswa>(
      context,
      MaterialPageRoute(builder: (_) => const FormScreen()),
    );
    if (result != null) {
      setState(() => _daftarMahasiswa.add(result));
    }
  }

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

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: Text(
          'Tambah Mahasiswa',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
        ),
      ),

      body: _daftarMahasiswa.isEmpty
          ? _buildEmptyState()
          : _buildDaftarList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: const Color(0xFF4DB6AC).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 64,
              color: Color(0xFF4DB6AC),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Belum Ada Data Mahasiswa',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1A3C34),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tekan tombol + untuk menambahkan\ndata mahasiswa baru',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: const Color(0xFF7A9E98),
              height: 1.6,
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

  Widget _buildDaftarList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
          child: Text(
            'Total: ${_daftarMahasiswa.length} Mahasiswa',
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7A9E98),
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

class _MahasiswaCard extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final int nomor;

  const _MahasiswaCard({required this.mahasiswa, required this.nomor});

  @override
  Widget build(BuildContext context) {
    final avatarColors = [
      const Color(0xFF4DB6AC),
      const Color(0xFFFF8A65),
      const Color(0xFFF48FB1),
      const Color(0xFFCE93D8),
    ];
    final color = avatarColors[(nomor - 1) % avatarColors.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4DB6AC).withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  mahasiswa.nama.isNotEmpty
                      ? mahasiswa.nama[0].toUpperCase()
                      : '?',
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
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
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A3C34),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.badge_rounded,
                          size: 14, color: Color(0xFF7A9E98)),
                      const SizedBox(width: 4),
                      Text(
                        mahasiswa.nim,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: const Color(0xFF7A9E98),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.class_rounded,
                          size: 14, color: Color(0xFF7A9E98)),
                      const SizedBox(width: 4),
                      Text(
                        mahasiswa.kelas,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: const Color(0xFF7A9E98),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Nomor badge
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '#$nomor',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
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