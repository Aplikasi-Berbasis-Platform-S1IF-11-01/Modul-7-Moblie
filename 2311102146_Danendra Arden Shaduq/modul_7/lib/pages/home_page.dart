import 'package:flutter/material.dart';
import 'form_mahasiswa_page.dart';
import 'profil_developer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> riwayatMahasiswa = [];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Data Mahasiswa'),
        actions: [
          IconButton(
            tooltip: 'Hapus semua',
            onPressed: riwayatMahasiswa.isEmpty
                ? null
                : () {
                    setState(() => riwayatMahasiswa.clear());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Semua data dihapus'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
            icon: const Icon(Icons.delete_sweep_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [cs.primary, cs.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 14,
                    offset: Offset(0, 8),
                    color: Color(0x22000000),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school_rounded, color: Colors.white, size: 26),
                      SizedBox(width: 10),
                      Text(
                        'Aplikasi Data Mahasiswa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Setiap kali Simpan, data akan masuk ke riwayat di bawah.',
                    style: TextStyle(color: Colors.white, height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tombol ke Form
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_rounded),
                label: const Text('Tambah Data Mahasiswa'),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FormMahasiswaPage()),
                  );

                  if (result is Map<String, String>) {
                    setState(() {
                      riwayatMahasiswa.insert(0, result); // terbaru di atas
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data masuk ke riwayat ✅'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),

            // Tombol ke Profil
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.person_rounded),
                label: const Text('Profil Developer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfilDeveloperPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 10),

            // Judul riwayat + counter
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Riwayat Data Mahasiswa',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: cs.primary,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${riwayatMahasiswa.length} data',
                    style: TextStyle(
                      color: cs.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // ListView.builder (bonus)
            Expanded(
              child: riwayatMahasiswa.isEmpty
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 120, // ✅ atur tinggi box abu-abu di sini
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: cs.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline_rounded),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Belum ada data. Klik "Tambah Data Mahasiswa".',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                  : ListView.builder(
                      itemCount: riwayatMahasiswa.length,
                      itemBuilder: (context, index) {
                        final item = riwayatMahasiswa[index];
                        final nama = item['nama'] ?? '-';
                        final nim = item['nim'] ?? '-';
                        final kelas = item['kelas'] ?? '-';

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: cs.primary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nama,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: cs.onPrimaryContainer,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'NIM: $nim',
                                      style: TextStyle(
                                        color: cs.onPrimaryContainer,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Kelas: $kelas',
                                      style: TextStyle(
                                        color: cs.onPrimaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                tooltip: 'Hapus item',
                                onPressed: () {
                                  setState(() {
                                    riwayatMahasiswa.removeAt(index);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('1 data dihapus'),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.delete_outline_rounded,
                                  color: cs.onPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}