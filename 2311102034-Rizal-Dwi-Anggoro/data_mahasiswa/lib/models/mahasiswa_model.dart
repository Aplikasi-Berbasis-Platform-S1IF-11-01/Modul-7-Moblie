// lib/models/mahasiswa_model.dart

class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
  });

  // Factory constructor untuk membuat objek dari Map
  factory Mahasiswa.fromMap(Map<String, String> map) {
    return Mahasiswa(
      nama: map['nama'] ?? '',
      nim: map['nim'] ?? '',
      kelas: map['kelas'] ?? '',
    );
  }

  // Konversi ke Map
  Map<String, String> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'kelas': kelas,
    };
  }

  @override
  String toString() {
    return 'Mahasiswa(nama: $nama, nim: $nim, kelas: $kelas)';
  }
}