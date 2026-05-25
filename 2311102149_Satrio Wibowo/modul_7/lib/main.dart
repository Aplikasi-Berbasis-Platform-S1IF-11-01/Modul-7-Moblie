import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F4FF),
        textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==========================================
// 1. HALAMAN HOME (StatelessWidget)
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.school_rounded, color: Colors.white70, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      'Beranda',
                      style: GoogleFonts.outfit(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              // Hero Section
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.4),
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_pin_rounded,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Aplikasi Data\nMahasiswa',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Kelola data mahasiswa dengan mudah\ndan terstruktur.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: Colors.white60,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Button Form Mahasiswa
                        _buildMenuButton(
                          context,
                          label: 'Form Mahasiswa',
                          icon: Icons.assignment_rounded,
                          color: Colors.white,
                          textColor: const Color(0xFF0D47A1),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const FormPage()),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Button Profil Developer
                        _buildMenuButton(
                          context,
                          label: 'Profil Developer',
                          icon: Icons.badge_rounded,
                          color: Colors.white.withOpacity(0.15),
                          textColor: Colors.white,
                          borderColor: Colors.white38,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ProfilePage()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Universitas Telkom Purwokerto © 2026',
                  style: GoogleFonts.outfit(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: borderColor != null
                  ? Border.all(color: borderColor, width: 1.5)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: textColor, size: 22),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. HALAMAN FORM MAHASISWA (StatefulWidget)
// ==========================================
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  String tampilNama = '';
  String tampilNim = '';
  String tampilKelas = '';
  bool isDataSaved = false;

  void _simpanData() {
    setState(() {
      tampilNama = _namaController.text;
      tampilNim = _nimController.text;
      tampilKelas = _kelasController.text;
      isDataSaved = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Data berhasil disimpan!',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  InputDecoration _inputDecor(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.outfit(color: Colors.grey[600]),
      prefixIcon: Icon(icon, color: const Color(0xFF1565C0)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF1565C0), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: Text(
          'Form Mahasiswa',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Form Input
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Isi Data Mahasiswa',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: const Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lengkapi informasi di bawah ini',
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _namaController,
                    decoration: _inputDecor('Nama Lengkap', Icons.person_rounded),
                    style: GoogleFonts.outfit(),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _nimController,
                    decoration: _inputDecor('NIM', Icons.badge_rounded),
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.outfit(),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _kelasController,
                    decoration: _inputDecor('Kelas', Icons.class_rounded),
                    style: GoogleFonts.outfit(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tombol Simpan
            ElevatedButton.icon(
              onPressed: _simpanData,
              icon: const Icon(Icons.save_rounded, color: Colors.white),
              label: Text(
                'Simpan Data',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
            ),

            const SizedBox(height: 24),

            // Tampilan Hasil
            if (isDataSaved)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF1565C0).withOpacity(0.2),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D47A1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF0D47A1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Data Tersimpan',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color(0xFF0D47A1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade100, thickness: 1.5),
                    const SizedBox(height: 12),
                    _dataRow(Icons.person_rounded, 'Nama', tampilNama),
                    const SizedBox(height: 10),
                    _dataRow(Icons.badge_rounded, 'NIM', tampilNim),
                    const SizedBox(height: 10),
                    _dataRow(Icons.class_rounded, 'Kelas', tampilKelas),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _dataRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[400]),
        const SizedBox(width: 10),
        Text(
          '$label : ',
          style: GoogleFonts.outfit(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xFF1A237E),
            ),
          ),
          
        ),
      ],
    );
  }
}

// ==========================================
// 3. HALAMAN PROFIL DEVELOPER (StatelessWidget)
// ==========================================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: Text(
          'Profil Developer',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Avatar
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0D47A1).withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.person_rounded, size: 55, color: Colors.white),
              ),

              const SizedBox(height: 20),

              Text(
                'Satrio Wibowo',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D47A1).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'NIM: 2311102149',
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    color: const Color(0xFF0D47A1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _infoTile(Icons.school_rounded, 'Program Studi', 'S1 Informatika'),
                    const Divider(height: 24),
                    _infoTile(Icons.class_rounded, 'Kelas', 'S1 IF-11-REG01'),
                    const Divider(height: 24),
                    _infoTile(
                        Icons.location_city_rounded,
                        'Universitas',
                        'Universitas Telkom Purwokerto'),
                    const Divider(height: 24),
                    _infoTile(Icons.calendar_today_rounded, 'Tahun', '2026'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                  label: Text(
                    'Kembali',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D47A1),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF0D47A1).withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF0D47A1), size: 20),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 11,
                color: Colors.grey[400],
                letterSpacing: 0.5,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A237E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}