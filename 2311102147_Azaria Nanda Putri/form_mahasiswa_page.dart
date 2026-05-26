import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// FormMahasiswaPage — StatefulWidget
/// Mengelola state input form dan hasil yang tersimpan
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

  // ── State hasil simpan ──
  Map<String, String>? _savedData;
  bool _isSaving = false;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    super.dispose();
  }

  // ── Fungsi simpan + validasi ──
  Future<void> _simpanData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _savedData = {
        'nama': _namaController.text.trim(),
        'nim': _nimController.text.trim(),
        'kelas': _kelasController.text.trim(),
      };
      _isSaving = false;
    });

    // ── SnackBar pink cantik ──
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Text('🎀', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Text(
                'Data mahasiswa berhasil disimpan',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFE8739A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Mahasiswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE8739A), Color(0xFFF4A7C3)],
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
            // ── Header halaman ──
            _buildPageHeader(),
            const SizedBox(height: 22),

            // ── Kartu Form ──
            _buildFormCard(),
            const SizedBox(height: 20),

            // ── Hasil data (muncul setelah simpan) ──
            if (_savedData != null) ...[
              _buildResultCard(),
              const SizedBox(height: 20),
            ],

            // ── Tombol kembali ──
            _buildBackButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ── Widget: Header info halaman ──
  Widget _buildPageHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFECF3), Color(0xFFFFF5FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFCCDE), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE8739A),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text('📝', style: TextStyle(fontSize: 22)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Form Pendataan Mahasiswa',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF8B4A62),
                  ),
                ),
                Text(
                  'Isi semua field dengan data yang benar ya~ 🌸',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: const Color(0xFFC49BAA),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Widget: Kartu form input ──
  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8739A).withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: const Color(0xFFFFD6E7), width: 1),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('✨', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text(
                  'Data Mahasiswa',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF8B4A62),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Field Nama
            _buildInputField(
              controller: _namaController,
              label: 'Nama Lengkap',
              hint: 'Contoh: Azaria Nanda Putri',
              emoji: '👩',
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Nama tidak boleh kosong';
                if (v.trim().length < 3) return 'Nama minimal 3 karakter';
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Field NIM
            _buildInputField(
              controller: _nimController,
              label: 'NIM',
              hint: 'Contoh: 2311102099',
              emoji: '🪪',
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'NIM tidak boleh kosong';
                if (v.trim().length < 5) return 'NIM minimal 5 digit';
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Field Kelas
            _buildInputField(
              controller: _kelasController,
              label: 'Kelas',
              hint: 'Contoh: IF-11-01',
              emoji: '🏫',
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Kelas tidak boleh kosong';
                return null;
              },
            ),

            const SizedBox(height: 26),

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
                          const Text('🎀', style: TextStyle(fontSize: 18)),
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

  // ── Widget: Input field reusable ──
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String emoji,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF8B4A62),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF8B4A62),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFFDEB8C8),
              fontSize: 13,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(emoji, style: const TextStyle(fontSize: 18)),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  // ── Widget: Kartu hasil data tersimpan ──
  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8739A), Color(0xFFF4A7C3), Color(0xFFFFD6E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8739A).withOpacity(0.4),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💾', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                'Data Berhasil Disimpan!',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
          Divider(color: Colors.white.withOpacity(0.4), thickness: 1),
          const SizedBox(height: 10),

          _buildResultRow('👩', 'Nama', _savedData!['nama']!),
          const SizedBox(height: 10),
          _buildResultRow('🪪', 'NIM', _savedData!['nim']!),
          const SizedBox(height: 10),
          _buildResultRow('🏫', 'Kelas', _savedData!['kelas']!),
        ],
      ),
    );
  }

  Widget _buildResultRow(String emoji, String label, String value) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 10),
        Text(
          '$label : ',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white70,
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

  // ── Widget: Tombol kembali ──
  Widget _buildBackButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE8739A), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🌸', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(
              'Kembali ke Beranda',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFE8739A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
