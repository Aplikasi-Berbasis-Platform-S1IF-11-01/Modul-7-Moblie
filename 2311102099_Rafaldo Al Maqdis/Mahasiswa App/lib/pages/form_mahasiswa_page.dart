import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// FormMahasiswaPage menggunakan StatefulWidget
/// karena perlu mengelola state form dan hasil input
class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  // ── GlobalKey untuk validasi form ──
  final _formKey = GlobalKey<FormState>();

  // ── TextEditingController untuk setiap field ──
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  // ── State: menyimpan data yang sudah tersimpan ──
  Map<String, String>? _savedData;
  bool _isSaving = false;

  @override
  void dispose() {
    // Selalu dispose controller saat widget dihapus
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  // ── Fungsi simpan data ──
  Future<void> _simpanData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    // Simulasi delay proses simpan
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() {
      _savedData = {
        'nama': _namaController.text.trim(),
        'nim': _nimController.text.trim(),
        'kelas': _kelasController.text.trim(),
      };
      _isSaving = false;
    });

    // ── Tampilkan SnackBar notifikasi ──
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: Colors.white, size: 22),
              const SizedBox(width: 10),
              Text(
                'Data mahasiswa berhasil disimpan',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF43C59E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar dengan tombol kembali otomatis ──
      appBar: AppBar(
        title: const Text('Input Data Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context), // Navigator.pop untuk kembali
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF48CAE4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header Info ──
            _buildPageHeader(),

            const SizedBox(height: 24),

            // ── Kartu Form ──
            _buildFormCard(),

            const SizedBox(height: 24),

            // ── Hasil Data (muncul setelah simpan) ──
            if (_savedData != null) _buildResultCard(),

            const SizedBox(height: 32),

            // ── Tombol Kembali ──
            _buildBackButton(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ── Widget: Header halaman ──
  Widget _buildPageHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFECEAFF), Color(0xFFE0F7FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDDD8FF), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.edit_note_rounded,
                color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Form Pendataan',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF3D3773),
                  ),
                ),
                Text(
                  'Isi semua field dengan lengkap dan benar',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF9E99C8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu berisi form input ──
  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Mahasiswa',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF3D3773),
              ),
            ),
            const SizedBox(height: 20),

            // Field Nama
            _buildInputField(
              controller: _namaController,
              label: 'Nama Lengkap',
              hint: 'Contoh: Ahmad Fauzi',
              icon: Icons.person_rounded,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                if (value.trim().length < 3) {
                  return 'Nama minimal 3 karakter';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Field NIM
            _buildInputField(
              controller: _nimController,
              label: 'NIM',
              hint: 'Contoh: 12345678',
              icon: Icons.badge_rounded,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'NIM tidak boleh kosong';
                }
                if (value.trim().length < 5) {
                  return 'NIM minimal 5 digit';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Field Kelas
            _buildInputField(
              controller: _kelasController,
              label: 'Kelas',
              hint: 'Contoh: TI-3A',
              icon: Icons.class_rounded,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Kelas tidak boleh kosong';
                }
                return null;
              },
            ),

            const SizedBox(height: 28),

            // ── Tombol Simpan ──
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _simpanData,
                child: _isSaving
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.save_rounded, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Simpan Data',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Widget: Field input reusable ──
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5A5490),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF3D3773),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFFBBB8DC),
              fontSize: 13,
            ),
            prefixIcon: Icon(icon, color: const Color(0xFF6C63FF), size: 22),
          ),
          validator: validator,
        ),
      ],
    );
  }

  // ── Widget: Kartu hasil data yang tersimpan ──
  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF48CAE4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: Colors.white, size: 22),
              const SizedBox(width: 8),
              Text(
                'Data Tersimpan',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white30, thickness: 1),
          const SizedBox(height: 12),

          // Baris data nama, nim, kelas
          _buildResultRow(Icons.person_rounded, 'Nama', _savedData!['nama']!),
          const SizedBox(height: 10),
          _buildResultRow(Icons.badge_rounded, 'NIM', _savedData!['nim']!),
          const SizedBox(height: 10),
          _buildResultRow(
              Icons.class_rounded, 'Kelas', _savedData!['kelas']!),
        ],
      ),
    );
  }

  // ── Widget: Satu baris data hasil ──
  Widget _buildResultRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.white70,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ── Widget: Tombol kembali ke HomePage ──
  Widget _buildBackButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context), // Navigator.pop kembali
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF6C63FF), width: 1.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_ios_rounded,
                size: 16, color: Color(0xFF6C63FF)),
            const SizedBox(width: 8),
            Text(
              'Kembali ke Beranda',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6C63FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
