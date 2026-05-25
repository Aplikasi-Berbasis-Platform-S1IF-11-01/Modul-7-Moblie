import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ── Avatar Section ───────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, Color(0xFF7B8FFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Avatar lingkaran
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 3),
                    ),
                    child: const Icon(Icons.person_rounded,
                        size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text('Arjun Werdho Kumoro',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Flutter Developer',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const SectionHeader(title: 'Informasi Mahasiswa'),
            const SizedBox(height: 16),

            // ── Info Cards ───────────────────────────────────────────
            const InfoCard(
              icon: Icons.person_rounded,
              label: 'Nama Lengkap',
              value: 'Arjun Werdho Kumoro',
              color: AppTheme.primary,
            ),
            const InfoCard(
              icon: Icons.badge_rounded,
              label: 'NIM',
              value: '2311102009',
              color: AppTheme.secondary,
            ),
            const InfoCard(
              icon: Icons.code_rounded,
              label: 'Program Studi',
              value: 'Teknik Informatika',
              color: AppTheme.accent,
            ),

            const SizedBox(height: 8),

            // ── Badge Skills ─────────────────────────────────────────
            const SectionHeader(title: 'Tech Stack'),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['Flutter', 'Dart', 'Firebase',
                         'Git', 'UI/UX']
                  .map((skill) => Chip(
                        label: Text(skill,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppTheme.primary,
                                fontWeight: FontWeight.w500)),
                        backgroundColor:
                            AppTheme.primary.withOpacity(0.1),
                        side: BorderSide(
                            color: AppTheme.primary.withOpacity(0.3)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}