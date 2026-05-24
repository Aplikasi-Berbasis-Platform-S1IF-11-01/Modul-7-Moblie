import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Variabel diubah total
  final inputNama = TextEditingController();
  final inputNim = TextEditingController();
  final inputKelas = TextEditingController();

  String hasilNama = "", hasilNim = "", hasilKelas = "";
  bool isSubmitted = false;

  void submitData() {
    if (inputNama.text.isEmpty) return;

    setState(() {
      hasilNama = inputNama.text;
      hasilNim = inputNim.text;
      hasilKelas = inputKelas.text;
      isSubmitted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data mahasiswa sukses ditambahkan"),
        backgroundColor: Color(0xFFF06292),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulir")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _buildTextField(controller: inputNama, label: "Nama Lengkap", icon: Icons.face),
            const SizedBox(height: 15),
            _buildTextField(controller: inputNim, label: "Nomor Induk Mahasiswa (NIM)", icon: Icons.credit_card, isNumber: true),
            const SizedBox(height: 15),
            _buildTextField(controller: inputKelas, label: "Kelas", icon: Icons.domain),
            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF06292),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("SUBMIT", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
              ),
            ),
            
            const SizedBox(height: 40),

            if (isSubmitted)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4), 
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("DATA TERSIMPAN:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                    const Divider(),
                    Text("Nama  : $hasilNama"),
                    Text("NIM     : $hasilNim"),
                    Text("Kelas   : $hasilKelas"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, required IconData icon, bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFFF06292)),
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF8BBD0))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF8BBD0))),
      ),
    );
  }
}