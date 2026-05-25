import 'package:flutter/material.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() =>
      _FormMahasiswaPageState();
}

class _FormMahasiswaPageState
    extends State<FormMahasiswaPage> {

  static const Color primaryMaroon =
      Color(0xFF7A1F2B);

  final namaController = TextEditingController();
  final nimController = TextEditingController();
  final kelasController = TextEditingController();

  String nama = "";
  String nim = "";
  String kelas = "";

  void simpanData() {
    setState(() {
      nama = namaController.text;
      nim = nimController.text;
      kelas = kelasController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: primaryMaroon,
        content: Text(
          "Data mahasiswa berhasil disimpan",
        ),
      ),
    );
  }

  void resetForm() {
    namaController.clear();
    nimController.clear();
    kelasController.clear();

    setState(() {
      nama = "";
      nim = "";
      kelas = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F7),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryMaroon,
        foregroundColor: Colors.white,
        title: const Text(
          "Form Mahasiswa",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Input Data Mahasiswa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Masukkan data mahasiswa dengan lengkap.",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                children: [

                  TextField(
                    controller: namaController,

                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      prefixIcon:
                          const Icon(Icons.person),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: nimController,

                    decoration: InputDecoration(
                      labelText: "NIM",
                      prefixIcon:
                          const Icon(Icons.badge),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: kelasController,

                    decoration: InputDecoration(
                      labelText: "Kelas",
                      prefixIcon:
                          const Icon(Icons.class_),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryMaroon,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),

                onPressed: simpanData,

                label: const Text(
                  "Simpan Data",
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                icon: const Icon(Icons.refresh),

                onPressed: resetForm,

                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryMaroon,
                ),

                label: const Text(
                  "Reset Form",
                ),
              ),
            ),

            const SizedBox(height: 25),

            if (nama.isNotEmpty ||
                nim.isNotEmpty ||
                kelas.isNotEmpty)

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF8EDEE),
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
                          Icons.check_circle,
                          color: primaryMaroon,
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Data Tersimpan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Text(
                      "Nama : $nama",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "NIM : $nim",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Kelas : $kelas",
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon:
                    const Icon(Icons.arrow_back),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.grey.shade700,
                  foregroundColor:
                      Colors.white,
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                label: const Text(
                  "Kembali",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}