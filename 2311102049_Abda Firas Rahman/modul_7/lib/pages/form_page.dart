import 'package:flutter/material.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final _nama = TextEditingController();
  final _nim = TextEditingController();
  final _kelas = TextEditingController();

  String n = "", ni = "", k = "";
  bool terpampang = false;

  void prosesSimpan() {
    if (_nama.text.isEmpty || _nim.text.isEmpty) return;
    
    setState(() {
      n = _nama.text;
      ni = _nim.text;
      k = _kelas.text;
      terpampang = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sip! Data kesimpen'),
        backgroundColor: Colors.indigo,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Data"), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _customInput(controller: _nama, hint: "Nama Lengkap", icon: Icons.person_outline),
            const SizedBox(height: 15),
            _customInput(controller: _nim, hint: "NIM", icon: Icons.badge_outlined, isNum: true),
            const SizedBox(height: 15),
            _customInput(controller: _kelas, hint: "Kelas", icon: Icons.room_outlined),
            const SizedBox(height: 25),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: prosesSimpan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("SIMPAN DATA", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            
            const SizedBox(height: 40),
            
            if (terpampang)
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [Colors.indigo.shade800, Colors.indigo.shade500]),
                  ),
                  child: Column(
                    children: [
                      const Text("RESUME DATA", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                      const Divider(color: Colors.white24),
                      _rowHasil("Nama", n),
                      _rowHasil("NIM", ni),
                      _rowHasil("Kelas", k),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _customInput({required TextEditingController controller, required String hint, required IconData icon, bool isNum = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.indigo),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _rowHasil(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}