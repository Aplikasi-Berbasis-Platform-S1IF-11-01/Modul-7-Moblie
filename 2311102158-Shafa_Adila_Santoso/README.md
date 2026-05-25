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
    <strong>Shafa Adila Santoso</strong><br>
    <strong>2311102158</strong><br>
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


## 1. Deskripsi Aplikasi

Aplikasi **Data Mahasiswa** adalah aplikasi mobile berbasis Flutter yang memungkinkan pengguna untuk menginput, menyimpan, dan menampilkan data mahasiswa secara dinamis. Aplikasi ini dikembangkan menggunakan bahasa pemrograman Dart dengan framework Flutter 3.x dan menerapkan konsep dasar navigasi antar halaman, manajemen state, serta penggunaan widget Material 3.

---

## 2. Teknologi yang Digunakan

| Teknologi | Keterangan |
|---|---|
| Flutter 3.x | Framework utama pengembangan UI |
| Dart | Bahasa pemrograman |
| Google Fonts (Nunito, Poppins) | Kustomisasi tipografi |
| Material 3 | Design system UI |
| StatefulWidget | Manajemen state lokal |
| Navigator | Navigasi antar halaman |

---

## 3. Struktur Proyek

```
lib/
├── main.dart               # Entry point & konfigurasi tema global
├── models/
│   └── mahasiswa.dart      # Model data mahasiswa
└── screens/
    ├── home_screen.dart    # Halaman utama daftar mahasiswa
    ├── form_screen.dart    # Halaman form input data
    └── profil_screen.dart  # Halaman profil developer
```

---

## 4. Dasar Teori

### 4.1 Flutter

Flutter adalah framework open-source buatan Google untuk membangun aplikasi multiplatform (Android, iOS, Web, Desktop) dari satu basis kode. Flutter menggunakan bahasa pemrograman Dart dan merender UI secara langsung menggunakan Skia/Impeller engine, sehingga tampilan konsisten di berbagai platform tanpa bergantung pada komponen native OS (Zammetti, 2019).

### 4.2 Dart

Dart adalah bahasa pemrograman berorientasi objek yang dikembangkan oleh Google. Dart bersifat strongly typed, mendukung null safety, dan dioptimalkan untuk pengembangan UI yang responsif. Dart dapat dikompilasi ke native code (AOT) maupun dijalankan dalam mesin virtual (JIT) selama proses pengembangan (Bracha, 2021).

### 4.3 Widget

Dalam Flutter, semua elemen tampilan disebut widget. Widget adalah deskripsi immutable dari bagian antarmuka pengguna. Flutter membagi widget menjadi dua kategori utama (Flutter Team, 2024):

- **StatelessWidget** — widget yang tidak memiliki state yang berubah. Cocok untuk tampilan statis yang hanya bergantung pada konfigurasi awal.
- **StatefulWidget** — widget yang memiliki state internal yang dapat berubah selama siklus hidupnya. Perubahan state dipicu oleh `setState()` yang menyebabkan widget dirender ulang.

### 4.4 Navigator dan Routing

Flutter menggunakan konsep stack-based navigation melalui kelas `Navigator`. Navigasi dilakukan dengan mendorong (`push`) atau mengeluarkan (`pop`) route dari stack. Navigator juga mendukung pengiriman data antar halaman melalui nilai kembalian dari `Navigator.pop()` yang ditangkap oleh `Navigator.push()` menggunakan `async/await` (Flutter Team, 2024).

### 4.5 State Management

State management adalah proses mengelola dan memperbarui data yang memengaruhi tampilan UI. Pada aplikasi ini digunakan pendekatan setState (local state management), yaitu mekanisme bawaan Flutter di mana perubahan data pada `StatefulWidget` dipicu oleh pemanggilan `setState()` sehingga Flutter akan melakukan rebuild widget yang bersangkutan (Windmill, 2020).

### 4.6 Form dan Validasi

Flutter menyediakan widget `Form` bersama `GlobalKey<FormState>` untuk mengelola dan memvalidasi input pengguna secara terpusat. Setiap field input menggunakan `TextFormField` yang dilengkapi properti `validator` berupa fungsi callback. Validasi dipanggil serentak melalui `_formKey.currentState!.validate()` (Flutter Team, 2024).

### 4.7 Material Design 3

Material Design 3 (Material You) adalah sistem desain terbaru dari Google yang menekankan personalisasi warna dinamis, komponen yang lebih ekspresif, dan aksesibilitas yang lebih baik. Flutter mendukung Material 3 secara penuh mulai versi 3.0 dengan mengaktifkan `useMaterial3: true` pada `ThemeData` (Google Material, 2022).

### 4.8 Google Fonts

Google Fonts adalah layanan font gratis dari Google yang menyediakan ratusan tipografi open-source. Pada Flutter, Google Fonts dapat diintegrasikan melalui package `google_fonts` yang mengunduh dan men-cache font secara otomatis, memungkinkan penggunaan font seperti Nunito dan Poppins tanpa perlu menyertakan file font secara manual (Google Fonts, 2024).

---

## 5. Penjelasan Kode

### 4.1 Model — `mahasiswa.dart`

```dart
/// Model sederhana untuk menyimpan data mahasiswa
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

**Penjelasan:**
- `Mahasiswa` adalah model data sederhana menggunakan plain Dart class.
- Menggunakan keyword `final` agar data bersifat immutable (tidak dapat diubah setelah dibuat).
- Konstruktor menggunakan `const` dan named parameters dengan `required` untuk memastikan semua field wajib diisi.

---

### 4.2 Entry Point — `main.dart`

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4DB6AC),
          primary: const Color(0xFF4DB6AC),
          secondary: const Color(0xFFFF8A65),
          tertiary: const Color(0xFFF48FB1),
          surface: const Color(0xFFF9FFFE),
          background: const Color(0xFFF0FBF9),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          displayLarge: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: const Color(0xFF1A3C34),
          ),
          headlineMedium: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: const Color(0xFF1A3C34),
          ),
          bodyLarge: GoogleFonts.nunito(
            fontSize: 16,
            color: const Color(0xFF4A6B65),
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 14,
            color: const Color(0xFF7A9E98),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF4DB6AC),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4DB6AC),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            elevation: 2,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFB2DFDB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFB2DFDB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF4DB6AC), width: 2),
          ),
          labelStyle: GoogleFonts.nunito(
            color: const Color(0xFF7A9E98),
            fontSize: 14,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
```

**Penjelasan:**
- `main()` adalah fungsi utama yang menjalankan aplikasi dengan `runApp()`.
- `DataMahasiswaApp` adalah `StatelessWidget` karena hanya mengkonfigurasi tema dan tidak memerlukan state.
- `MaterialApp` digunakan sebagai root widget dengan `useMaterial3: true` untuk mengaktifkan Material Design 3.
- `ThemeData` mendefinisikan skema warna global menggunakan `ColorScheme.fromSeed()` dengan warna utama teal (`0xFF4DB6AC`) dan aksen orange (`0xFFFF8A65`).
- Konfigurasi `textTheme`, `appBarTheme`, `elevatedButtonTheme`, dan `inputDecorationTheme` ditetapkan secara global agar konsisten di semua halaman.
- Font **Nunito** dari Google Fonts digunakan sebagai font utama seluruh aplikasi.

---

### 4.3 Home Screen — `home_screen.dart`

```dart
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
```

**Penjelasan:**
- `HomeScreen` menggunakan `StatefulWidget` karena menyimpan dan memperbarui daftar mahasiswa.
- `_daftarMahasiswa` adalah `List<Mahasiswa>` yang menyimpan seluruh data secara in-memory.
- `_bukaForm()` menggunakan `Navigator.push` bertipe generik `<Mahasiswa>` sehingga dapat menerima nilai kembalian dari `FormScreen`. Jika data tidak null, langsung ditambahkan ke list via `setState()`.
- `_bukaProfil()` melakukan navigasi sederhana ke `ProfilScreen` tanpa menunggu nilai kembalian.
- Tampilan body bersifat kondisional: jika list kosong ditampilkan empty state, jika ada data ditampilkan `ListView.builder`.

---

### 4.4 Form Screen — `form_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Mahasiswa? _dataTersimpan;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (!_formKey.currentState!.validate()) return;

    final mhs = Mahasiswa(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      kelas: _kelasController.text.trim(),
    );

    setState(() => _dataTersimpan = mhs);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              'Data berhasil disimpan!',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4DB6AC),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _kirimData() {
    if (_dataTersimpan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Simpan data terlebih dahulu!',
            style: GoogleFonts.nunito(color: Colors.white),
          ),
          backgroundColor: const Color(0xFFFF8A65),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
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
      backgroundColor: const Color(0xFFF0FBF9),
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
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4DB6AC), Color(0xFF80CBC4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4DB6AC).withOpacity(0.30),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
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
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Isi semua field dengan benar ya~ 🌿',
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Form
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 14,
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
                      hint: 'Contoh: Siti Rahayu',
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
                      hint: 'Contoh: 2311102158',
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

            if (_dataTersimpan != null) ...[
              Text(
                'Data Tersimpan ✨',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A3C34),
                ),
              ),
              const SizedBox(height: 12),
              _DataPreviewCard(mahasiswa: _dataTersimpan!),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _kirimData,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Tambahkan ke Daftar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8A65),
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
        Icon(icon, size: 18, color: const Color(0xFF4DB6AC)),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A3C34),
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
      style: GoogleFonts.nunito(
          fontSize: 15, color: const Color(0xFF1A3C34)),
      decoration: InputDecoration(hintText: hint),
    );
  }
}

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
          colors: [Color(0xFFE0F7F4), Color(0xFFFCE4D6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: const Color(0xFF4DB6AC).withOpacity(0.35)),
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
        Icon(icon, size: 20, color: const Color(0xFF4DB6AC)),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF7A9E98),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A3C34),
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
- `FormScreen` menggunakan `StatefulWidget` karena mengelola state input dan data yang tersimpan sementara.
- Tiga `TextEditingController` digunakan untuk menangkap input nama, NIM, dan kelas.
- `GlobalKey<FormState>` digunakan untuk validasi form secara terpusat dengan `_formKey.currentState!.validate()`.
- Method `dispose()` wajib dipanggil untuk membebaskan memori dari controller saat widget dihapus dari tree.
- Alur dua langkah diterapkan: pengguna pertama **Simpan** (validasi & preview data), lalu **Tambahkan ke Daftar** (`Navigator.pop` membawa objek `Mahasiswa` kembali ke `HomeScreen`).
- `_dataTersimpan` bertipe nullable (`Mahasiswa?`) sebagai penjaga agar tombol kirim tidak bisa ditekan sebelum data disimpan.

---

### 4.5 Profil Screen — `profil_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ProfilScreen adalah StatelessWidget karena tidak memerlukan
/// pengelolaan state – hanya menampilkan informasi statis.
class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ── Avatar & Nama ─────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4DB6AC), Color(0xFF1A3C34)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4DB6AC).withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar lingkaran
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 3),
                    ),
                    child: const Center(
                      child: Icon(Icons.person_rounded,
                          size: 52, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Shafa Adila Santoso',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Flutter Developer',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // ── Info cards ────────────────────────────────────────────────
            _InfoSection(
              title: 'Informasi Akademik',
              icon: Icons.school_rounded,
              items: const [
                _InfoItem(
                  icon: Icons.badge_rounded,
                  label: 'NIM',
                  value: '2311102158',
                ),
                _InfoItem(
                  icon: Icons.class_rounded,
                  label: 'Kelas',
                  value: 'IF - 11 -01',
                ),
                _InfoItem(
                  icon: Icons.account_balance_rounded,
                  label: 'Program Studi',
                  value: 'Teknik Informatika',
                ),
                _InfoItem(
                  icon: Icons.location_city_rounded,
                  label: 'Universitas',
                  value: 'Telkom University Purwokerto',
                ),
              ],
            ),
            const SizedBox(height: 16),

            _InfoSection(
              title: 'Tentang Aplikasi',
              icon: Icons.info_rounded,
              items: const [
                _InfoItem(
                  icon: Icons.code_rounded,
                  label: 'Framework',
                  value: 'Flutter 3.x',
                ),
                _InfoItem(
                  icon: Icons.language_rounded,
                  label: 'Bahasa',
                  value: 'Dart',
                ),
                _InfoItem(
                  icon: Icons.assignment_rounded,
                  label: 'Mata Kuliah',
                  value: 'Pemrograman Mobile',
                ),
                _InfoItem(
                  icon: Icons.calendar_today_rounded,
                  label: 'Semester',
                  value: 'Genap 2024/2025',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Skill chips ────────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFF4DB6AC), size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'Teknologi yang Digunakan',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A3C34),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _SkillChip('Flutter', Color(0xFF4DB6AC)),
                      _SkillChip('Dart', Color(0xFF1A3C34)),
                      _SkillChip('Google Fonts', Color(0xFF00C2A8)),
                      _SkillChip('StatefulWidget', Color(0xFFCE93D8)),
                      _SkillChip('Navigator', Color(0xFFFF8A65)),
                      _SkillChip('Material 3', Color(0xFF388E3C)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Tombol kembali ─────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Kembali ke Beranda'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Reusable InfoSection (StatelessWidget) ────────────────────────────────────
class _InfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_InfoItem> items;

  const _InfoSection({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF4DB6AC), size: 22),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A3C34),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: item,
              )),
        ],
      ),
    );
  }
}

// ── InfoItem ──────────────────────────────────────────────────────────────────
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF4DB6AC).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF4DB6AC)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: const Color(0xFF7A9E98),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A3C34),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── SkillChip ─────────────────────────────────────────────────────────────────
class _SkillChip extends StatelessWidget {
  final String label;
  final Color color;

  const _SkillChip(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
```

**Penjelasan:**
- `ProfilScreen` menggunakan `StatelessWidget` karena hanya menampilkan informasi statis tanpa perlu manajemen state.
- Halaman ini menampilkan identitas developer, informasi akademik, detail aplikasi, dan teknologi yang digunakan.
- Menggunakan komponen reusable `_InfoSection`, `_InfoItem`, dan `_SkillChip` yang didefinisikan sebagai private class di file yang sama.
- Warna disenadakan dengan halaman Home menggunakan palet teal (`0xFF4DB6AC`) dan hijau gelap (`0xFF1A3C34`).

---

## 6. Konsep Flutter yang Diterapkan

| Konsep | Implementasi |
|---|---|
| StatelessWidget | `ProfilScreen`, `DataMahasiswaApp`, widget UI statis |
| StatefulWidget | `HomeScreen`, `FormScreen` yang memerlukan state |
| Navigator.push | Navigasi ke `FormScreen` dan `ProfilScreen` |
| Navigator.pop dengan hasil | `FormScreen` mengembalikan objek `Mahasiswa` ke `HomeScreen` |
| setState() | Memperbarui daftar mahasiswa di `HomeScreen` |
| TextEditingController | Mengambil input teks dari form |
| GlobalKey\<FormState\> | Validasi form secara terpusat |
| dispose() | Membebaskan resource controller |
| ListView.builder | Render list mahasiswa secara efisien |
| ThemeData | Tema global konsisten di seluruh aplikasi |

---

## 7. Alur Kerja Aplikasi

```
HomeScreen (list kosong / ada data)
    │
    ├── [Tambah Mahasiswa] ──► FormScreen
    │                              │
    │                         Input Nama, NIM, Kelas
    │                              │
    │                         [Simpan Data] ──► Validasi & Preview
    │                              │
    │                         [Tambahkan ke Daftar]
    │                              │
    │◄─────────── Navigator.pop(context, mahasiswa) ─────────────┘
    │
    └── [Icon Profil] ──► ProfilScreen ──► [Kembali]
```

---
## 8. Output

1. Home Screen
---
<img src="assets\home.JPG" alt="home" width="500"> 

2. Form Screen
---
<img src="assets\FORM.JPG" alt="Logo" width="500"> 

2. Profile Screen
---
<img src="assets\profile.JPG" alt="Logo" width="500"> 

## 9. Kesimpulan

Aplikasi Data Mahasiswa berhasil mengimplementasikan konsep dasar pengembangan mobile menggunakan Flutter, meliputi navigasi antar halaman dengan pengiriman data, manajemen state dengan `StatefulWidget`, validasi form, serta penerapan desain UI yang konsisten menggunakan Material 3 dan Google Fonts. Aplikasi dirancang dengan pemisahan tanggung jawab yang jelas antara model data, halaman UI, dan logika bisnis.

---

## 10. Referensi

Bracha, G. (2021). *The Dart Programming Language*. Addison-Wesley Professional.

Flutter Team. (2024). *Flutter documentation*. Google. https://docs.flutter.dev

Google Fonts. (2024). *google_fonts package for Flutter*. https://pub.dev/packages/google_fonts

Google Material. (2022). *Material Design 3*. Google. https://m3.material.io

Windmill, E. (2020). *Flutter in Action*. Manning Publications.

Zammetti, F. (2019). *Practical Flutter: Improve your Mobile Development with Google's Latest Open-Source SDK*. Apress.