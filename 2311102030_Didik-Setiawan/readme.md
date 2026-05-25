

<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>WEB MANAGEMENT PRODUCT
</h1>
  <br />
  <h3>MODUL 03-04 - Mobile
 <br> Pengenalan Flutter</h3>
  <br />
  <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-vb7jyBjK-sM%2FXXfKp51LrjI%2FAAAAAAAACts%2FEjcXzlgZwSswNWXsBHMyX-6aav1mjA77QCPcBGAYYCw%2Fs1600%2FLogo_Telkom_University_potrait.png&f=1&nofb=1&ipt=9d030d54102ea96369d39fe491220e0536195abc8ee443279c1a420302206400" alt="Logo Telkom" width="300"> 
  <br /><br /><br />
  
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Didik Setiawan</strong><br>
    <strong>2311102030</strong><br>
    <strong>IF-11-REG-01</strong>
  </p>
  <br />
  
  <h3>Dosen Pengampu :</h3>
  <p><strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong></p>
  <br />
  
  <h4>Asisten Praktikum :</h4>
  <strong>Apri Pandu Wicaksono</strong> <br>
  <strong>Rangga Pradarrell Fathi</strong>
  <br />
  
  <h3>LABORATORIUM HIGH PERFORMANCE<br>FAKULTAS INFORMATIKA<br>UNIVERSITAS TELKOM PURWOKERTO<br>2026</h3>
</div>

---

## DASAR TEORI
  Flutter adalah framework open-source yang dikembangkan oleh Google untuk membangun aplikasi lintas platform seperti Android, iOS, web, dan desktop menggunakan satu kode sumber. Flutter menggunakan bahasa pemrograman Dart dan berfokus pada pembuatan antarmuka pengguna (UI) yang cepat, responsif, dan menarik. Dalam Flutter, semua elemen tampilan disebut widget yang menjadi dasar dalam menyusun aplikasi.



---

#  Fitur Aplikasi

- Halaman Home (Beranda)
- Navigasi antar halaman menggunakan Navigator
- Form input data mahasiswa
- Validasi data sebelum disimpan
- Menampilkan data mahasiswa yang telah disimpan
- Notifikasi menggunakan SnackBar
- Halaman Profil Developer
- Desain modern dengan Material 3
- Font Poppins dari Google Fonts
- Background gradient yang menarik
- Custom Card dengan efek shadow

---

#  Package yang Digunakan

Tambahkan dependency berikut pada file `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  google_fonts: ^6.2.1
```

---

#  Penjelasan Source Code

## 1. Import Package

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
```

Digunakan untuk mengakses widget Flutter Material Design dan font Google Fonts.

---

## 2. Fungsi Main

```dart
void main() {
  runApp(const MyApp());
}
```

Merupakan fungsi pertama yang dijalankan ketika aplikasi dibuka.

`runApp()` digunakan untuk menjalankan widget utama yaitu:

```dart
MyApp()
```

---

## 3. Class MyApp

```dart
class MyApp extends StatelessWidget
```

Widget utama aplikasi yang bertugas mengatur:

- Tema aplikasi
- Font aplikasi
- Halaman awal
- Warna utama aplikasi

---

## 4. ThemeData

```dart
final baseTheme = ThemeData(
```

Digunakan untuk menentukan tema dasar aplikasi.

Tema yang digunakan:

- Material Design 3
- Color Scheme otomatis
- Warna utama hijau kebiruan (Teal)

---

## 5. Color Scheme

```dart
ColorScheme.fromSeed(
```

Digunakan untuk menghasilkan kombinasi warna secara otomatis berdasarkan warna utama aplikasi.

```dart
seedColor: const Color(0xFF0F766E)
```

---

## 6. Google Fonts

```dart
GoogleFonts.poppinsTextTheme(
```

Digunakan untuk mengubah seluruh font aplikasi menjadi font **Poppins**.

---

## 7. MaterialApp

```dart
MaterialApp(
```

Widget utama Flutter yang digunakan untuk:

- Mengatur tema
- Mengatur halaman utama
- Menentukan title aplikasi
- Menghilangkan banner debug

---

## 8. Home Page

```dart
class HomePage extends StatelessWidget
```

Halaman pertama yang muncul saat aplikasi dijalankan.

Halaman ini berisi:

- Icon sekolah
- Judul aplikasi
- Deskripsi aplikasi
- Tombol Form Mahasiswa
- Tombol Profil Developer

---

## 9. AppBar

```dart
AppBar(
  title: Text('Data Mahasiswa')
)
```

Menampilkan judul halaman pada bagian atas aplikasi.

---

## 10. Gradient Background

```dart
LinearGradient(
```

Digunakan untuk memberikan efek gradasi warna pada background sehingga tampilan menjadi lebih menarik.

---

## 11. Icon Sekolah

```dart
Icon(
  Icons.school
)
```

Menampilkan ikon sekolah sebagai identitas halaman utama.

---

## 12. ElevatedButton

```dart
ElevatedButton.icon(
```

Digunakan sebagai tombol untuk membuka halaman Form Mahasiswa.

---

## 13. OutlinedButton

```dart
OutlinedButton.icon(
```

Digunakan sebagai tombol menuju halaman Profil Developer.

---

## 14. Navigator Push

```dart
Navigator.push(
```

Digunakan untuk berpindah dari satu halaman ke halaman lainnya.

Contoh:

- Home → Form Mahasiswa
- Home → Profil Developer

---

# Halaman Form Mahasiswa

## 15. StatefulWidget

```dart
class MahasiswaFormPage extends StatefulWidget
```

Menggunakan StatefulWidget karena data yang ditampilkan dapat berubah setelah pengguna melakukan input.

---

## 16. TextEditingController

```dart
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _kelasController = TextEditingController();
```

Digunakan untuk mengambil nilai yang dimasukkan pengguna pada TextField.

Field yang tersedia:

- Nama
- NIM
- Kelas

---

## 17. Dispose

```dart
@override
void dispose()
```

Digunakan untuk membersihkan controller ketika halaman ditutup sehingga penggunaan memori tetap optimal.

---

## 18. Method Simpan Data

```dart
void _simpanData()
```

Berfungsi untuk:

- Mengambil data dari TextField
- Memvalidasi input
- Menyimpan data ke state
- Menampilkan notifikasi berhasil

---

## 19. Validasi Input

```dart
if (nama.isEmpty || nim.isEmpty || kelas.isEmpty)
```

Digunakan untuk memastikan semua field telah diisi sebelum data disimpan.

Jika ada field kosong maka akan muncul SnackBar peringatan.

---

## 20. SnackBar

```dart
ScaffoldMessenger.of(context).showSnackBar(
```

Menampilkan pesan informasi kepada pengguna.

Contoh:

- Semua field harus diisi terlebih dahulu
- Data mahasiswa berhasil disimpan

---

## 21. setState()

```dart
setState(() {
```

Digunakan untuk memperbarui tampilan setelah data berhasil disimpan.

---

## 22. TextField

```dart
TextField(
```

Komponen input yang digunakan untuk mengisi:

- Nama Mahasiswa
- NIM
- Kelas

---

## 23. InputDecoration

```dart
InputDecoration(
```

Digunakan untuk mengatur tampilan TextField seperti:

- Label Text
- Border
- Placeholder

---

## 24. OutlineInputBorder

```dart
OutlineInputBorder()
```

Memberikan garis tepi berbentuk kotak pada TextField.

---

## 25. Menampilkan Data Tersimpan

```dart
if (_nama != null && _nim != null && _kelas != null)
```

Setelah tombol Simpan ditekan, data yang berhasil disimpan akan ditampilkan pada bagian:

```text
Data Tersimpan
Nama : ...
NIM  : ...
Kelas: ...
```

---

# Halaman Profil Developer

## 26. ProfilDeveloperPage

```dart
class ProfilDeveloperPage extends StatelessWidget
```

Halaman yang digunakan untuk menampilkan informasi pembuat aplikasi.

---

## 27. CircleAvatar

```dart
CircleAvatar(
```

Digunakan untuk menampilkan avatar berbentuk lingkaran dengan ikon developer.

---

## 28. Informasi Developer

```dart
Nama: Didik Setiawan
Kelas: ABP
Tugas Praktik Modul 7
```

Menampilkan identitas developer aplikasi.

---

## 29. Tombol Kembali

```dart
Navigator.pop(context);
```

Digunakan untuk kembali ke halaman sebelumnya.

---

# Widget Custom

## 30. Class _FieldCard

```dart
class _FieldCard extends StatelessWidget
```

Widget custom yang digunakan sebagai card untuk membungkus komponen agar tampilan lebih rapi dan modern.

---

## 31. BoxDecoration

```dart
BoxDecoration(
```

Digunakan untuk memberikan dekorasi pada card seperti:

- Warna putih
- Border radius
- Shadow

---

## 32. BorderRadius

```dart
BorderRadius.circular(24)
```

Memberikan efek sudut membulat pada card.

---

## 33. BoxShadow

```dart
BoxShadow(
```

Memberikan efek bayangan sehingga card terlihat lebih elegan.

---

#  Tampilan Aplikasi

## Halaman Home

- Icon sekolah
- Judul aplikasi
- Deskripsi aplikasi
- Tombol Form Mahasiswa
- Tombol Profil Developer

## Halaman Form Mahasiswa

- Input Nama
- Input NIM
- Input Kelas
- Tombol Simpan
- Menampilkan data yang tersimpan

## Halaman Profil Developer

- Avatar developer
- Nama developer
- Kelas
- Informasi tugas
- Tombol kembali

---

#  Screenshot


  ![Alt 1](https://raw.githubusercontent.com/didiksetia1/asset/refs/heads/main/Screenshot%202026-05-26%20011854.png)
  
  ![Alt 1](https://raw.githubusercontent.com/didiksetia1/asset/refs/heads/main/Screenshot%202026-05-26%20011932.png)
  




---

#  Teknologi yang Digunakan

- Flutter
- Dart
- Material Design 3
- Google Fonts (Poppins)

---

