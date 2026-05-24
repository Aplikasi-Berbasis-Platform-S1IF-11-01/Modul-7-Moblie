import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}


/// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
      ),
      home: const HomePage(),
    );
  }
}

/// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D4ED8),
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1D4ED8),
              Color(0xFF60A5FA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.school_rounded,
                size: 90,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "Aplikasi Data Mahasiswa",
              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Modul 7 Flutter",

              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 50),

            /// BUTTON FORM
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit_note_rounded),
                label: const Text("Form Mahasiswa"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1D4ED8),
                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const FormMahasiswaPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON PROFILE
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.person_rounded),
                label: const Text("Profil Developer"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
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

/// FORM MAHASISWA PAGE
class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() =>
      _FormMahasiswaPageState();
}

class _FormMahasiswaPageState
    extends State<FormMahasiswaPage> {
  final TextEditingController namaController =
  TextEditingController();

  final TextEditingController nimController =
  TextEditingController();

  final TextEditingController kelasController =
  TextEditingController();

  String nama = "";
  String nim = "";
  String kelas = "";

  void simpanData() {
    setState(() {
      nama = namaController.text;
      nim = nimController.text;
      kelas = kelasController.text;
    });

    /// SNACKBAR HIJAU
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Data berhasil disimpan!",
        ),

        backgroundColor: Colors.green,

        behavior: SnackBarBehavior.floating,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Mahasiswa"),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D4ED8),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.account_circle,
                size: 80,
                color: Color(0xFF1D4ED8),
              ),
            ),

            const SizedBox(height: 25),

            /// INPUT NAMA
            TextField(
              controller: namaController,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Nama",
                prefixIcon: const Icon(Icons.person),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// INPUT NIM
            TextField(
              controller: nimController,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "NIM",
                prefixIcon: const Icon(Icons.badge),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// INPUT KELAS
            TextField(
              controller: kelasController,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Kelas",
                prefixIcon: const Icon(Icons.class_),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// BUTTON SIMPAN
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: simpanData,
                icon: const Icon(Icons.save),
                label: const Text("Simpan Data"),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF1D4ED8),

                  foregroundColor: Colors.white,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// HASIL DATA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1D4ED8),
                    Color(0xFF2563EB),
                    Color(0xFF60A5FA),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.folder_shared,
                        color: Colors.white,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Data Mahasiswa",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    color: Colors.white70,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Nama : $nama",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "NIM : $nim",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Kelas : $kelas",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// BUTTON KEMBALI
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.arrow_back,
                ),

                label: const Text("Kembali"),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF1E3A8A),

                  foregroundColor: Colors.white,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Developer"),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D4ED8),
      ),

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1D4ED8),
              Color(0xFF60A5FA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(30),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// FOTO PROFILE
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                          color:
                          const Color(0xFF1D4ED8),
                          width: 4,
                        ),
                      ),

                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor:
                        Color(0xFF1D4ED8),

                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// NAMA
                    Text(
                      "Andreas Besar Wibowo",
                      textAlign: TextAlign.center,

                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color:
                        const Color(0xFF1D4ED8),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Mahasiswa Rekayasa Informatika '23",

                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// CARD INFO
                    Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color:
                        const Color(0xFFEFF6FF),

                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.school,
                                color:
                                Color(0xFF1D4ED8),
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              Text(
                                "Universitas",

                                style:
                                GoogleFonts
                                    .poppins(
                                  fontWeight:
                                  FontWeight
                                      .w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Telkom University PuertoRico",

                            style:
                            GoogleFonts.poppins(),
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              const Icon(
                                Icons.code,
                                color:
                                Color(0xFF1D4ED8),
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              Text(
                                "Skill",

                                style:
                                GoogleFonts
                                    .poppins(
                                  fontWeight:
                                  FontWeight
                                      .w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Frontend Developer",

                            style:
                            GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(
                          Icons.home,
                        ),

                        label: const Text(
                          "Kembali ke Home",
                        ),

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(
                            0xFF1D4ED8,
                          ),

                          foregroundColor:
                          Colors.white,

                          padding:
                          const EdgeInsets.symmetric(
                            vertical: 15,
                          ),

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}