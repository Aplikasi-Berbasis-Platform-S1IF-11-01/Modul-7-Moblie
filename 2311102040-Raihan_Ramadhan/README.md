<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 7 - Mobile <br> Flutter Data Mahasiswa </h3>
  <br />
  <img src="assets\logo.jpeg" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Raihan Ramadhan</strong><br>
    <strong>2311102040</strong><br>
    <strong>IF-11-REG01</strong>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>
  </p>
  <br />
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong> Apri Pandu Wicaksono </strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

## Dasar Teori

### 1. Flutter
Flutter adalah framework open-source dari Google untuk membangun aplikasi multiplatform (Android, iOS, Web, Desktop) dari satu codebase menggunakan bahasa pemrograman Dart.

### 2. Widget
Semua elemen UI di Flutter adalah widget. Terdapat dua jenis utama:

- **StatelessWidget**: Widget yang tidak memiliki state yang berubah. Cocok untuk tampilan statis seperti halaman profil.
- **StatefulWidget**: Widget yang memiliki state dan dapat berubah saat ada interaksi pengguna. Cocok untuk form, daftar data dinamis, dll.

### 3. Navigator
Flutter menggunakan sistem navigasi berbasis stack. Perintah utama:
- `Navigator.push()` — membuka screen baru
- `Navigator.pop()` — kembali ke screen sebelumnya
- `Navigator.push<T>()` — membuka screen dan menunggu nilai kembalian

### 4. Material 3
Material 3 adalah versi terbaru dari sistem desain Google yang digunakan Flutter melalui `useMaterial3: true` pada `ThemeData`.

---

## Struktur Project

```
modul_7/
├── lib/
│   ├── main.dart               # Entry point aplikasi
│   ├── models/
│   │   └── mahasiswa.dart      # Model data mahasiswa
│   └── screens/
│       ├── home_screen.dart    # Halaman utama (daftar mahasiswa)
│       ├── form_screen.dart    # Halaman form input data
│       └── profil_screen.dart  # Halaman profil developer
├── pubspec.yaml                # Konfigurasi project & dependency
└── ...
```

---

## Penjelasan Kode

### 1. `mahasiswa.dart` — Model Data

```dart
class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;

  const Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
  });
}
```

**Penjelasan:** Class `Mahasiswa` berfungsi sebagai model data (blueprint) untuk menyimpan informasi mahasiswa. Menggunakan `final` agar data tidak berubah setelah dibuat, dan `const` constructor untuk efisiensi memori.

---

### 2. `main.dart` — Entry Point

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DataMahasiswaApp());
}

class DataMahasiswaApp extends StatelessWidget {
  const DataMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ── Warna utama ──────────────────────────────────────────
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A73E8),
          primary: const Color(0xFF1A73E8),
          secondary: const Color(0xFF00C2A8),
          tertiary: const Color(0xFFFF6B35),
          surface: const Color(0xFFF8FAFF),
          background: const Color(0xFFF0F4FF),
        ),
        useMaterial3: true,

        // ── Typography via Google Fonts ───────────────────────────
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayLarge: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: const Color(0xFF1A1A2E),
          ),
          headlineMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: const Color(0xFF1A1A2E),
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF4A4A6A),
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF6B6B8A),
          ),
        ),

        // ── AppBar ────────────────────────────────────────────────
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A73E8),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

        // ── ElevatedButton ────────────────────────────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A73E8),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            elevation: 3,
          ),
        ),

        // ── Input field ───────────────────────────────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD0D5E8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD0D5E8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color(0xFF1A73E8), width: 2),
          ),
          labelStyle: GoogleFonts.poppins(
            color: const Color(0xFF6B6B8A),
            fontSize: 14,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
```

**Penjelasan:** `main()` adalah fungsi pertama yang dijalankan. `runApp()` menginisialisasi seluruh aplikasi Flutter. `DataMahasiswaApp` merupakan `StatelessWidget` yang mendefinisikan tema global dan screen awal (`HomeScreen`).

---

### 3. `home_screen.dart` — Halaman Utama

`HomeScreen` menggunakan **StatefulWidget** karena menyimpan daftar mahasiswa yang dapat bertambah secara dinamis.

```dart
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
```

**Penjelasan:**
- `_daftarMahasiswa` menyimpan seluruh data mahasiswa yang telah ditambahkan.
- `_bukaForm()` membuka `FormScreen` dan menunggu data yang dikirim balik menggunakan `await`.
- Jika data tidak null, ditambahkan ke list menggunakan `setState()` agar UI diperbarui.

---

### 4. `form_screen.dart` — Halaman Form Input

`FormScreen` menggunakan **StatefulWidget** karena mengelola `TextEditingController` dan menyimpan data sementara (`_dataTersimpan`).

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa.dart';

/// FormScreen adalah StatefulWidget karena mengelola
/// state dari TextEditingController dan data yang ditampilkan.
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Controllers
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Data yang sudah disimpan (ditampilkan di bawah form)
  Mahasiswa? _dataTersimpan;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  // ── Aksi simpan ──────────────────────────────────────────────────────────
  void _simpanData() {
    if (!_formKey.currentState!.validate()) return;

    final mhs = Mahasiswa(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      kelas: _kelasController.text.trim(),
    );

    setState(() => _dataTersimpan = mhs);

    // SnackBar notifikasi berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              'Data berhasil disimpan!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF00C2A8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ── Kirim data ke HomeScreen via Navigator.pop ───────────────────────────
  void _kirimData() {
    if (_dataTersimpan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Simpan data terlebih dahulu!',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: const Color(0xFFFF6B35),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        ),
      );
      return;
    }
    Navigator.pop(context, _dataTersimpan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header card ──────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A73E8).withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit_note_rounded,
                        color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Input Data Mahasiswa',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Isi semua field dengan benar',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // ── Form ─────────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Nama Lengkap', Icons.person_rounded),
                    const SizedBox(height: 8),
                    _buildField(
                      controller: _namaController,
                      hint: 'Contoh: Budi Santoso',
                      validator: (v) =>
                          (v == null || v.trim().isEmpty)
                              ? 'Nama tidak boleh kosong'
                              : null,
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('NIM', Icons.badge_rounded),
                    const SizedBox(height: 8),
                    _buildField(
                      controller: _nimController,
                      hint: 'Contoh: 22310001',
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty)
                              ? 'NIM tidak boleh kosong'
                              : null,
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('Kelas', Icons.class_rounded),
                    const SizedBox(height: 8),
                    _buildField(
                      controller: _kelasController,
                      hint: 'Contoh: TI-3A',
                      validator: (v) =>
                          (v == null || v.trim().isEmpty)
                              ? 'Kelas tidak boleh kosong'
                              : null,
                    ),
                    const SizedBox(height: 28),

                    // ── Tombol Simpan ─────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _simpanData,
                        icon: const Icon(Icons.save_rounded),
                        label: const Text('Simpan Data'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Tampilkan data yang sudah disimpan ────────────────────────
            if (_dataTersimpan != null) ...[
              Text(
                'Data Tersimpan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 12),
              _DataPreviewCard(mahasiswa: _dataTersimpan!),
              const SizedBox(height: 16),

              // Tombol kirim ke home
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _kirimData,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Tambahkan ke Daftar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C2A8),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF1A73E8)),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A2E),
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: GoogleFonts.poppins(fontSize: 15, color: const Color(0xFF1A1A2E)),
      decoration: InputDecoration(hintText: hint),
    );
  }
}

// ── Preview card (StatelessWidget) ────────────────────────────────────────────
class _DataPreviewCard extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const _DataPreviewCard({required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8F5E9), Color(0xFFE0F2F1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00C2A8).withOpacity(0.4)),
      ),
      child: Column(
        children: [
          _infoRow(Icons.person_rounded, 'Nama', mahasiswa.nama),
          const Divider(height: 20, color: Color(0xFFB2DFDB)),
          _infoRow(Icons.badge_rounded, 'NIM', mahasiswa.nim),
          const Divider(height: 20, color: Color(0xFFB2DFDB)),
          _infoRow(Icons.class_rounded, 'Kelas', mahasiswa.kelas),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF00C2A8)),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6B6B8A),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A2E),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
```

**Penjelasan:**
- `_simpanData()` memvalidasi form lalu menyimpan data ke variabel `_dataTersimpan`.
- `_kirimData()` mengirim data ke `HomeScreen` melalui `Navigator.pop()` dengan nilai kembalian.
- Validasi dilakukan menggunakan `GlobalKey<FormState>` dan `validator` di setiap field.

---

### 5. `profil_screen.dart` — Halaman Profil

`ProfilScreen` menggunakan **StatelessWidget** karena hanya menampilkan informasi statis tentang developer dan tidak memerlukan perubahan state.

---

## Alur Navigasi Aplikasi

```
HomeScreen
    │
    ├──[FAB / Tombol Tambah]──► FormScreen
    │                               │
    │        [Navigator.pop(data)]◄─┘
    │
    └──[Icon Person]──► ProfilScreen
                            │
              [Tombol Kembali]◄─┘
```

---

## Penggunaan StatefulWidget vs StatelessWidget

| Screen | Jenis Widget | Alasan |
|---|---|---|
| `DataMahasiswaApp` | StatelessWidget | Hanya konfigurasi tema, tidak ada state |
| `HomeScreen` | StatefulWidget | Menyimpan list mahasiswa yang dinamis |
| `FormScreen` | StatefulWidget | Mengelola controller dan data tersimpan |
| `ProfilScreen` | StatelessWidget | Hanya menampilkan data statis |
| `_MahasiswaCard` | StatelessWidget | Hanya menampilkan data dari parameter |
| `_DataPreviewCard` | StatelessWidget | Hanya menampilkan data dari parameter |

---

## I. Dependency yang Digunakan

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  cupertino_icons: ^1.0.2
```

**`google_fonts`** digunakan untuk menerapkan font **Poppins** secara konsisten di seluruh aplikasi melalui `GoogleFonts.poppinsTextTheme()`.

---

## J. Hasil Aplikasi

### 1. Halaman Utama (Empty State)
Menampilkan ilustrasi kosong dengan tombol ajakan menambah data mahasiswa saat list masih kosong.

### 2. Halaman Utama (Ada Data)
Menampilkan daftar mahasiswa dalam bentuk card dengan avatar inisial berwarna, nama, NIM, dan kelas.

### 3. Halaman Form Input
Menampilkan form dengan tiga field (Nama, NIM, Kelas) beserta validasi. Setelah disimpan, menampilkan preview data sebelum dikirim ke halaman utama.

### 4. Halaman Profil Developer
Menampilkan informasi akademik developer dan teknologi yang digunakan dalam membangun aplikasi.

---

## output
1. Home Screen
---
<img src="assets\home.JPG" alt="Logo" width="300"> 

2. Form Screen
---
<img src="assets\form.JPG" alt="Logo" width="300"> 

3. Profile Screen
---
<img src="assets\profil.JPG" alt="Logo" width="300"> 

## Kesimpulan

Dari praktikum ini dapat disimpulkan:

1. **StatefulWidget** digunakan ketika widget perlu menyimpan dan memperbarui state secara dinamis, seperti daftar data dan form input.
2. **StatelessWidget** digunakan untuk widget yang hanya menampilkan data tetap tanpa perubahan state.
3. **Navigator** memungkinkan perpindahan antar screen dan pengiriman data dua arah menggunakan `push` dan `pop`.
4. **Package `google_fonts`** mempermudah penggunaan font kustom tanpa perlu mengunduh file font secara manual.
5. **Material 3** menyediakan komponen UI yang modern dan konsisten melalui `ThemeData` terpusat.

---

## Referensi

- Flutter Documentation: https://docs.flutter.dev
- Google Fonts Package: https://pub.dev/packages/google_fonts
- Material Design 3: https://m3.material.io
- Dart Language: https://dart.dev/guides