import 'package:flutter/material.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaC = TextEditingController();
  final _nimC = TextEditingController();
  final _kelasC = TextEditingController();

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    _kelasC.dispose();
    super.dispose();
  }

  void _simpan() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final data = <String, String>{
      'nama': _namaC.text.trim(),
      'nim': _nimC.text.trim(),
      'kelas': _kelasC.text.trim(),
    };

    // SnackBar notifikasi berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil menyimpan data mahasiswa ✅'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // kasih jeda sebentar biar snackbar sempat tampil,
    // lalu kembali + kirim data ke Home
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      Navigator.pop(context, data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(Icons.badge_rounded, color: cs.onPrimaryContainer),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Isi data berikut dengan benar, lalu tekan Simpan.',
                      style: TextStyle(
                        color: cs.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaC,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      prefixIcon: Icon(Icons.person_rounded),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Nama wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nimC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'NIM',
                      prefixIcon: Icon(Icons.numbers_rounded),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'NIM wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _kelasC,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Kelas',
                      prefixIcon: Icon(Icons.class_rounded),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Kelas wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save_rounded),
                      label: const Text('Simpan'),
                      onPressed: _simpan,
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