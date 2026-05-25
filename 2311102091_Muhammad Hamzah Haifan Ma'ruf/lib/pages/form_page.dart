import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController nimController =
      TextEditingController();

  final TextEditingController kelasController =
      TextEditingController();

  String hasilData = "";

  void simpanData() {

    setState(() {
      hasilData =
          "Nama  : ${namaController.text}\n"
          "NIM   : ${nimController.text}\n"
          "Kelas : ${kelasController.text}";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data berhasil disimpan!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(
        title: const Text("Form Mahasiswa"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const Icon(
                Icons.assignment,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: namaController,

                decoration: const InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan Nama",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nimController,

                decoration: const InputDecoration(
                  labelText: "NIM",
                  hintText: "Masukkan NIM",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: kelasController,

                decoration: const InputDecoration(
                  labelText: "Kelas",
                  hintText: "Masukkan Kelas",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.class_),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("Simpan"),

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: simpanData,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),

                child: Text(
                  hasilData.isEmpty
                      ? "Data mahasiswa akan tampil di sini"
                      : hasilData,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Kembali"),

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.red,
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}