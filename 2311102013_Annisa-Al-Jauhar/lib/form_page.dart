import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  Map<String, String>? _dataTersimpan;
  String? _kelasTerpilih;

  final List<String> _daftarKelas = [
    'TI-1A', 'TI-1B', 'TI-2A', 'TI-2B',
    'TI-3A', 'TI-3B', 'SI-1A', 'SI-2A',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  void _simpanData() {
    final nama = _namaController.text.trim();
    final nim = _nimController.text.trim();
    final kelas = _kelasTerpilih ?? '';

    if (nama.isEmpty || nim.isEmpty || kelas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text('Semua field wajib diisi!', style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
          backgroundColor: const Color(0xFFB85C38),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _dataTersimpan = {'nama': nama, 'nim': nim, 'kelas': kelas};
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text('Data berhasil disimpan!', style: GoogleFonts.poppins(fontSize: 13)),
          ],
        ),
        backgroundColor: const Color(0xFF6B8F5E),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _resetForm() {
    setState(() {
      _namaController.clear();
      _nimController.clear();
      _kelasTerpilih = null;
      _dataTersimpan = null;
    });
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Input Data Mahasiswa',
              style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF4A3728),
              ),
            ),
            Text(
              'Isi form di bawah dengan data yang benar',
              style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B6F47)),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF6EC),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE8D5BC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FieldLabel(label: 'Nama Lengkap', icon: Icons.person_outline_rounded),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama lengkap...',
                      prefixIcon: Icon(Icons.badge_outlined, color: Color(0xFF8B6F47)),
                    ),
                    style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF4A3728)),
                  ),
                  const SizedBox(height: 16),
                  _FieldLabel(label: 'NIM', icon: Icons.numbers_rounded),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nimController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan NIM...',
                      prefixIcon: Icon(Icons.tag_rounded, color: Color(0xFF8B6F47)),
                    ),
                    style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF4A3728)),
                  ),
                  const SizedBox(height: 16),
                  _FieldLabel(label: 'Kelas', icon: Icons.class_outlined),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF6EC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _kelasTerpilih != null ? const Color(0xFF8B6F47) : const Color(0xFFD4B896),
                        width: _kelasTerpilih != null ? 2 : 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _kelasTerpilih,
                        isExpanded: true,
                        hint: Text(
                          'Pilih kelas...',
                          style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFB8975A)),
                        ),
                        style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF4A3728)),
                        dropdownColor: const Color(0xFFFDF6EC),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF8B6F47)),
                        items: _daftarKelas.map((k) => DropdownMenuItem(value: k, child: Text(k))).toList(),
                        onChanged: (value) => setState(() => _kelasTerpilih = value),
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
                onPressed: _simpanData,
                icon: const Icon(Icons.save_rounded, size: 20),
                label: const Text('Simpan Data'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _resetForm,
                icon: const Icon(Icons.refresh_rounded, size: 20, color: Color(0xFF8B6F47)),
                label: Text(
                  'Reset Form',
                  style: GoogleFonts.poppins(color: const Color(0xFF8B6F47), fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF8B6F47)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            if (_dataTersimpan != null) ...[
              const SizedBox(height: 28),
              _HasilData(data: _dataTersimpan!),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  const _FieldLabel({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF8B6F47)),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF4A3728),
          ),
        ),
      ],
    );
  }
}

class _HasilData extends StatelessWidget {
  final Map<String, String> data;
  const _HasilData({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6D0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDDBF96)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: const Color(0xFF8B6F47), borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.check_rounded, color: Color(0xFFFDF6EC), size: 18),
              ),
              const SizedBox(width: 12),
              Text(
                'Data Tersimpan',
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: const Color(0xFF4A3728)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFDDBF96)),
          const SizedBox(height: 8),
          _RowData(icon: Icons.person_rounded, label: 'Nama', value: data['nama']!),
          const SizedBox(height: 10),
          _RowData(icon: Icons.tag_rounded, label: 'NIM', value: data['nim']!),
          const SizedBox(height: 10),
          _RowData(icon: Icons.class_rounded, label: 'Kelas', value: data['kelas']!),
        ],
      ),
    );
  }
}

class _RowData extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _RowData({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF8B6F47)),
        const SizedBox(width: 10),
        Text(
          '$label  :  ',
          style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF8B6F47), fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF4A3728)),
          ),
        ),
      ],
    );
  }
}
