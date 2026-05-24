<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 7 <br> DATA MAHASISWA (NAVIGATOR & FORM) </h3>
  <br />
  <br />
  <img src="assets/logo.jpeg" alt="Logo" width="300" onerror="this.style.display='none'">
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Qonita Rahayu Atmi</strong><br>
    <strong>2311102128</strong><br>
    <strong>S1 IF-11-REG01</strong><br>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>
  </p>
  <br />
  <h3>Asisten Praktikum :</h3>
  <p>
    <strong>Apri Pandu Wicaksono</strong><br>
    <strong>Rangga Pradarrell Fathi</strong><br>
  </p>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE<br>FAKULTAS INFORMATIKA <br>TELKOM UNIVERSITY PURWOKERTO <br>2026</h3>
</div>

---

# A. Dasar Teori

- **StatelessWidget** adalah widget yang bersifat statis atau tidak berubah sepanjang siklus hidup aplikasi setelah dibuat. Widget ini tidak memiliki *state* internal yang dapat dimodifikasi secara dinamis. Informasi atau parameter yang diterimanya hanya bersifat *read-only* yang dideklarasikan melalui variabel instansi final. StatelessWidget sangat cocok digunakan untuk menampilkan komponen antarmuka pengguna yang statis, seperti ikon, label teks, gambar, atau halaman profil yang tidak merespons interaksi perubahan data internal.

- **StatefulWidget** adalah widget dinamis yang tampilan atau isinya dapat berubah secara langsung selama runtime sebagai respons terhadap interaksi pengguna, penerimaan data eksternal, atau berjalannya waktu. Kelas ini berpasangan dengan kelas `State` yang menyimpan status internal dari widget tersebut. Ketika state berubah melalui pemanggilan fungsi `setState()`, kerangka kerja Flutter akan memicu proses pembangunan kembali (*rebuild*) dari elemen visual terkait sehingga perubahan data dapat segera dirender di layar perangkat. Contoh penggunaannya meliputi formulir input, daftar dinamis, tombol counter, dan toggle switch.

- **Navigation (Navigator.push & Navigator.pop)** adalah mekanisme manajemen navigasi halaman dalam Flutter yang bekerja seperti tumpukan (*stack*). 
  - **`Navigator.push`** berfungsi untuk menumpuk halaman baru ke atas halaman yang sedang aktif. Halaman sebelumnya tetap dipertahankan di dalam memori di bawah halaman baru tersebut.
  - **`Navigator.pop`** berfungsi untuk menghapus halaman paling atas dari tumpukan, sehingga pengguna dapat kembali ke halaman sebelumnya. Pada proses pop ini, kita juga dapat mengembalikan atau meneruskan data dari halaman aktif kembali ke halaman pemanggil secara asinkron.

- **Google Fonts Package** adalah pustaka eksternal resmi dari Flutter yang memudahkan pengembang dalam menerapkan ribuan font yang tersedia di direktori Google Fonts secara dinamis tanpa harus mengunduh berkas font `.ttf` atau `.otf` secara manual ke dalam folder aset proyek. Pustaka ini memuat font secara instan atau menyimpannya untuk penggunaan offline, sehingga meningkatkan estetika tipografi aplikasi secara signifikan.

- **AppBar** adalah komponen antarmuka berupa  aplikasi di bagian atas layar yang biasanya memuat judul halaman, tombol aksi navigasi, serta dapat didekorasi menggunakan gradien warna agar tampil lebih premium.

- **Container** adalah widget  yang menggabungkan kemampuan dekorasi (seperti warna latar, gradien, bayangan shadow, border radius, serta margin dan padding) untuk menyusun serta memformat layout anak widget-nya secara fleksibel.

- **Column** adalah widget tata letak yang menyusun widget di dalamnya secara vertikal dari atas ke bawah.

- **ElevatedButton** adalah tombol material dengan latar belakang terisi warna yang memiliki efek elevasi (bayangan halus) untuk menunjukkan bahwa tombol tersebut dapat ditekan oleh pengguna.

---

# B. Kode Program

Berikut adalah rincian fungsionalitas, kode program lengkap, serta penjelasan detail berserta **kode program** dari masing-masing halaman:

### 1. Home

Halaman ini berfungsi sebagai beranda utama aplikasi yang menampilkan daftar nama mahasiswa aktif.

- **Kode Program (`lib/main.dart`):**

```dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student_form.dart';
import 'developer_profile.dart';

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
          seedColor: const Color(0xFF2563EB), // Modern Blue
          primary: const Color(0xFF2563EB),
          secondary: const Color(0xFF1E40AF), // Deep Blue
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Latar Belakang Putih
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Model untuk Data Mahasiswa
class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
  });
}

// HOME SCREEN (StatefulWidget untuk mengelola daftar mahasiswa secara dinamis)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Inisialisasi daftar mahasiswa awal
  final List<Mahasiswa> _daftarMahasiswa = [
    Mahasiswa(nama: 'Qonita Rahayu Atmi', nim: '2311102128', kelas: 'S1 IF-11-REG01'),
    Mahasiswa(nama: 'Dimas Fanny H', nim: '1234567890', kelas: 'S1 IF-11-A'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          'Data Mahasiswa',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
        shadowColor: const Color(0xFF1E40AF).withOpacity(0.3),
        actions: [
          // Ikon profil di atas kanan App Bar untuk menavigasi ke halaman Profil Developer
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            tooltip: 'Profil Developer',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeveloperProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Selamat Datang / Portal Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E40AF).withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.school, color: Colors.white, size: 30),
                      const SizedBox(width: 12),
                      Text(
                        'Portal Akademik',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Kelola data mahasiswa kelas IF dengan mudah, cepat, dan efisien.',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF1E40AF),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        onPressed: () async {
                          // Menavigasi ke halaman form dan menunggu kiriman data mahasiswa baru (Navigator.push)
                          final newMahasiswa = await Navigator.push<Mahasiswa>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudentFormScreen(),
                            ),
                          );

                          // Jika data mahasiswa berhasil dikembalikan, tambahkan ke list dan refresh UI
                          if (newMahasiswa != null) {
                            setState(() {
                              _daftarMahasiswa.add(newMahasiswa);
                            });
                          }
                        },
                        icon: const Icon(Icons.add_circle_outline, size: 18),
                        label: Text(
                          'Tambah Data',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Judul Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar Mahasiswa Aktif',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_daftarMahasiswa.length} Total',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF475569),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Daftar Mahasiswa
            Expanded(
              child: _daftarMahasiswa.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2F6),
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
                            ),
                            child: const Icon(
                              Icons.people_alt_outlined,
                              size: 60,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Belum Ada Data Mahasiswa',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Gunakan tombol "Tambah Data" untuk menginput.',
                            style: GoogleFonts.outfit(
                              fontSize: 13,
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: _daftarMahasiswa.length,
                      itemBuilder: (context, index) {
                        final mahasiswa = _daftarMahasiswa[index];
                        final isDev = mahasiswa.nim == '2311102128';

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDev ? const Color(0xFF2563EB).withOpacity(0.3) : const Color(0xFFE2E8F0),
                              width: isDev ? 1.5 : 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isDev
                                    ? const Color(0xFF2563EB).withOpacity(0.06)
                                    : const Color(0xFF0F172A).withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Avatar Mahasiswa dengan inisial nama
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: isDev
                                        ? [const Color(0xFF1E40AF), const Color(0xFF3B82F6)]
                                        : [const Color(0xFF60A5FA), const Color(0xFF93C5FD)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: (isDev ? const Color(0xFF1E40AF) : const Color(0xFF3B82F6))
                                          .withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    mahasiswa.nama.isNotEmpty ? mahasiswa.nama[0].toUpperCase() : 'M',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Informasi Mahasiswa
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            mahasiswa.nama,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: const Color(0xFF1E293B),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (isDev)
                                          Container(
                                            margin: const EdgeInsets.only(left: 6),
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFDBEAFE),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              'Dev',
                                              style: GoogleFonts.outfit(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF1E40AF),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'NIM: ${mahasiswa.nim}',
                                      style: GoogleFonts.outfit(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF64748B),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    // Kelas Badge
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5F9),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.class_outlined, size: 12, color: Color(0xFF64748B)),
                                          const SizedBox(width: 4),
                                          Text(
                                            mahasiswa.kelas,
                                            style: GoogleFonts.outfit(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF475569),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Tombol Hapus Mahasiswa
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
                                onPressed: () {
                                  setState(() {
                                    _daftarMahasiswa.removeAt(index);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Data ${mahasiswa.nama} berhasil dihapus.'),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: const Color(0xFF1E293B),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- **Penjelasan Penggunaan Elemen:**

  * **StatefulWidget**
    * **Penjelasan:** `HomeScreen` dideklarasikan sebagai `StatefulWidget` karena halaman ini memiliki fungsional untuk mengelola, menyimpan, dan memperbarui status (*state*) dari daftar data mahasiswa secara dinamis selama aplikasi berjalan. Ketika terjadi penambahan data mahasiswa baru atau penghapusan data mahasiswa yang sudah ada, widget ini memicu fungsi `setState()`. Pemanggilan `setState()` ini secara otomatis menginstruksikan kerangka kerja (*framework*) Flutter untuk melakukan rekonstruksi atau pembangunan kembali (*rebuild*) pada pohon widget (*widget tree*) terkait. Hal ini memastikan bahwa perubahan data pada variabel internal `_daftarMahasiswa` langsung secara instan dan akurat tanpa perlu memulai ulang aplikasi.
    * **Kode Program:**
      ```dart
      class HomeScreen extends StatefulWidget {
        const HomeScreen({super.key});

        @override
        State<HomeScreen> createState() => _HomeScreenState();
      }

      class _HomeScreenState extends State<HomeScreen> {
        final List<Mahasiswa> _daftarMahasiswa = [...];
        // ...
      }
      ```

  * **StatelessWidget**
    * **Penjelasan:** Kelas `MyApp` dikonstruksi menggunakan `StatelessWidget`, Widget ini  bertugas untuk menginisialisasi konfigurasi awal `MaterialApp`, menentukan parameter tema visual global berupa skema warna putih-biru, serta menetapkan `HomeScreen` sebagai halaman utama (*home*). Karena properti dan konfigurasi tema tersebut bernilai konstan dan tidak memerlukan perubahan kondisi internal secara dinamis.
    * **Kode Program:**
      ```dart
      class MyApp extends StatelessWidget {
        const MyApp({super.key});

        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            title: 'Data Mahasiswa',
            theme: ThemeData(...),
            home: const HomeScreen(),
          );
        }
      }
      ```

  * **Navigator.push & Navigator.pop**
    * **Penjelasan:** Navigasi halaman diimplementasikan dengan sangat jelas menggunakan `Navigator.push` untuk menumpuk (*push*) halaman baru ke atas tumpukan navigasi aktif. Pada halaman utama ini, terdapat dua implementasi `Navigator.push`. Pertama, digunakan untuk berpindah ke halaman profil developer (`DeveloperProfileScreen`). Kedua, diimplementasikan secara asinkron (`await`) saat berpindah ke `StudentFormScreen` untuk menanti kembalinya objek data mahasiswa baru. Ketika pengguna menyelesaikan pengisian formulir dan menekan tombol simpan, data tersebut akan dikembalikan dari halaman formulir menggunakan `Navigator.pop`, kemudian ditangkap di beranda untuk ditambahkan ke dalam list.
    * **Kode Program:**
      ```dart
      // Navigasi asinkron ke Form (Menanti data balik)
      final newMahasiswa = await Navigator.push<Mahasiswa>(
        context,
        MaterialPageRoute(builder: (context) => const StudentFormScreen()),
      );

      // Navigasi ke Profil Developer di AppBar
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DeveloperProfileScreen()),
        );
      }
      ```

  * **Google Fonts package**
    * **Penjelasan:** `google_fonts` digunakan untuk meningkatkan kualitas estetika dan keterbacaan (*readability*) teks pada antarmuka aplikasi. Pada level global `MaterialApp`, font *Outfit* dideklarasikan sebagai tema teks utama aplikasi agar seluruh elemen teks memiliki struktur modern secara konsisten. Sementara itu, font *Poppins* digunakan secara spesifik untuk memberikan penekanan visual yang lebih tebal dan kokoh pada teks-teks judul penting, seperti judul banner portal akademik, untuk menciptakan hierarki visual yang profesional dan premium.
    * **Kode Program:**
      ```dart
      theme: ThemeData(
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )
      ```

  * **AppBar**
    * **Penjelasan:** Widget `AppBar` digunakan sebagai navigasi statis yang terletak secara konsisten di bagian atas layar halaman utama, berfungsi untuk menampilkan judul aplikasi "Data Mahasiswa" dengan posisi rata tengah (*centered title*) agar tampak simetris.Selain itu, AppBar ini juga mengintegrasikan properti `actions` yang memuat sebuah `IconButton` berikon orang (`Icons.person`) di sudut kanan atas sebagai akses navigasi langsung menuju halaman profil.
    * **Kode Program:**
      ```dart
      appBar: AppBar(
        title: Text('Data Mahasiswa', style: GoogleFonts.outfit(...)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () { Navigator.push(...); },
          ),
        ],
      )
      ```

  * **Container**
    * **Penjelasan:** Widget `Container` digunakan secara ekstensif sebagai blok pembungkus modular yang fleksibel untuk mendekorasi tata letak antarmuka pengguna. Di dalam halaman utama ini, Container digunakan untuk membangun banner dekoratif "Portal Akademik" dan kartu-kartu item mahasiswa.
    * **Kode Program:**
      ```dart
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)]),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E40AF).withOpacity(0.25),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(...),
      )
      ```

  * **Column**
    * **Penjelasan:** Widget `Column` sebagai pengatur tata letak searah (*layout widget*) yang menyusun widget di dalamnya secara vertikal dari arah atas ke bawah secara teratur. Pada halaman beranda, Column menyusun tata letak utama aplikasi mulai dari banner portal akademik di bagian atas, dilanjutkan dengan teks judul bagian daftar mahasiswa aktif, dan diakhiri dengan daftar dinamis `ListView` yang dibungkus oleh `Expanded`. 
    * **Kode Program:**
      ```dart
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(/* Banner Akademik */),
          Padding(/* Section Judul */),
          Expanded(/* List Mahasiswa */),
        ],
      )
      ```

  * **ElevatedButton**
    * **Penjelasan:** Widget `ElevatedButton.icon` digunakan untuk membuat tombol aksi utama yang interaktif dengan tampilan yang menonjol dan memiliki efek bayangan elevasi material yang responsif saat disentuh. Tombol ini diberi label "Tambah Data" dan dilengkapi dengan ikon penambahan (`Icons.add_circle_outline`), untuk menyelaraskannya dengan visual banner gradien, 
    * **Kode Program:**
      ```dart
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF1E40AF),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () async { ... },
        icon: const Icon(Icons.add_circle_outline, size: 18),
        label: Text('Tambah Data'),
      )
      ```

---

### 2. Form Mahasiswa

Halaman ini berfungsi sebagai form input penambahan data mahasiswa baru.

- **Kode Program (`lib/student_form.dart`):**

```dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart'; // Impor model Mahasiswa dari main.dart

// FORM MAHASISWA (StatefulWidget untuk mengelola input teks & validasi)
class StudentFormScreen extends StatefulWidget {
  const StudentFormScreen({super.key});

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      // Membuat objek mahasiswa baru
      final newStudent = Mahasiswa(
        nama: _namaController.text.trim(),
        nim: _nimController.text.trim(),
        kelas: _kelasController.text.trim(),
      );

      // Menampilkan SnackBar mengambang hijau indah sebagai notifikasi keberhasilan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Berhasil Disimpan!',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Data ${newStudent.nama} telah ditambahkan ke sistem.',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: const Color(0xFF10B981), // Emerald Green
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(16),
        ),
      );

      // Mengembalikan objek mahasiswa baru ke HomeScreen (Navigator.pop)
      Navigator.pop(context, newStudent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          'Form Mahasiswa',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Kartu Informasi
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2F6),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.edit_note, color: Color(0xFF2563EB), size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Isi formulir berikut dengan benar untuk menambahkan data mahasiswa baru.',
                        style: GoogleFonts.outfit(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Formulir
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // INPUT NAMA
                    _buildTextFormField(
                      controller: _namaController,
                      label: 'Nama Lengkap',
                      hint: 'Masukkan Nama Lengkap',
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // INPUT NIM
                    _buildTextFormField(
                      controller: _nimController,
                      label: 'NIM (Nomor Induk Mahasiswa)',
                      hint: 'Masukkan NIM Anda (contoh: 2311102128)',
                      icon: Icons.badge_outlined,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'NIM tidak boleh kosong';
                        }
                        if (value.trim().length < 5) {
                          return 'NIM minimal 5 digit';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                          return 'NIM harus berupa angka';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // INPUT KELAS
                    _buildTextFormField(
                      controller: _kelasController,
                      label: 'Kelas',
                      hint: 'Masukkan Kelas (contoh: S1 IF-11-REG01)',
                      icon: Icons.class_outlined,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Kelas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // TOMBOL SIMPAN
                    Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1E40AF).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: _simpanData,
                        icon: const Icon(Icons.save_outlined, color: Colors.white),
                        label: Text(
                          'Simpan Data',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: GoogleFonts.outfit(
          fontSize: 15,
          color: const Color(0xFF1E293B),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.outfit(
            color: const Color(0xFF64748B),
            fontSize: 14,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.outfit(
            color: const Color(0xFF94A3B8),
            fontSize: 13,
          ),
          prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
```

- **Penjelasan Penggunaan Elemen:**

  * **StatefulWidget**
    * **Penjelasan:** Kelas `StudentFormScreen` beserta state pendampingnya `_StudentFormScreenState` diimplementasikan sebagai `StatefulWidget` karena halaman ini mengelola data masukan (*input data*) yang berubah secara dinamis selama runtime. State dinamis ini sangat diperlukan untuk melacak teks yang diketik oleh pengguna secara real-time pada setiap input melalui objek `TextEditingController`, memproses input, serta menyimpan status validasi dari form tersebut secara interaktif agar dapat menampilkan pesan kesalahan (*error message*) secara langsung apabila data yang dimasukkan tidak valid.
    * **Kode Program:**
      ```dart
      class StudentFormScreen extends StatefulWidget {
        const StudentFormScreen({super.key});

        @override
        State<StudentFormScreen> createState() => _StudentFormScreenState();
      }

      class _StudentFormScreenState extends State<StudentFormScreen> {
        final _formKey = GlobalKey<FormState>();
        final _namaController = TextEditingController();
        // ...
      }
      ```

  * **StatelessWidget**
    * **Penjelasan:** `StatelessWidget`. Kelas `MyApp` bertugas menyusun konfigurasi tema visual putih-biru, mengatur pustaka font secara global, serta inisialisasi halaman formulir. Dengan demikian, `StatelessWidget` berperan sebagai fondasi statis yang menyediakan tema global dan struktur dasar navigasi sebelum halaman formulir interaktif dijalankan.
    * **Kode Program:**
      ```dart
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
                seedColor: const Color(0xFF2563EB),
                primary: const Color(0xFF2563EB),
                secondary: const Color(0xFF1E40AF),
              ),
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              textTheme: GoogleFonts.outfitTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: const HomeScreen(),
          );
        }
      }
      ```

  * **Navigator.push & Navigator.pop**
    * **Penjelasan:** Metode navigasi `Navigator.pop`  untuk mengatur alur kembali ke halaman sebelumnya. Terdapat dua kondisi pemanggilan `Navigator.pop` di halaman ini. Pertama, saat pengguna berhasil mengisi data dengan valid dan menekan tombol "Simpan Data", `Navigator.pop(context, newStudent)` dipanggil untuk menutup halaman form sekaligus mengirimkan objek mahasiswa baru (`newStudent`) kembali ke halaman pemanggil. Kedua, `Navigator.pop(context)` dipanggil pada tombol navigasi kembali di AppBar untuk membatalkan proses pengisian formulir.
    * **Kode Program:**
      ```dart
      // Menyimpan data dan mengembalikan objek baru
      Navigator.pop(context, newStudent);

      // Tombol kembali di AppBar
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      )
      ```

  * **Google Fonts package**
    * **Penjelasan:** Integrasi paket `google_fonts` dilakukan untuk merancang tipografi teks isian formulir agar terlihat rapi dan profesional. Font *Outfit* diterapkan secara default untuk menampilkan label teks kolom input (*labelText*) dan teks petunjuk pengisian (*hintText*) agar ramah di mata pengguna. Sementara itu, font *Poppins* digunakan untuk merancang teks penanda visual penting, seperti notifikasi pemberitahuan SnackBar sukses yang bertuliskan "Berhasil Disimpan!" serta teks tulisan tombol "Simpan Data" agar memiliki karakteristik tulisan yang tegas dan modern.
    * **Kode Program:**
      ```dart
      Text(
        'Berhasil Disimpan!',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )
      ```

  * **AppBar**
    * **Penjelasan:** Widget `AppBar` pada halaman formulir ini berfungsi sebagai bilah navigasi atas berwarna gradien biru premium yang menampilkan judul halaman "Form Mahasiswa". Untuk pengguna, properti `leading` diisi dengan widget `IconButton` berikon anak panah kembali (`Icons.arrow_back_ios_new`) yang dikonfigurasi secara eksplisit untuk fungsi pembatalan pengisian form dan mengembalikan pengguna kembali ke beranda.
    * **Kode Program:**
      ```dart
      appBar: AppBar(
        title: Text('Form Mahasiswa', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      )
      ```

  * **Container**
    * **Penjelasan:** Widget `Container` digunakan untuk menyusun kartu informasi panduan pengisian di bagian atas halaman dengan latar belakang abu-abu terang. 
    * **Kode Program:**
      ```dart
      Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton.icon(...),
      )
      ```

  * **Column**
    * **Penjelasan:** Tata letak kolom vertikal (`Column`) digunakan pada halaman formulir untuk menata komponen-komponen input form secara berurutan dari atas ke bawah. Column menyusun kartu petunjuk pengisian di paling atas, diikuti dengan jarak pemisah (`SizedBox`), lalu form input utama yang di dalamnya tersusun secara berurutan kolom teks untuk Nama Lengkap, nomor induk mahasiswa (NIM), kolom kelas, dan diakhiri secara simetris dengan tombol aksi penyimpanan data di bagian paling bawah.
    * **Kode Program:**
      ```dart
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(/* Info Card */),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextFormField(/* Nama */),
                _buildTextFormField(/* NIM */),
                _buildTextFormField(/* Kelas */),
              ]
            )
          )
        ],
      )
      ```

  * **ElevatedButton**
    * **Penjelasan:** Tombol "Simpan Data" menggunakan widget `ElevatedButton.icon` yang diposisikan di dalam Container berdekorasi gradien warna. Agar visual gradien pada Container latar belakangnya dapat terlihat dengan jelas , warna latar belakang `ElevatedButton` dikonfigurasi menjadi transparan (`Colors.transparent`) dengan efek bayangan bawaan yang dihilangkan, sehingga menghasilkan tombol bermaterial gradien biru.
    * **Kode Program:**
      ```dart
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: _simpanData,
        icon: const Icon(Icons.save_outlined, color: Colors.white),
        label: Text('Simpan Data', style: GoogleFonts.poppins(...)),
      )
      ```

---

### 3. Profil Developer

Halaman ini berfungsi sebagai profil dan informasi data diri developer.

- **Kode Program (`lib/developer_profile.dart`):**

```dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// PROFIL DEVELOPER (StatelessWidget)
class DeveloperProfileScreen extends StatelessWidget {
  const DeveloperProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          'Profil Developer',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Card Profil
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    // Bingkai Avatar
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1E40AF).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.face_retouching_natural,
                          size: 65,
                          color: Color(0xFF1E40AF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Nama Developer
                    Text(
                      'Qonita Rahayu Atmi',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Badge NIM
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'NIM: 2311102128',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Nama Kelas
                    Text(
                      'S1 IF-11-REG01',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Detail Informasi Akademik
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Pendidikan',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildProfileItem(
                      icon: Icons.school_outlined,
                      title: 'Program Studi',
                      value: 'S1 Informatika',
                    ),
                    const Divider(height: 24, color: Color(0xFFF1F5F9)),
                    _buildProfileItem(
                      icon: Icons.business_outlined,
                      title: 'Fakultas',
                      value: 'Fakultas Informatika',
                    ),
                    const Divider(height: 24, color: Color(0xFFF1F5F9)),
                    _buildProfileItem(
                      icon: Icons.account_balance_outlined,
                      title: 'Universitas',
                      value: 'Telkom University Purwokerto',
                    ),
                    const Divider(height: 24, color: Color(0xFFF1F5F9)),
                    _buildProfileItem(
                      icon: Icons.integration_instructions_outlined,
                      title: 'Praktikum',
                      value: 'Aplikasi Berbasis Platform',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Kembali
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E40AF),
                  side: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 20),
                label: Text(
                  'Kembali ke Beranda',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF334155),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

- **Penjelasan Penggunaan Elemen:**

  * **StatefulWidget**
    * **Penjelasan:** Meskipun halaman `DeveloperProfileScreen` dirancang sebagai `StatelessWidget`, pemanggilannya berasal dari `HomeScreen` yang merupakan `StatefulWidget`. Pada halaman utama, interaksi pengguna saat menekan ikon profil di `AppBar` oleh state dinamis untuk memicu perpindahan navigasi menuju halaman profil developer ini.
    * **Kode Program:**
      ```dart
      // Pemanggilan halaman profil pengembang dari HomeScreen (StatefulWidget)
      IconButton(
        icon: const Icon(Icons.person, color: Colors.white),
        tooltip: 'Profil Developer',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DeveloperProfileScreen(),
            ),
          );
        },
      )
      ```

  * **StatelessWidget**
    * **Penjelasan:** Kelas `DeveloperProfileScreen` dibuat `StatelessWidget` karena halaman ini menampilkan komponen antarmuka pengguna. Informasi yang ditampilkan meliputi foto profil , nama, nomor induk mahasiswa (NIM), kelas, program studi, dan universitas. Penggunaan `StatelessWidget` membuat struktur halaman menjadi lebih sederhana, meningkatkan efisiensi penggunaan memori, serta mengurangi proses pemantauan perubahan data oleh Flutter.
    * **Kode Program:**
      ```dart
      class DeveloperProfileScreen extends StatelessWidget {
        const DeveloperProfileScreen({super.key});

        @override
        Widget build(BuildContext context) {
          return Scaffold(...);
        }
      }
      ```

  * **Navigator.push & Navigator.pop**
    * **Penjelasan:** Fungsi navigasi halaman `Navigator.pop(context)` diimplementasikan pada halaman profil developer untuk memberikan rute kembali bagi pengguna setelah selesai membaca detail biodata pengembang. 
    * **Kode Program:**
      ```dart
      // Tombol kembali di OutlinedButton bawah
      onPressed: () => Navigator.pop(context),

      // Tombol kembali di bilah AppBar leading
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
      )
      ```

  * **Google Fonts package**
    * **Penjelasan:** Paket `google_fonts` digunakan pada halaman profil untuk mengatur tampilan teks agar lebih menarik dan mudah dibaca. Font *Poppins* diterapkan pada nama pengembang dan judul informasi karena memiliki karakter huruf. Sementara itu, font *Outfit* digunakan pada informasi pendukung seperti NIM, program studi, fakultas, dan universitas karena tampilannya sederhana, rapi, dan nyaman dibaca. 
    * **Kode Program:**
      ```dart
      Text(
        'Qonita Rahayu Atmi',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      )
      ```

  * **AppBar**
    * **Penjelasan:** Widget `AppBar` digunakan untuk menampilkan judul halaman “Profil Developer” di bagian atas layar. `AppBar` menggunakan gradien biru agar sesuai dengan tema aplikasi serta memiliki tombol `IconButton(Icons.arrow_back_ios_new)` untuk kembali ke halaman sebelumnya.
    * **Kode Program:**
      ```dart
      appBar: AppBar(
        title: Text('Profil Developer', style: GoogleFonts.outfit(...)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      )
      ```

  * **Container**
    * **Penjelasan:**Widget `Container` digunakan sebagai tampilan profil agar informasi terlihat lebih rapi dan terstruktur. `Container` dimanfaatkan untuk membuat bingkai foto profil, kartu biodata, serta bagian informasi pendidikan dengan tambahan dekorasi seperti gradien dan `boxShadow` agar tampilan halaman terlihat lebih menarik.
    * **Kode Program:**
      ```dart
      Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)]),
          shape: BoxShape.circle,
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(Icons.face_retouching_natural, size: 65),
        ),
      )
      ```

  * **Column**
    * **Penjelasan:** Widget `Column` digunakan untuk menyusun seluruh komponen pada halaman profil secara vertikal dari atas ke bawah, mulai dari bagian foto dan biodata, informasi pendidikan, hingga tombol kembali ke halaman utama sehingga tampilan halaman menjadi lebih rapi dan terstruktur.
    * **Kode Program:**
      ```dart
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(/* Header Card Profil */),
          const SizedBox(height: 24),
          Container(/* Detail Pendidikan */),
          const SizedBox(height: 24),
          OutlinedButton.icon(/* Tombol Kembali */),
        ],
      )
      ```

  * **ElevatedButton**
    * **Penjelasan:** Widget `OutlinedButton.icon` digunakan sebagai tombol aksi untuk kembali ke halaman utama. Tombol ini memiliki tampilan outline dengan garis tepi berwarna biru sehingga terlihat sederhana, modern, dan tetap sesuai dengan desain halaman profil.
    * **Kode Program:**
      ```dart
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF1E40AF),
          side: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
        ),
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        label: Text('Kembali ke Beranda', style: GoogleFonts.poppins(...)),
      )
      ```

---

# C. Hasil Tampilan (Screenshot)

### 1. Halaman Utama (Beranda / Home)

![Hasil Program - Tampilan Home Page](assets/1.png)

---

### 2. Halaman Formulir Input (Form Mahasiswa)

![Hasil Program - Tampilan Form Input](assets/2.png)

![Hasil Program - Tampilan Form Input](assets/3.png)
---

### 3. Tampilan Notifikasi Berhasil (SnackBar)

![Hasil Program - Tampilan Notifikasi SnackBar](assets/4.png)

---

### 4. Halaman Hapus

![Hasil Program - Hapus](assets/5.png)

---

### 5. Halaman Profil Developer (Developer Profile)

![Hasil Program - Tampilan Profil Developer](assets/6.png)

---

# D. Kesimpulan

Praktikum Modul 7 berhasil mengimplementasikan aplikasi Flutter dengan struktur modular melalui pemisahan halaman `HomeScreen`, `StudentFormScreen`, dan `DeveloperProfileScreen`. Aplikasi ini menerapkan `StatefulWidget` untuk mengelola data yang bersifat dinamis serta `StatelessWidget` untuk menampilkan informasi statis secara efisien. Navigasi antarhalaman dilakukan menggunakan `Navigator.push` dan `Navigator.pop`, sedangkan antarmuka aplikasi dirancang dengan tema modern menggunakan `Google Fonts`, `AppBar`, `Container`, `Column`, dan `SnackBar` sehingga tampilan aplikasi menjadi lebih rapi, interaktif, dan mudah dipelihara.