import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormMahasiswaScreen extends StatefulWidget {
  const FormMahasiswaScreen({super.key});

  @override
  State<FormMahasiswaScreen> createState() => _FormMahasiswaScreenState();
}

class _FormMahasiswaScreenState extends State<FormMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nimCtrl = TextEditingController();
  final _kelasCtrl = TextEditingController();

  @override
  void dispose() {
    _namaCtrl.dispose();
    _nimCtrl.dispose();
    _kelasCtrl.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(children: [
            const Icon(Icons.check_circle_outline_rounded,
                color: Color(0xFFF9E4EB), size: 16),
            const SizedBox(width: 9),
            Text('Data berhasil disimpan',
                style: GoogleFonts.dmSans(fontSize: 13)),
          ]),
          backgroundColor: const Color(0xFF5C3341),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context, {
          'nama': _namaCtrl.text.trim(),
          'nim': _nimCtrl.text.trim(),
          'kelas': _kelasCtrl.text.trim(),
        });
      });
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaCtrl.clear();
    _nimCtrl.clear();
    _kelasCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Mahasiswa',
            style: GoogleFonts.dmSerifDisplay(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 26),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: const Color(0xFFF2D9DF)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _fieldLabel('Nama lengkap'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _namaCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama lengkap',
                    prefixIcon: Icon(Icons.person_outline_rounded, size: 18),
                  ),
                  textCapitalization: TextCapitalization.words,
                  style: GoogleFonts.dmSans(
                      fontSize: 14, color: const Color(0xFF5C3341)),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Nama tidak boleh kosong'
                      : null,
                ),
                const SizedBox(height: 18),

                _fieldLabel('NIM'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nimCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Contoh: 2311102132',
                    prefixIcon: Icon(Icons.credit_card_outlined, size: 18),
                  ),
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.dmSans(
                      fontSize: 14, color: const Color(0xFF5C3341)),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty)
                      return 'NIM tidak boleh kosong';
                    if (v.trim().length < 10) return 'NIM minimal 10 digit';
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                _fieldLabel('Kelas'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _kelasCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Contoh: IF-11-01',
                    prefixIcon: Icon(Icons.domain_rounded, size: 18),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  style: GoogleFonts.dmSans(
                      fontSize: 14, color: const Color(0xFF5C3341)),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Kelas tidak boleh kosong'
                      : null,
                ),
                const SizedBox(height: 26),

                ElevatedButton.icon(
                  onPressed: _simpanData,
                  icon: const Icon(Icons.save_outlined, size: 18),
                  label: const Text('Simpan data'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: _resetForm,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFC47A8A),
                    side: const BorderSide(color: Color(0xFFF2D9DF)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    textStyle: GoogleFonts.dmSans(fontSize: 13),
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _fieldLabel(String text) => Text(
        text,
        style: GoogleFonts.dmSans(
            fontSize: 11,
            color: const Color(0xFFB89098),
            letterSpacing: 0.8),
      );
}