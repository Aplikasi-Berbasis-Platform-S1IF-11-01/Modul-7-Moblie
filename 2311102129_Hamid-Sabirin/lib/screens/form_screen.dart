import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kelasController = TextEditingController();

  final List<Map<String, String>> _listMahasiswa = [];
  int? _editIndex; // Menyimpan index data yang sedang diedit (null jika mode tambah)

  void _simpanData() {
    if (_namaController.text.isEmpty || _nimController.text.isEmpty || _kelasController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua field!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      if (_editIndex != null) {
        // Mode Edit: Update data yang ada
        _listMahasiswa[_editIndex!] = {
          'nama': _namaController.text,
          'nim': _nimController.text,
          'kelas': _kelasController.text,
        };
      } else {
        // Mode Tambah: Masukkan data baru
        _listMahasiswa.add({
          'nama': _namaController.text,
          'nim': _nimController.text,
          'kelas': _kelasController.text,
        });
      }

      // Tampilkan notifikasi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Text(_editIndex != null ? 'Data berhasil diperbarui!' : 'Data berhasil disimpan!'),
            ],
          ),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(16),
        ),
      );

      // Kosongkan form dan reset mode
      _namaController.clear();
      _nimController.clear();
      _kelasController.clear();
      _editIndex = null;
    });
  }

  void _editData(int index) {
    setState(() {
      _editIndex = index;
      _namaController.text = _listMahasiswa[index]['nama'] ?? '';
      _nimController.text = _listMahasiswa[index]['nim'] ?? '';
      _kelasController.text = _listMahasiswa[index]['kelas'] ?? '';
    });
  }

  void _hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Data', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Apakah kamu yakin ingin menghapus data mahasiswa ini?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _listMahasiswa.removeAt(index);
                // Jika data yang dihapus sedang diedit, reset form
                if (_editIndex == index) {
                  _editIndex = null;
                  _namaController.clear();
                  _nimController.clear();
                  _kelasController.clear();
                } else if (_editIndex != null && _editIndex! > index) {
                  // Sesuaikan index edit jika letaknya bergeser
                  _editIndex = _editIndex! - 1;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data berhasil dihapus!'),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _batalEdit() {
    setState(() {
      _editIndex = null;
      _namaController.clear();
      _nimController.clear();
      _kelasController.clear();
    });
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
        title: const Text('Form Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _editIndex != null ? 'Edit Data' : 'Masukkan Data',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _editIndex != null ? const Color(0xFFF59E0B) : const Color(0xFF1F2937),
                  ),
                ),
                if (_editIndex != null)
                  TextButton.icon(
                    onPressed: _batalEdit,
                    icon: const Icon(Icons.close, size: 18),
                    label: const Text('Batal'),
                    style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _namaController,
              label: 'Nama Lengkap',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _nimController,
              label: 'NIM',
              icon: Icons.badge,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _kelasController,
              label: 'Kelas',
              icon: Icons.class_,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _simpanData,
              style: ElevatedButton.styleFrom(
                backgroundColor: _editIndex != null ? const Color(0xFFF59E0B) : const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Text(
                _editIndex != null ? 'Perbarui Data' : 'Simpan',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            
            // Tampilan daftar data setelah disimpan
            if (_listMahasiswa.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(Icons.analytics, color: Color(0xFF4F46E5)),
                  const SizedBox(width: 8),
                  Text(
                    'Data Tersimpan (${_listMahasiswa.length})',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4F46E5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Looping menggunakan asMap() agar punya akses ke index asli
              ..._listMahasiswa.asMap().entries.toList().reversed.map((entry) {
                int index = entry.key;
                Map<String, String> data = entry.value;
                
                // Highlight item yang sedang diedit
                bool isEditingThis = _editIndex == index;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isEditingThis ? const Color(0xFFFEF3C7) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isEditingThis ? 0.1 : 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isEditingThis ? const Color(0xFFF59E0B) : const Color(0xFFE5E7EB),
                      width: isEditingThis ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildResultRow('Nama', data['nama'] ?? '-'),
                                const SizedBox(height: 8),
                                _buildResultRow('NIM', data['nim'] ?? '-'),
                                const SizedBox(height: 8),
                                _buildResultRow('Kelas', data['kelas'] ?? '-'),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Color(0xFFF59E0B)),
                                onPressed: () => _editData(index),
                                tooltip: 'Edit',
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(8),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                onPressed: () => _hapusData(index),
                                tooltip: 'Hapus',
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6B7280)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50, // Dibuat lebih ringkas agar rapi dengan icon button
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
              fontSize: 14,
            ),
          ),
        ),
        const Text(': ', style: TextStyle(fontWeight: FontWeight.w600)),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
