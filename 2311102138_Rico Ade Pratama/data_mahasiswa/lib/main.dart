import 'package:flutter/material.dart';
// Tugas : Menggunakan Google Fonts package
import 'package:google_fonts/google_fonts.dart';

import 'form_mahasiswa.dart';
import 'profil_developer.dart';

void main() {
  runApp(const MyApp());
}

// MODEL DATA
class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;

  Mahasiswa({required this.nama, required this.nim, required this.kelas});
}

// MAIN APP
// Tugas : Menggunakan StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFDC2626), // Merah
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// HOME SCREEN
// Tugas : Menggunakan StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Mahasiswa> _mahasiswaList = [];

  void _navigateAndAddStudent() async {
    // Tugas : Menggunakan Navigator.push (Berpindah Halaman)
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudentFormScreen()),
    );

    if (result != null && result is Mahasiswa) {
      setState(() {
        _mahasiswaList.add(result);
      });
    }
  }

  // Fungsi untuk menghapus data mahasiswa
  void _hapusMahasiswa(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Hapus Data',
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Yakin ingin menghapus data ${_mahasiswaList[index].nama}?',
            style: GoogleFonts.outfit(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Batal',
                style: GoogleFonts.outfit(color: Colors.grey[700]),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                final namaTerhapus = _mahasiswaList[index].nama;
                setState(() {
                  _mahasiswaList.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '$namaTerhapus berhasil dihapus.',
                      style: GoogleFonts.outfit(),
                    ),
                    backgroundColor: Colors.red[800],
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                'Hapus',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Mahasiswa App',
          // Tugas : Menggunakan Google Fonts package
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Tugas : Menggunakan Navigator.push (Berpindah Halaman)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Selamat Datang di Sistem Data Mahasiswa',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: const Color(0xFF64748B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Telkom University Purwokerto',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFDC2626),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.school,
                        color: Color(0xFFDC2626),
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF2F2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFECACA)),
                    ),
                    child: Text(
                      'Jumlah Mahasiswa : ${_mahasiswaList.length}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFB91C1C),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // DAFTAR MAHASISWA
            Expanded(
              child: _mahasiswaList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open_rounded,
                            size: 80,
                            color: Colors.red[200],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Belum ada data mahasiswa.',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _mahasiswaList.length,
                      itemBuilder: (context, index) {
                        final mhs = _mahasiswaList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFFFEF2F2),
                              child: Text(
                                mhs.nama[0].toUpperCase(),
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFDC2626),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              mhs.nama,
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${mhs.nim} • ${mhs.kelas}',
                              style: GoogleFonts.outfit(),
                            ),

                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.redAccent,
                              ),
                              onPressed: () => _hapusMahasiswa(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateAndAddStudent,
        backgroundColor: const Color(0xFFDC2626),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Tambah Data',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
