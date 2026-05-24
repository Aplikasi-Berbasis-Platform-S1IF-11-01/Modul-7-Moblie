import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormMahasiswaScreen extends StatefulWidget {
  const FormMahasiswaScreen({super.key});

  @override
  State<FormMahasiswaScreen> createState() => _FormMahasiswaScreenState();
}

class _FormMahasiswaScreenState extends State<FormMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  // Saved data state
  Map<String, String>? _savedData;
  bool _isSaved = false;

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
        _isSaved = true;
      });

      // Show SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Data mahasiswa berhasil disimpan!',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF1B5E20),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _nimController.clear();
    _kelasController.clear();
    setState(() {
      _savedData = null;
      _isSaved = false;
    });
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
            // ── Header ────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF0288D1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.edit_note_rounded,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Input Data Mahasiswa',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Isi semua field dengan benar',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Form ──────────────────────────────────────────────
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
                    Text(
                      'Data Diri',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Nama
                    _buildLabel('Nama Lengkap', Icons.person_rounded),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _namaController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama lengkap',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
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

                    // NIM
                    _buildLabel('NIM', Icons.badge_rounded),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _nimController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan NIM mahasiswa',
                        prefixIcon: Icon(Icons.tag_rounded),
                      ),
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

                    // Kelas
                    _buildLabel('Kelas', Icons.class_rounded),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _kelasController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(
                        hintText: 'Contoh: IF-3A, SI-2B',
                        prefixIcon: Icon(Icons.class_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Kelas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Reset'),
                            onPressed: _resetForm,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF1565C0),
                              side:
                                  const BorderSide(color: Color(0xFF1565C0)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.save_rounded),
                            label: const Text('Simpan Data'),
                            onPressed: _simpanData,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Result Card ───────────────────────────────────────
            if (_isSaved && _savedData != null) ...[
              const SizedBox(height: 24),
              _HasilDataCard(data: _savedData!),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF1565C0)),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A237E),
          ),
        ),
      ],
    );
  }
}

// ─── Hasil Data Card ─────────────────────────────────────────────────────────

class _HasilDataCard extends StatelessWidget {
  final Map<String, String> data;

  const _HasilDataCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1565C0).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5E20).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.check_circle_rounded,
                    color: Color(0xFF1B5E20), size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                'Data Tersimpan',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1B5E20),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),

          // Avatar + info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF0288D1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    data['nama']!.isNotEmpty
                        ? data['nama']![0].toUpperCase()
                        : '?',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Data rows
              Expanded(
                child: Column(
                  children: [
                    _DataRow(
                      icon: Icons.person_rounded,
                      label: 'Nama',
                      value: data['nama']!,
                    ),
                    const SizedBox(height: 10),
                    _DataRow(
                      icon: Icons.badge_rounded,
                      label: 'NIM',
                      value: data['nim']!,
                    ),
                    const SizedBox(height: 10),
                    _DataRow(
                      icon: Icons.class_rounded,
                      label: 'Kelas',
                      value: data['kelas']!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DataRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF1565C0)),
        const SizedBox(width: 6),
        SizedBox(
          width: 50,
          child: Text(
            '$label :',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A237E),
            ),
          ),
        ),
      ],
    );
  }
}