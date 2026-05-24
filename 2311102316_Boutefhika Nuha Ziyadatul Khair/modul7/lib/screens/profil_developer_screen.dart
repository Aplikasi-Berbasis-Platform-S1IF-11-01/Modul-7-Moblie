import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilDeveloperScreen extends StatelessWidget {
  const ProfilDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Developer',
          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
        ),
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
          // ── Avatar section ──
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: const Color(0xFFF9E4EB),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2C4D0),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE8A0B4),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 32,
                    color: Color(0xFFC47A8A),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Boutefhika Nuha Ziyadatul Khair',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: const Color(0xFF5C3341),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mahasiswa Teknik Informatika',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: const Color(0xFFA07080),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          Text(
            'Informasi',
            style: GoogleFonts.dmSans(
              fontSize: 11,
              color: const Color(0xFFB89098),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          _InfoRow(
            icon: Icons.credit_card_outlined,
            label: 'NIM',
            value: '2311102316',
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.domain_rounded,
            label: 'Kelas',
            value: 'IF-11-01',
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.school_outlined,
            label: 'Program Studi',
            value: 'Teknik Informatika',
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.account_balance_outlined,
            label: 'Universitas',
            value: 'Universitas Telkom Purwokerto',
          ),

          const SizedBox(height: 22),

          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded, size: 17),
            label: const Text('Kembali'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF2D9DF)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF0F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 17, color: const Color(0xFFC47A8A)),
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.dmSans(
                  fontSize: 10,
                  color: const Color(0xFFB89098),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: const Color(0xFF5C3341),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
