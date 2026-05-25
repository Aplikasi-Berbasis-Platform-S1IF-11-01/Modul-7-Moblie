import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/mahasiswa_model.dart';
import '../widgets/custom_widgets.dart';
import 'form_mahasiswa_page.dart';

class DaftarMahasiswaPage extends StatefulWidget {
  // ← Terima list dari HomePage
  final List<MahasiswaModel> daftarMahasiswa;
  final VoidCallback onDataChanged;

  const DaftarMahasiswaPage({
    super.key,
    required this.daftarMahasiswa,
    required this.onDataChanged,
  });

  @override
  State<DaftarMahasiswaPage> createState() => _DaftarMahasiswaPageState();
}

class _DaftarMahasiswaPageState extends State<DaftarMahasiswaPage> {
  // Gunakan list dari parent langsung
  List<MahasiswaModel> get _list => widget.daftarMahasiswa;

  void _tambahMahasiswa() async {
    final result = await Navigator.push<MahasiswaModel>(
      context,
      MaterialPageRoute(builder: (_) => const FormMahasiswaPage()),
    );

    if (result != null) {
      setState(() => _list.add(result));
      widget.onDataChanged(); // update HomePage juga
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ${result.nama} berhasil ditambahkan!',
              style: GoogleFonts.poppins()),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _hapusMahasiswa(int index) {
    final nama = _list[index].nama;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Hapus Data',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text('Hapus data $nama dari daftar?',
            style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal',
                style: GoogleFonts.poppins(color: AppTheme.textLight)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _list.removeAt(index));
              widget.onDataChanged();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('🗑️ Data $nama dihapus',
                      style: GoogleFonts.poppins()),
                  backgroundColor: Colors.red.shade600,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600),
            child: Text('Hapus', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  void _lihatDetail(MahasiswaModel mhs) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SectionHeader(title: 'Detail Mahasiswa'),
            const SizedBox(height: 16),
            InfoCard(
                icon: Icons.person_rounded,
                label: 'Nama',
                value: mhs.nama,
                color: AppTheme.primary),
            InfoCard(
                icon: Icons.badge_rounded,
                label: 'NIM',
                value: mhs.nim,
                color: AppTheme.secondary),
            InfoCard(
                icon: Icons.class_rounded,
                label: 'Kelas',
                value: mhs.kelas,
                color: AppTheme.accent),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('${_list.length} mhs',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      body: _list.isEmpty ? _buildEmptyState() : _buildList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahMahasiswa,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: Text('Tambah',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.people_outline_rounded,
                size: 64, color: AppTheme.primary),
          ),
          const SizedBox(height: 20),
          Text('Belum ada mahasiswa',
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark)),
          const SizedBox(height: 6),
          Text('Tap tombol + untuk menambahkan',
              style: GoogleFonts.poppins(
                  fontSize: 13, color: AppTheme.textLight)),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primary, Color(0xFF7B8FFF)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.people_rounded,
                  color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Mahasiswa',
                      style: GoogleFonts.poppins(
                          color: Colors.white70, fontSize: 12)),
                  Text('${_list.length} Mahasiswa',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 90),
            itemCount: _list.length,
            itemBuilder: (context, index) {
              final mhs = _list[index];
              return _MahasiswaCard(
                mahasiswa: mhs,
                index: index,
                onTap: () => _lihatDetail(mhs),
                onDelete: () => _hapusMahasiswa(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MahasiswaCard extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  final int index;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _MahasiswaCard({
    required this.mahasiswa,
    required this.index,
    required this.onTap,
    required this.onDelete,
  });

  Color get _avatarColor {
    final colors = [
      AppTheme.primary,
      AppTheme.secondary,
      AppTheme.accent,
      Colors.purple,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.06),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: _avatarColor,
                  child: Text(
                    mahasiswa.nama.isNotEmpty
                        ? mahasiswa.nama[0].toUpperCase()
                        : '?',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mahasiswa.nama,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppTheme.textDark)),
                      const SizedBox(height: 2),
                      Text(
                          'NIM: ${mahasiswa.nim}  •  ${mahasiswa.kelas}',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppTheme.textLight)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline_rounded,
                      color: Colors.red, size: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}