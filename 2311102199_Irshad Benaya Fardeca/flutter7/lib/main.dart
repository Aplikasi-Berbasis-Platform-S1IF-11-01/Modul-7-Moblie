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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E46A3),
          primary: const Color(0xFF0E46A3),
          secondary: const Color(0xFFE50012),
          tertiary: const Color(0xFFFFCC00),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// 1. HALAMAN HOME (StatelessWidget)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.precision_manufacturing_outlined, color: theme.tertiary, size: 20),
            const SizedBox(width: 8),
            const Text(
              'Dashboard Mahasiswa',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: theme.primary,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.secondary, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primary.withValues(alpha: 0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ]
                ),
                child: Icon(Icons.school_rounded, size: 100, color: theme.primary),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormScreen()),
                  );
                },
                icon: const Icon(Icons.assignment_add),
                label: const Text('Isi Form Mahasiswa'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  backgroundColor: theme.primary,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Profil Developer'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  backgroundColor: theme.tertiary,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Sudut tegas
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. HALAMAN FORM MAHASISWA (StatefulWidget)
// ==========================================
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  String nama = '';
  String nim = '';
  String kelas = '';
  bool isSubmitted = false;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Input Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  height: 25,
                  color: theme.secondary,
                ),
                const SizedBox(width: 10),
                Text(
                  'Input Data Mahasiswa',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Input Nama
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline, color: theme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // Input NIM
            TextField(
              controller: _nimController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'NIM (Nomor Induk Mahasiswa)',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge_outlined, color: theme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // Input Kelas
            TextField(
              controller: _kelasController,
              decoration: InputDecoration(
                labelText: 'Kelas',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.class_outlined, color: theme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 25),
            
            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = _namaController.text;
                  nim = _nimController.text;
                  kelas = _kelasController.text;
                  isSubmitted = true;
                });

                // SnackBar Sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 10),
                        Text('DATA TERVERIFIKASI & DISIMPAN'),
                      ],
                    ),
                    backgroundColor: const Color(0xFF00A86B),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Lebih bersudut/tajam
                ),
              ),
              child: const Text(
                'Simpan Data',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
            ),
            const SizedBox(height: 30),

            // Container Menampilkan Hasil Input
            if (isSubmitted)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primary.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: theme.primary, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'HASIL ANALISIS DATA:',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: theme.primary,
                            letterSpacing: 1
                          ),
                        ),
                      ],
                    ),
                    Divider(color: theme.primary, thickness: 1.5),
                    const SizedBox(height: 5),
                    Text(
                      'Nama  : $nama',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'NIM     : $nim',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Kelas  : $kelas',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. HALAMAN PROFIL DEVELOPER (StatelessWidget)
// ==========================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Developer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.secondary, width: 2, style: BorderStyle.solid),
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: theme.tertiary,
                    child: Icon(Icons.bolt, size: 60, color: theme.primary),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Irshad Benaya Fardeca',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Text(
                  'NIM : 2311102199',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Tombol Kembali
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}