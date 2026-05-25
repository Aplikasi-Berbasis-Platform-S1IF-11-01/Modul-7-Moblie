import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();

  Map<String, String>? _savedData;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _savedData = {
          'nama': _namaController.text.trim(),
          'nim': _nimController.text.trim(),
          'kelas': _kelasController.text.trim(),
        };
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Data berhasil disimpan!',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF6D28D9),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Isi Data Mahasiswa',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Lengkapi data berikut dengan benar.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 28),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan nama lengkap',
                      prefixIcon: Icon(Icons.person_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return 'Nama tidak boleh kosong';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nimController,
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white, fontSize: 14),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'NIM',
                      hintText: 'Masukkan NIM',
                      prefixIcon: Icon(Icons.badge_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return 'NIM tidak boleh kosong';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _kelasController,
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white, fontSize: 14),
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                      labelText: 'Kelas',
                      hintText: 'Contoh: IF-3A',
                      prefixIcon: Icon(Icons.class_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return 'Kelas tidak boleh kosong';
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _simpanData,
                      icon: const Icon(Icons.save_rounded, size: 20),
                      label: const Text('Simpan Data'),
                    ),
                  ),
                ],
              ),
            ),
            if (_savedData != null) ...[
              const SizedBox(height: 32),
              Text(
                'Data Tersimpan',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E0D3A),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: const Color(0xFF6A0DAD).withOpacity(0.6),
                      width: 1.5),
                ),
                child: Column(
                  children: [
                    _DataRow(
                        icon: Icons.person_rounded,
                        label: 'Nama',
                        value: _savedData!['nama']!),
                    const Divider(color: Color(0xFF3D1A6E), height: 24),
                    _DataRow(
                        icon: Icons.badge_rounded,
                        label: 'NIM',
                        value: _savedData!['nim']!),
                    const Divider(color: Color(0xFF3D1A6E), height: 24),
                    _DataRow(
                        icon: Icons.class_rounded,
                        label: 'Kelas',
                        value: _savedData!['kelas']!),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DataRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF9B59B6), size: 18),
        const SizedBox(width: 12),
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 13, color: Colors.white54),
          ),
        ),
        Text(':',
            style: GoogleFonts.plusJakartaSans(
                color: Colors.white38, fontSize: 13)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
