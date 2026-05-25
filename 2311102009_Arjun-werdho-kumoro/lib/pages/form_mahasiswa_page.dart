import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/mahasiswa_model.dart';
import '../widgets/custom_widgets.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final _namaController  = TextEditingController();
  final _nimController   = TextEditingController();
  final _kelasController = TextEditingController();

  void _simpan() {
    if (_namaController.text.isEmpty ||
        _nimController.text.isEmpty ||
        _kelasController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('⚠️  Semua field harus diisi!',
              style: GoogleFonts.poppins()),
          backgroundColor: AppTheme.accent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    final data = MahasiswaModel(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      kelas: _kelasController.text.trim(),
    );

    Navigator.pop(context, data);
  }

  void _reset() {
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
        title: const Text('Tambah Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Data Mahasiswa'),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _namaController,
                label: 'Nama Lengkap',
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _nimController,
                label: 'NIM',
                icon: Icons.badge_rounded,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _kelasController,
                label: 'Kelas',
                icon: Icons.class_rounded,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _simpan,
                      icon: const Icon(Icons.save_rounded, size: 18),
                      label: const Text('Simpan'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: _reset,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 14),
                      side: const BorderSide(color: AppTheme.primary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Icon(Icons.refresh_rounded,
                        color: AppTheme.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}