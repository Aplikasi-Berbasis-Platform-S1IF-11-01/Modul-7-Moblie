import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMahasiswa',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D6E63),
          primary: const Color(0xFF5D4037),
          secondary: const Color(0xFFD7CCC8),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5D4037),
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8D6E63),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school_rounded,
                size: 100,
                color: Color(0xFF5D4037),
              ),
              const Text('Welcome to MyMahasiswa'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormPage()),
                  );
                },
                icon: const Icon(Icons.assignment_ind_rounded),
                label: const Text('Form Mahasiswa'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.person_pin_rounded),
                label: const Text('Profile Developer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MY Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF5D4037),
                child: Icon(
                  Icons.person_rounded,
                  size: 55,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Fahreza Ilham Wicaksono',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
              const Text(
                '2311102191',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  String _namaDisplay = '';
  String _nimDisplay = '';
  String _kelasDisplay = '';

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
      appBar: AppBar(title: const Text('Form Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF8D6E63)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: Icon(Icons.badge_sharp, color: Color(0xFF8D6E63)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  prefixIcon: Icon(
                    Icons.class_rounded,
                    color: Color(0xFF8D6E63),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Batal'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _namaDisplay = _namaController.text;
                        _nimDisplay = _nimController.text;
                        _kelasDisplay = _kelasController.text;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 12),
                              Text('Data berhasil disimpan'),
                            ],
                          ),
                          backgroundColor: const Color(0xFF5D4037),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save_rounded),
                    label: const Text('Simpan Data'),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Untuk menampilkan data
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEBE9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFD7CCC8),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.analytics_rounded, color: Color(0xFF5D4037)),
                        SizedBox(width: 8),
                        Text(
                          'Hasil Input Data:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFFBCAAA4), thickness: 1),
                    const SizedBox(height: 8),
                    Text(
                      'Nama    : $_namaDisplay',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'NIM     : $_nimDisplay',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kelas   : $_kelasDisplay',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
