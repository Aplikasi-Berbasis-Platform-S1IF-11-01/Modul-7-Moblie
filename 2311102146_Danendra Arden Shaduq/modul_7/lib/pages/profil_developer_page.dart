import 'package:flutter/material.dart';

class ProfilDeveloperPage extends StatelessWidget {
  const ProfilDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Developer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cs.secondaryContainer,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Icon(Icons.developer_mode_rounded,
                      size: 48, color: cs.onSecondaryContainer),
                  const SizedBox(height: 10),
                  Text(
                    'Danendra Arden Shaduq',
                    style: TextStyle(
                      color: cs.onSecondaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'S1IF-11-01 / 2311102146',
                    style: TextStyle(color: cs.onSecondaryContainer),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Kembali'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}