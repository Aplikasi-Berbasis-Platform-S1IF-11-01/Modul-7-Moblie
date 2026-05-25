import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color maroon = Color(0xFF800000);
const Color darkMaroon = Color(0xFF5A0000);
const Color lightMaroon = Color(0xFFFFEAEA);

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
        primaryColor: maroon,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFFF5F5),
      ),
      home: const HomePage(),
    );
  }
}

class Mahasiswa {
  String nama;
  String nim;
  String kelas;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
  });
}

// HALAMAN HOME
// StatelessWidget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFEAEA),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.school,
              size: 90,
              color: maroon,
            ),
            const SizedBox(height: 20),
            Text(
              'Aplikasi Data Mahasiswa',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: maroon,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Aplikasi sederhana untuk menginput, menampilkan, mengubah, dan menghapus data mahasiswa.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Tambah Data Mahasiswa'),
              style: ElevatedButton.styleFrom(
                backgroundColor: maroon,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormMahasiswaPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Profil Developer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: darkMaroon,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilDeveloperPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// HALAMAN FORM MAHASISWA
// StatefulWidget + CRUD
class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  final List<Mahasiswa> daftarMahasiswa = [];

  int? indexEdit;

  bool get sedangEdit => indexEdit != null;

  void simpanData() {
    String nama = namaController.text.trim();
    String nim = nimController.text.trim();
    String kelas = kelasController.text.trim();

    if (nama.isEmpty || nim.isEmpty || kelas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua data wajib diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      if (sedangEdit) {
        daftarMahasiswa[indexEdit!] = Mahasiswa(
          nama: nama,
          nim: nim,
          kelas: kelas,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data mahasiswa berhasil diupdate!'),
            backgroundColor: Colors.green,
          ),
        );

        indexEdit = null;
      } else {
        daftarMahasiswa.add(
          Mahasiswa(
            nama: nama,
            nim: nim,
            kelas: kelas,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data mahasiswa berhasil disimpan!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      namaController.clear();
      nimController.clear();
      kelasController.clear();
    });
  }

  void editData(int index) {
    setState(() {
      indexEdit = index;
      namaController.text = daftarMahasiswa[index].nama;
      nimController.text = daftarMahasiswa[index].nim;
      kelasController.text = daftarMahasiswa[index].kelas;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Silakan ubah data pada form di atas.'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void hapusData(int index) {
    setState(() {
      daftarMahasiswa.removeAt(index);

      if (indexEdit == index) {
        indexEdit = null;
        namaController.clear();
        nimController.clear();
        kelasController.clear();
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data mahasiswa berhasil dihapus!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void konfirmasiHapus(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah kamu yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: maroon,
                foregroundColor: Colors.white,
              ),
              child: const Text('Hapus'),
              onPressed: () {
                Navigator.pop(context);
                hapusData(index);
              },
            ),
          ],
        );
      },
    );
  }

  void batalEdit() {
    setState(() {
      indexEdit = null;
      namaController.clear();
      nimController.clear();
      kelasController.clear();
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    kelasController.dispose();
    super.dispose();
  }

  Widget inputMahasiswa({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: maroon),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: maroon,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: maroon.withOpacity(0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget dataMahasiswaCard(Mahasiswa mahasiswa, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightMaroon,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: maroon.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: maroon,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  mahasiswa.nama,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: maroon,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          dataItem('NIM', mahasiswa.nim, Icons.badge),
          dataItem('Kelas', mahasiswa.kelas, Icons.class_),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMaroon,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    editData(index);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Hapus'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    konfirmasiHapus(index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataItem(String title, String value, IconData icon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: maroon.withOpacity(0.15),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: maroon, size: 20),
          const SizedBox(width: 10),
          Text(
            '$title: $value',
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget daftarDataMahasiswa() {
    if (daftarMahasiswa.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: lightMaroon,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              Icons.folder_off,
              size: 60,
              color: maroon.withOpacity(0.6),
            ),
            const SizedBox(height: 10),
            Text(
              'Belum ada data mahasiswa',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: maroon,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Silakan isi form lalu tekan tombol Simpan.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: daftarMahasiswa.asMap().entries.map((entry) {
        int index = entry.key;
        Mahasiswa mahasiswa = entry.value;

        return dataMahasiswaCard(mahasiswa, index);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Mahasiswa'),
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      sedangEdit
                          ? 'Edit Data Mahasiswa'
                          : 'Input Data Mahasiswa',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: maroon,
                      ),
                    ),
                    const SizedBox(height: 18),
                    inputMahasiswa(
                      label: 'Nama',
                      hint: 'Masukkan nama mahasiswa',
                      icon: Icons.person,
                      controller: namaController,
                    ),
                    const SizedBox(height: 14),
                    inputMahasiswa(
                      label: 'NIM',
                      hint: 'Masukkan NIM mahasiswa',
                      icon: Icons.badge,
                      controller: nimController,
                    ),
                    const SizedBox(height: 14),
                    inputMahasiswa(
                      label: 'Kelas',
                      hint: 'Masukkan kelas mahasiswa',
                      icon: Icons.class_,
                      controller: kelasController,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: Icon(sedangEdit ? Icons.update : Icons.save),
                      label: Text(sedangEdit ? 'Update' : 'Simpan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maroon,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: simpanData,
                    ),
                    if (sedangEdit) ...[
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.cancel),
                        label: const Text('Batal Edit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade700,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        onPressed: batalEdit,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Daftar Data Mahasiswa',
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: maroon,
                      ),
                    ),
                    const SizedBox(height: 15),
                    daftarDataMahasiswa(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HALAMAN PROFIL DEVELOPER
// StatelessWidget
class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: maroon,
              child: Icon(
                Icons.account_circle,
                size: 90,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Naufal Luthfi Assary',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: maroon,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mahasiswa S1 Teknik Informatika',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: maroon.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.code, color: maroon),
                    title: Text(
                      'Mata Kuliah',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Praktikum Aplikasi Berbasis Platform',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone_android,
                      color: maroon,
                    ),
                    title: Text(
                      'Project',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Aplikasi Data Mahasiswa',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.folder,
                      color: maroon,
                    ),
                    title: Text(
                      'Nama Project',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('modul_7'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: maroon,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}