import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();

  // Menggunakan List untuk menyimpan banyak data sekaligus
  final List<Map<String, String>> _listMahasiswa = [];

  void _simpanData() {
    // Validasi sederhana
    if (_namaController.text.isEmpty || 
        _nimController.text.isEmpty || 
        _kelasController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua data terlebih dahulu!'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Menambahkan data baru ke dalam list history
    setState(() {
      _listMahasiswa.add({
        'nama': _namaController.text,
        'nim': _nimController.text,
        'kelas': _kelasController.text,
      });
    });

    // Tampilkan SnackBar sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Data Mahasiswa Berhasil Disimpan!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );

    // Kosongkan form agar siap diisi lagi
    _namaController.clear();
    _nimController.clear();
    _kelasController.clear();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Lengkapi Data Berikut',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Color(0xFFB71234)
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIM Mahasiswa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.class_),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB71234),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('SIMPAN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              
              // Menampilkan daftar semua data yang sudah disimpan (seperti history)
              if (_listMahasiswa.isNotEmpty) ...[
                const SizedBox(height: 40),
                const Text(
                  'Daftar Mahasiswa Tersimpan',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFFB71234)
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true, // Wajib jika di dalam SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(), // Scroll diurus parent
                  itemCount: _listMahasiswa.length,
                  itemBuilder: (context, index) {
                    final data = _listMahasiswa[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: const Color(0xFFB71234),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white, 
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  data['nama'] ?? '-',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFB71234),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.black12),
                          const SizedBox(height: 4),
                          Text('NIM   : ${data['nim']}', style: const TextStyle(fontSize: 15)),
                          const SizedBox(height: 4),
                          Text('Kelas : ${data['kelas']}', style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
