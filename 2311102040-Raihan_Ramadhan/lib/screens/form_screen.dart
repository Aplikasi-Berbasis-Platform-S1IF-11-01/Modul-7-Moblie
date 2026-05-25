import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mahasiswa.dart';

/// FormScreen adalah StatefulWidget karena mengelola
/// state dari TextEditingController dan data yang ditampilkan.
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Controllers
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Data yang sudah disimpan (ditampilkan di bawah form)
  Mahasiswa? _dataTersimpan;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  // ── Aksi simpan ──────────────────────────────────────────────────────────
  void _simpanData() {
    if (!_formKey.currentState!.validate()) return;

    final mhs = Mahasiswa(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      kelas: _kelasController.text.trim(),
    );

    setState(() => _dataTersimpan = mhs);

    // SnackBar notifikasi berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              'Data berhasil disimpan!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF00C2A8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ── Kirim data ke HomeScreen via Navigator.pop ───────────────────────────
  void _kirimData() {
    if (_dataTersimpan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Simpan data terlebih dahulu!',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: const Color(0xFFFF6B35),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
      backgroundColor: const Color(0xFFF0F4FF),
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
            // ── Header card ──────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A73E8).withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
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
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Isi semua field dengan benar',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // ── Form ─────────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
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
                      hint: 'Contoh: Budi Santoso',
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
                      hint: 'Contoh: 22310001',
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

                    // ── Tombol Simpan ─────────────────────────────────────
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

            // ── Tampilkan data yang sudah disimpan ────────────────────────
            if (_dataTersimpan != null) ...[
              Text(
                'Data Tersimpan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 12),
              _DataPreviewCard(mahasiswa: _dataTersimpan!),
              const SizedBox(height: 16),

              // Tombol kirim ke home
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _kirimData,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Tambahkan ke Daftar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C2A8),
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
        Icon(icon, size: 18, color: const Color(0xFF1A73E8)),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A2E),
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
      style: GoogleFonts.poppins(fontSize: 15, color: const Color(0xFF1A1A2E)),
      decoration: InputDecoration(hintText: hint),
    );
  }
}

// ── Preview card (StatelessWidget) ────────────────────────────────────────────
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
          colors: [Color(0xFFE8F5E9), Color(0xFFE0F2F1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00C2A8).withOpacity(0.4)),
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
        Icon(icon, size: 20, color: const Color(0xFF00C2A8)),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6B6B8A),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A2E),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}