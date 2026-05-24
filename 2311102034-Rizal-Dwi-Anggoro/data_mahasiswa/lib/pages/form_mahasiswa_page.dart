// lib/pages/form_mahasiswa_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

/// Halaman Form Mahasiswa — StatefulWidget
/// Mengelola input teks dan validasi form
class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  // GlobalKey untuk akses Form & validasi
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap field input
  final _namaController    = TextEditingController();
  final _nimController     = TextEditingController();
  final _kelasController   = TextEditingController();

  // Data yang telah disimpan (ditampilkan setelah tombol ditekan)
  Mahasiswa? _dataTersimpan;

  @override
  void dispose() {
    // Selalu dispose controller agar tidak memory leak
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  // ── Simpan & tampilkan data ──────────────────────────────────
  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      final mahasiswaBaru = Mahasiswa(
        nama:  _namaController.text.trim(),
        nim:   _nimController.text.trim(),
        kelas: _kelasController.text.trim(),
      );

      setState(() {
        _dataTersimpan = mahasiswaBaru;
      });

      // Tampilkan SnackBar notifikasi berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Data ${mahasiswaBaru.nama} berhasil disimpan! ✅',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          backgroundColor: AppTheme.successColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // ── Kirim data kembali ke HomePage via Navigator.pop ────────
  void _konfirmasiDanKembali() {
    if (_dataTersimpan != null) {
      Navigator.pop(context, _dataTersimpan);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Simpan data terlebih dahulu!',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  // ── Reset form ───────────────────────────────────────────────
  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _nimController.clear();
    _kelasController.clear();
    setState(() {
      _dataTersimpan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context), // Navigator.pop
          tooltip: 'Kembali',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Form',
            onPressed: _resetForm,
          ),
        ],
      ),

      // ── Body dengan SingleChildScrollView ────────────────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header Section ───────────────────────────────
            _buildFormHeader(),
            const SizedBox(height: 24),

            // ── Form Input ───────────────────────────────────
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: 'Data Mahasiswa',
                      icon: Icons.edit_note,
                    ),
                    const SizedBox(height: 20),

                    // Field Nama
                    CustomTextField(
                      controller: _namaController,
                      label: 'Nama Lengkap',
                      hint: 'Masukkan nama lengkap',
                      icon: Icons.person_outline,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        if (v.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Field NIM
                    CustomTextField(
                      controller: _nimController,
                      label: 'NIM',
                      hint: 'Contoh: 2201234567',
                      icon: Icons.badge_outlined,
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'NIM tidak boleh kosong';
                        }
                        if (v.trim().length < 8) {
                          return 'NIM minimal 8 digit';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Field Kelas
                    CustomTextField(
                      controller: _kelasController,
                      label: 'Kelas',
                      hint: 'Contoh: TI-2A',
                      icon: Icons.class_outlined,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Kelas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Tombol Simpan
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _simpanData,
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Simpan Data'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Preview Data Tersimpan ───────────────────────
            if (_dataTersimpan != null) _buildPreviewData(),
          ],
        ),
      ),
    );
  }

  // ── Widget: Form Header ─────────────────────────────────────
  Widget _buildFormHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor,
            AppTheme.secondaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                const Icon(Icons.person_add_alt, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambah Mahasiswa Baru',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Isi semua field dengan benar',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Preview Data ────────────────────────────────────
  Widget _buildPreviewData() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.successColor.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.successColor.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header preview
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.check_circle,
                    color: AppTheme.successColor, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                'Preview Data Tersimpan',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.successColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Info cards
          InfoCard(
            icon: Icons.person,
            label: 'Nama Lengkap',
            value: _dataTersimpan!.nama,
            iconColor: AppTheme.primaryColor,
          ),
          InfoCard(
            icon: Icons.badge,
            label: 'NIM',
            value: _dataTersimpan!.nim,
            iconColor: const Color(0xFF7B1FA2),
          ),
          InfoCard(
            icon: Icons.class_,
            label: 'Kelas',
            value: _dataTersimpan!.kelas,
            iconColor: const Color(0xFF00838F),
          ),

          const SizedBox(height: 16),

          // Tombol kirim ke home
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _konfirmasiDanKembali,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.successColor,
              ),
              icon: const Icon(Icons.send),
              label: const Text('Konfirmasi & Kembali ke Home'),
            ),
          ),
        ],
      ),
    );
  }
}