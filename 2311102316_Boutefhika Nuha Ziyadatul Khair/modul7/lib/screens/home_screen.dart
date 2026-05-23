import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_mahasiswa_screen.dart';
import 'profil_developer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _nama, _nim, _kelas;

  void _bukaForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormMahasiswaScreen()),
    );

    if (result != null && result is Map) {
      setState(() {
        _nama = result['nama'];
        _nim = result['nim'];
        _kelas = result['kelas'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa',
            style: GoogleFonts.dmSerifDisplay(fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline_rounded, size: 22),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilDeveloperScreen())),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFF2D9DF)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          // ── Hero ──
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF9E4EB),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2C4D0),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.school_outlined,
                      size: 26, color: Color(0xFFC47A8A)),
                ),
                const SizedBox(height: 14),
                Text('Selamat datang',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: const Color(0xFF5C3341))),
                const SizedBox(height: 6),
                Text('Input Data Mahasiswa',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: const Color(0xFFA07080),
                        height: 1.5)),
              ],
            ),
          ),

          const SizedBox(height: 28),

          if (_nama != null) ...[
            Text('Data Mahasiswa',
                style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: const Color(0xFFB89098),
                    letterSpacing: 1.2)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF0F3),
                border: Border.all(color: const Color(0xFFF2D9DF)),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _DataRow('Nama', _nama!),
                  const Divider(color: Color(0xFFF2D9DF), height: 1),
                  _DataRow('NIM', _nim!),
                  const Divider(color: Color(0xFFF2D9DF), height: 1),
                  _DataRow('Kelas', _kelas!),
                ],
              ),
            ),
            const SizedBox(height: 28),
          ],

          Text('Menu',
              style: GoogleFonts.dmSans(
                  fontSize: 11,
                  color: const Color(0xFFB89098),
                  letterSpacing: 1.2)),
          const SizedBox(height: 12),

          _MenuItem(
            icon: Icons.badge_outlined,
            title: 'Form Mahasiswa',
            subtitle: 'Input & simpan data',
            onTap: _bukaForm,
          ),
          const SizedBox(height: 10),
          _MenuItem(
            icon: Icons.person_outline_rounded,
            title: 'Profil Developer',
            subtitle: 'Info pembuat aplikasi',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilDeveloperScreen())),
          ),
        ],
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final String label, value;
  const _DataRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.dmSans(
                  fontSize: 12, color: const Color(0xFFB89098))),
          Text(value,
              style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: const Color(0xFF5C3341),
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF2D9DF)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF0F3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 19, color: const Color(0xFFC47A8A)),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: const Color(0xFF5C3341),
                          fontWeight: FontWeight.w500)),
                  Text(subtitle,
                      style: GoogleFonts.dmSans(
                          fontSize: 11, color: const Color(0xFFB89098))),
                ],
              ),
              const Spacer(),
              const Icon(Icons.chevron_right_rounded,
                  size: 20, color: Color(0xFFD4A0B0)),
            ],
          ),
        ),
      ),
    );
  }
}