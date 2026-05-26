import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ──────────────────────────────────────────
// HOME PAGE — navigasi ke semua section
// ──────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> _menus = const [
    {
      'title': 'Container',
      'icon': Icons.square_rounded,
      'color': Color(0xFFFF6B6B),
      'page': ContainerPage(),
    },
    {
      'title': 'GridView',
      'icon': Icons.grid_view_rounded,
      'color': Color(0xFF4ECDC4),
      'page': GridViewPage(),
    },
    {
      'title': 'ListView',
      'icon': Icons.list_rounded,
      'color': Color(0xFFFFE66D),
      'page': ListViewPage(),
    },
    {
      'title': 'ListView.builder',
      'icon': Icons.view_list_rounded,
      'color': Color(0xFF6BCB77),
      'page': ListViewBuilderPage(),
    },
    {
      'title': 'ListView.separated',
      'icon': Icons.format_list_bulleted_rounded,
      'color': Color(0xFFFF9F1C),
      'page': ListViewSeparatedPage(),
    },
    {
      'title': 'Stack',
      'icon': Icons.layers_rounded,
      'color': Color(0xFFAD7BE9),
      'page': StackPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4361EE),
        title: const Text(
          '🚀 Flutter Widget Showcase',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: _menus.length,
          itemBuilder: (context, index) {
            final menu = _menus[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => menu['page'] as Widget),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: menu['color'] as Color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (menu['color'] as Color).withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      menu['icon'] as IconData,
                      color: Colors.white,
                      size: 42,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      menu['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// 1. CONTAINER PAGE
// ──────────────────────────────────────────
class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      appBar: _buildAppBar(context, 'Container Widget', const Color(0xFFFF6B6B)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionTitle('Container Dasar'),
            const SizedBox(height: 12),

            // Container sederhana
            Container(
              width: double.infinity,
              height: 100,
              color: const Color(0xFFFF6B6B),
              child: const Center(
                child: Text(
                  'Container Sederhana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Container dengan border radius & shadow
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6B6B).withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Container + Gradient + Shadow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Container dengan border
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFF6B6B), width: 3),
              ),
              child: const Center(
                child: Text(
                  'Container + Border',
                  style: TextStyle(
                    color: Color(0xFFFF6B6B),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Container dengan padding & margin
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE0E0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Container dengan Padding & Margin\n(padding: 20, margin: horizontal 20)',
                style: TextStyle(
                  color: Color(0xFFCC3333),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // Row of small colorful containers
            _sectionTitle('Variasi Ukuran'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorBox(60, const Color(0xFFFF6B6B), 'S'),
                _colorBox(80, const Color(0xFFFF4444), 'M'),
                _colorBox(100, const Color(0xFFCC0000), 'L'),
                _colorBox(80, const Color(0xFFFF4444), 'M'),
                _colorBox(60, const Color(0xFFFF6B6B), 'S'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(double size, Color color, String label) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// 2. GRIDVIEW PAGE
// ──────────────────────────────────────────
class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  final List<Map<String, dynamic>> _items = const [
    {'label': 'Item 1', 'icon': Icons.star, 'color': Color(0xFF4ECDC4)},
    {'label': 'Item 2', 'icon': Icons.favorite, 'color': Color(0xFFFF6B6B)},
    {'label': 'Item 3', 'icon': Icons.bolt, 'color': Color(0xFFFFE66D)},
    {'label': 'Item 4', 'icon': Icons.local_fire_department, 'color': Color(0xFFFF9F1C)},
    {'label': 'Item 5', 'icon': Icons.diamond, 'color': Color(0xFFAD7BE9)},
    {'label': 'Item 6', 'icon': Icons.rocket_launch, 'color': Color(0xFF6BCB77)},
    {'label': 'Item 7', 'icon': Icons.emoji_events, 'color': Color(0xFF4361EE)},
    {'label': 'Item 8', 'icon': Icons.palette, 'color': Color(0xFFE040FB)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFFD),
      appBar: _buildAppBar(context, 'GridView Widget', const Color(0xFF4ECDC4)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.0,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return Container(
              decoration: BoxDecoration(
                color: item['color'] as Color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: (item['color'] as Color).withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: Colors.white, size: 48),
                  const SizedBox(height: 10),
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// 3. LISTVIEW PAGE (statis A, B, C)
// ──────────────────────────────────────────
class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      {'label': 'A', 'title': 'Item A', 'sub': 'Ini adalah item pertama', 'color': Color(0xFFFF6B6B)},
      {'label': 'B', 'title': 'Item B', 'sub': 'Ini adalah item kedua', 'color': Color(0xFF4ECDC4)},
      {'label': 'C', 'title': 'Item C', 'sub': 'Ini adalah item ketiga', 'color': Color(0xFFFFE66D)},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0),
      appBar: _buildAppBar(context, 'ListView (Statis)', const Color(0xFFFFE66D)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: (item['color'] as Color).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: (item['color'] as Color).withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    item['label'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(item['sub'] as String),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  color: item['color'] as Color, size: 18),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ──────────────────────────────────────────
// 4. LISTVIEW.BUILDER PAGE
// ──────────────────────────────────────────
class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  final List<Map<String, dynamic>> _dataArray = const [
    {'name': 'Budi Santoso', 'role': 'Flutter Developer', 'avatar': '👨‍💻'},
    {'name': 'Siti Rahayu', 'role': 'UI/UX Designer', 'avatar': '👩‍🎨'},
    {'name': 'Agus Prasetyo', 'role': 'Backend Engineer', 'avatar': '👨‍🔧'},
    {'name': 'Dewi Lestari', 'role': 'Product Manager', 'avatar': '👩‍💼'},
    {'name': 'Rudi Hermawan', 'role': 'DevOps Engineer', 'avatar': '👨‍🚀'},
    {'name': 'Rina Kusuma', 'role': 'Data Scientist', 'avatar': '👩‍🔬'},
    {'name': 'Hendra Wijaya', 'role': 'QA Engineer', 'avatar': '🧑‍💻'},
  ];

  final List<Color> _colors = const [
    Color(0xFF6BCB77),
    Color(0xFF4ECDC4),
    Color(0xFF4361EE),
    Color(0xFFFF9F1C),
    Color(0xFFAD7BE9),
    Color(0xFFFF6B6B),
    Color(0xFFE040FB),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF4),
      appBar: _buildAppBar(context, 'ListView.builder', const Color(0xFF6BCB77)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _dataArray.length,
        itemBuilder: (context, index) {
          final item = _dataArray[index];
          final color = _colors[index % _colors.length];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(item['avatar'] as String, style: const TextStyle(fontSize: 26)),
                ),
              ),
              title: Text(
                item['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Text(
                item['role'] as String,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '#${index + 1}',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ──────────────────────────────────────────
// 5. LISTVIEW.SEPARATED PAGE
// ──────────────────────────────────────────
class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  final List<Map<String, dynamic>> _menuItems = const [
    {'icon': Icons.home_rounded, 'title': 'Beranda', 'sub': 'Halaman utama aplikasi'},
    {'icon': Icons.person_rounded, 'title': 'Profil', 'sub': 'Lihat dan edit profil kamu'},
    {'icon': Icons.notifications_rounded, 'title': 'Notifikasi', 'sub': '3 notifikasi baru'},
    {'icon': Icons.bookmark_rounded, 'title': 'Tersimpan', 'sub': '12 item tersimpan'},
    {'icon': Icons.settings_rounded, 'title': 'Pengaturan', 'sub': 'Konfigurasi aplikasi'},
    {'icon': Icons.help_rounded, 'title': 'Bantuan', 'sub': 'FAQ dan dukungan'},
    {'icon': Icons.logout_rounded, 'title': 'Keluar', 'sub': 'Logout dari akun'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: _buildAppBar(context, 'ListView.separated', const Color(0xFFFF9F1C)),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _menuItems.length,
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 1.5,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.transparent, Color(0xFFFF9F1C), Colors.transparent],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        itemBuilder: (context, index) {
          final item = _menuItems[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            leading: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFFF9F1C).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item['icon'] as IconData,
                color: const Color(0xFFFF9F1C),
                size: 24,
              ),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text(
              item['sub'] as String,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            trailing: const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFFF9F1C),
            ),
          );
        },
      ),
    );
  }
}

// ──────────────────────────────────────────
// 6. STACK PAGE
// ──────────────────────────────────────────
class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0FF),
      appBar: _buildAppBar(context, 'Stack Widget', const Color(0xFFAD7BE9)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _sectionTitle('Stack: Kotak Bertumpuk'),
            const SizedBox(height: 16),

            // Stack 1: kotak warna bertumpuk
            Center(
              child: SizedBox(
                width: 280,
                height: 200,
                child: Stack(
                  children: [
                    // Lapisan terbawah
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 220,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF6B6B).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(4, 4),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Lapisan tengah
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 220,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4ECDC4),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4ECDC4).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(4, 4),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Lapisan atas
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 220,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xFFAD7BE9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFAD7BE9).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(4, 4),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Stack!\nTumpukan Kotak',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            _sectionTitle('Stack: Card dengan Badge'),
            const SizedBox(height: 16),

            // Stack 2: card dengan badge notifikasi
            Center(
              child: SizedBox(
                width: 280,
                height: 120,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 280,
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6BCB77), Color(0xFF4ECDC4)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '🔔 Pesan Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Kamu punya 5 pesan baru hari ini',
                              style: TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Badge angka
                    Positioned(
                      top: -12,
                      right: -10,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF6B6B),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            _sectionTitle('Stack: Teks di Atas Gambar'),
            const SizedBox(height: 16),

            // Stack 3: gradient overlay + teks
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4361EE),
                          Color(0xFFE040FB),
                          Color(0xFFFF6B6B),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  // overlay gelap bawah
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black45],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // teks di atas
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter Widget Showcase',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Teks bertumpuk di atas gradient background',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // icon di pojok kanan atas
                  const Positioned(
                    top: 12,
                    right: 12,
                    child: Icon(Icons.favorite_rounded, color: Colors.white, size: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// HELPER WIDGETS
// ──────────────────────────────────────────
PreferredSizeWidget _buildAppBar(BuildContext context, String title, Color color) {
  return AppBar(
    backgroundColor: color,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    elevation: 0,
  );
}

Widget _sectionTitle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
  );
}
