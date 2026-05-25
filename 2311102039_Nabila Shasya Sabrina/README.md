<div align="center">

&#x20; <br />

&#x20; <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>

&#x20; <br />

&#x20; <h3>MODUL 7 <br> Flutter Mobile</h3>

&#x20; <br />

&#x20; <br />

&#x20; <img src="assets/logo.jpeg" alt="Logo" width="300"> 

&#x20; <br />

&#x20; <br />

&#x20; <br />

&#x20; <h3>Disusun Oleh :</h3>

&#x20; <p>

&#x20;   <strong>Nabila Shasya Sabrina</strong><br>

&#x20;   <strong>2311102039</strong><br>

&#x20;   <strong>S1 IF-11-01</strong>

&#x20; </p>

&#x20; <br />

&#x20; <h3>Dosen Pengampu :</h3>

&#x20; <p>

&#x20;   <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>

&#x20; </p>

&#x20; <br />

&#x20; <br />

&#x20;   <h4>Asisten Praktikum :</h4>

&#x20;   <strong> Apri Pandu Wicaksono </strong> <br>

&#x20;   <strong>Rangga Pradarrell Fathi</strong>

&#x20; <br />

&#x20; <h3>LABORATORIUM HIGH PERFORMANCE

&#x20;<br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>

</div>



\---



\## 1. Dasar Teori

\---



Navigator merupakan komponen yang berfungsi mengatur perpindahan antarhalaman dalam aplikasi. Mekanisme kerjanya menggunakan konsep stack (tumpukan). Ketika pengguna membuka halaman baru, metode Navigator.push() akan menambahkan halaman tersebut ke bagian atas tumpukan. Sebaliknya, metode Navigator.pop() digunakan untuk menutup halaman yang sedang aktif sehingga pengguna dapat kembali ke halaman sebelumnya yang berada di bawahnya.



Form adalah area yang digunakan untuk menerima dan mengelola data yang dimasukkan oleh pengguna. Dalam implementasinya, form biasanya memanfaatkan widget seperti TextField untuk menampung input berupa teks. Agar data yang diinput dapat diakses, diproses, dan dikelola dengan mudah, digunakan TextEditingController sebagai penghubung antara kolom input dan program.



StatelessWidget merupakan jenis widget yang memiliki sifat statis, sehingga tampilannya tidak berubah setelah pertama kali dibuat. Data dan elemen yang terdapat di dalam widget ini akan tetap sama selama aplikasi berjalan karena tidak dipengaruhi oleh perubahan data maupun interaksi pengguna. Oleh karena itu, StatelessWidget umumnya digunakan untuk menampilkan informasi yang bersifat tetap, seperti halaman utama atau tampilan informasi sederhana.



StatefulWidget adalah widget yang memiliki kemampuan untuk memperbarui tampilan secara dinamis sesuai perubahan data atau interaksi pengguna. Widget ini memanfaatkan objek State untuk menyimpan dan mengelola data yang dapat berubah. Ketika terjadi perubahan, misalnya saat pengguna mengisi formulir atau menekan tombol tertentu, widget akan melakukan proses rebuild sehingga informasi terbaru dapat langsung ditampilkan pada layar.

\---



\## 2. Tentang Aplikasi

\---

\*\*\*Teknologi yang digunakan\*\*\*

\-Flutter

\-Dart

\-Material Design

\-Google Fonts (Poppins)



\*\*\*Fitur Aplikasi\*\*\*

\-Home Page sebagai halaman utama dan navigasi.

\-Form Mahasiswa untuk menginput data Nama, NIM, dan Kelas.

\-Profil Developer untuk menampilkan informasi pengembang.

\-SnackBar sebagai notifikasi saat data berhasil disimpan.

\-Navigasi antar halaman menggunakan Navigator.



\*\*\*Widget yang Digunakan\*\*\*

StatelessWidget, StatefulWidget, Scaffold, AppBar, Container, Column, TextField, ElevatedButton, Icon, SnackBar, dan Navigator.

\---



\## 3. Struktur Project

\---

```

lib/

│

├── main.dart

│

└── pages/

&#x20;   ├── home\_page.dart

&#x20;   ├── form\_mahasiswa\_page.dart

&#x20;   └── profil\_page.dart

└── theme/

&#x20;   └── apps\_colors.dart



```



\---



\## 4. Source Code

\---

\*\*\*main.dart\*\*\*

```

import 'package:flutter/material.dart';

import 'package:google\_fonts/google\_fonts.dart';



import 'pages/home\_page.dart';

import 'theme/app\_colors.dart';



void main() {

&#x20; runApp(const MyApp());

}



class MyApp extends StatelessWidget {

&#x20; const MyApp({super.key});



&#x20; @override

&#x20; Widget build(BuildContext context) {

&#x20;   return MaterialApp(

&#x20;     debugShowCheckedModeBanner: false,



&#x20;     theme: ThemeData(

&#x20;       scaffoldBackgroundColor: AppColors.softPink,



&#x20;       appBarTheme: const AppBarTheme(

&#x20;         backgroundColor: AppColors.primaryMaroon,

&#x20;         foregroundColor: Colors.white,

&#x20;         centerTitle: true,

&#x20;       ),



&#x20;       textTheme: GoogleFonts.poppinsTextTheme(),

&#x20;     ),



&#x20;     home: const HomePage(),

&#x20;   );

&#x20; }

}

```

File main.dart merupakan file utama yang menjalankan aplikasi Flutter. Pada file ini dilakukan konfigurasi awal aplikasi, seperti pengaturan tema, warna utama aplikasi, font yang digunakan, serta menentukan halaman pertama yang ditampilkan yaitu HomePage.



\*\*\*home\_page.dart\*\*\*

```

import 'package:flutter/material.dart';

import 'form\_mahasiswa\_page.dart';

import 'profil\_page.dart';



class HomePage extends StatelessWidget {

&#x20; const HomePage({super.key});



&#x20; static const Color primaryMaroon = Color(0xFF7A1F2B);

&#x20; static const Color backgroundColor = Color(0xFFFDF6F7);

&#x20; static const Color cardColor = Colors.white;



&#x20; @override

&#x20; Widget build(BuildContext context) {

&#x20;   return Scaffold(

&#x20;     backgroundColor: backgroundColor,



&#x20;     appBar: AppBar(

&#x20;       elevation: 0,

&#x20;       centerTitle: true,

&#x20;       backgroundColor: primaryMaroon,

&#x20;       title: const Text(

&#x20;         "Data Mahasiswa",

&#x20;         style: TextStyle(

&#x20;           color: Colors.white,

&#x20;           fontWeight: FontWeight.bold,

&#x20;         ),

&#x20;       ),

&#x20;     ),



&#x20;     body: SingleChildScrollView(

&#x20;       padding: const EdgeInsets.all(20),



&#x20;       child: Column(

&#x20;         crossAxisAlignment: CrossAxisAlignment.start,

&#x20;         children: \[



&#x20;           // HERO CARD

&#x20;           Container(

&#x20;             width: double.infinity,

&#x20;             padding: const EdgeInsets.all(24),



&#x20;             decoration: BoxDecoration(

&#x20;               color: primaryMaroon,

&#x20;               borderRadius: BorderRadius.circular(24),

&#x20;             ),



&#x20;             child: const Column(

&#x20;               crossAxisAlignment: CrossAxisAlignment.start,

&#x20;               children: \[



&#x20;                 CircleAvatar(

&#x20;                   radius: 28,

&#x20;                   backgroundColor: Colors.white24,

&#x20;                   child: Icon(

&#x20;                     Icons.school,

&#x20;                     color: Colors.white,

&#x20;                     size: 30,

&#x20;                   ),

&#x20;                 ),



&#x20;                 SizedBox(height: 20),



&#x20;                 Text(

&#x20;                   "Selamat Datang!",

&#x20;                   style: TextStyle(

&#x20;                     color: Colors.white,

&#x20;                     fontSize: 26,

&#x20;                     fontWeight: FontWeight.bold,

&#x20;                   ),

&#x20;                 ),



&#x20;                 SizedBox(height: 8),



&#x20;                 Text(

&#x20;                   "Kelola data mahasiswa dengan mudah dan cepat melalui aplikasi ini.",

&#x20;                   style: TextStyle(

&#x20;                     color: Colors.white70,

&#x20;                     fontSize: 14,

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 30),



&#x20;           const Text(

&#x20;             "MENU UTAMA",

&#x20;             style: TextStyle(

&#x20;               fontWeight: FontWeight.bold,

&#x20;               color: primaryMaroon,

&#x20;               letterSpacing: 1.2,

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 15),



&#x20;           // FORM MAHASISWA

&#x20;           \_menuCard(

&#x20;             icon: Icons.edit\_document,

&#x20;             title: "Form Mahasiswa",

&#x20;             subtitle: "Input dan simpan data mahasiswa",

&#x20;             onTap: () {

&#x20;               Navigator.push(

&#x20;                 context,

&#x20;                 MaterialPageRoute(

&#x20;                   builder: (context) =>

&#x20;                       const FormMahasiswaPage(),

&#x20;                 ),

&#x20;               );

&#x20;             },

&#x20;           ),



&#x20;           const SizedBox(height: 15),



&#x20;           // PROFIL DEVELOPER

&#x20;           \_menuCard(

&#x20;             icon: Icons.person,

&#x20;             title: "Profil Developer",

&#x20;             subtitle: "Informasi pembuat aplikasi",

&#x20;             onTap: () {

&#x20;               Navigator.push(

&#x20;                 context,

&#x20;                 MaterialPageRoute(

&#x20;                   builder: (context) =>

&#x20;                       const ProfilPage(),

&#x20;                 ),

&#x20;               );

&#x20;             },

&#x20;           ),



&#x20;           const SizedBox(height: 25),



&#x20;           Container(

&#x20;             padding: const EdgeInsets.all(16),



&#x20;             decoration: BoxDecoration(

&#x20;               color: const Color(0xFFF8EDEE),

&#x20;               borderRadius: BorderRadius.circular(16),

&#x20;             ),



&#x20;             child: const Row(

&#x20;               children: \[



&#x20;                 Icon(

&#x20;                   Icons.info\_outline,

&#x20;                   color: primaryMaroon,

&#x20;                 ),



&#x20;                 SizedBox(width: 10),



&#x20;                 Expanded(

&#x20;                   child: Text(

&#x20;                     "Pilih menu di atas untuk mulai mengelola data mahasiswa.",

&#x20;                     style: TextStyle(

&#x20;                       color: Colors.black87,

&#x20;                     ),

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),

&#x20;         ],

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }



&#x20; static Widget \_menuCard({

&#x20;   required IconData icon,

&#x20;   required String title,

&#x20;   required String subtitle,

&#x20;   required VoidCallback onTap,

&#x20; }) {

&#x20;   return InkWell(

&#x20;     borderRadius: BorderRadius.circular(20),

&#x20;     onTap: onTap,



&#x20;     child: Container(

&#x20;       padding: const EdgeInsets.all(16),



&#x20;       decoration: BoxDecoration(

&#x20;         color: cardColor,

&#x20;         borderRadius: BorderRadius.circular(20),



&#x20;         boxShadow: \[

&#x20;           BoxShadow(

&#x20;             color: Colors.black.withOpacity(0.05),

&#x20;             blurRadius: 12,

&#x20;             offset: const Offset(0, 4),

&#x20;           ),

&#x20;         ],

&#x20;       ),



&#x20;       child: Row(

&#x20;         children: \[



&#x20;           Container(

&#x20;             padding: const EdgeInsets.all(12),



&#x20;             decoration: BoxDecoration(

&#x20;               color: const Color(0xFFF8EDEE),

&#x20;               borderRadius: BorderRadius.circular(12),

&#x20;             ),



&#x20;             child: const Icon(

&#x20;               Icons.arrow\_right\_alt,

&#x20;               color: primaryMaroon,

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(width: 15),



&#x20;           Expanded(

&#x20;             child: Column(

&#x20;               crossAxisAlignment:

&#x20;                   CrossAxisAlignment.start,



&#x20;               children: \[



&#x20;                 Text(

&#x20;                   title,

&#x20;                   style: const TextStyle(

&#x20;                     fontSize: 18,

&#x20;                     fontWeight: FontWeight.bold,

&#x20;                   ),

&#x20;                 ),



&#x20;                 const SizedBox(height: 4),



&#x20;                 Text(

&#x20;                   subtitle,

&#x20;                   style: const TextStyle(

&#x20;                     color: Colors.black54,

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const Icon(

&#x20;             Icons.chevron\_right,

&#x20;             color: primaryMaroon,

&#x20;           ),

&#x20;         ],

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }

}

```

File home\_page.dart berisi tampilan halaman utama aplikasi. Halaman ini menampilkan informasi singkat aplikasi serta menu navigasi menuju halaman Form Mahasiswa dan Profil Developer menggunakan Navigator.push().



\*\*\*form\_mahasiswa\_page.dart\*\*\*

```

import 'package:flutter/material.dart';



class FormMahasiswaPage extends StatefulWidget {

&#x20; const FormMahasiswaPage({super.key});



&#x20; @override

&#x20; State<FormMahasiswaPage> createState() =>

&#x20;     \_FormMahasiswaPageState();

}



class \_FormMahasiswaPageState

&#x20;   extends State<FormMahasiswaPage> {



&#x20; static const Color primaryMaroon =

&#x20;     Color(0xFF7A1F2B);



&#x20; final namaController = TextEditingController();

&#x20; final nimController = TextEditingController();

&#x20; final kelasController = TextEditingController();



&#x20; String nama = "";

&#x20; String nim = "";

&#x20; String kelas = "";



&#x20; void simpanData() {

&#x20;   setState(() {

&#x20;     nama = namaController.text;

&#x20;     nim = nimController.text;

&#x20;     kelas = kelasController.text;

&#x20;   });



&#x20;   ScaffoldMessenger.of(context).showSnackBar(

&#x20;     const SnackBar(

&#x20;       backgroundColor: primaryMaroon,

&#x20;       content: Text(

&#x20;         "Data mahasiswa berhasil disimpan",

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }



&#x20; void resetForm() {

&#x20;   namaController.clear();

&#x20;   nimController.clear();

&#x20;   kelasController.clear();



&#x20;   setState(() {

&#x20;     nama = "";

&#x20;     nim = "";

&#x20;     kelas = "";

&#x20;   });

&#x20; }



&#x20; @override

&#x20; Widget build(BuildContext context) {

&#x20;   return Scaffold(

&#x20;     backgroundColor: const Color(0xFFFDF6F7),



&#x20;     appBar: AppBar(

&#x20;       centerTitle: true,

&#x20;       backgroundColor: primaryMaroon,

&#x20;       foregroundColor: Colors.white,

&#x20;       title: const Text(

&#x20;         "Form Mahasiswa",

&#x20;       ),

&#x20;     ),



&#x20;     body: SingleChildScrollView(

&#x20;       padding: const EdgeInsets.all(20),



&#x20;       child: Column(

&#x20;         crossAxisAlignment:

&#x20;             CrossAxisAlignment.start,



&#x20;         children: \[



&#x20;           const Text(

&#x20;             "Input Data Mahasiswa",

&#x20;             style: TextStyle(

&#x20;               fontSize: 24,

&#x20;               fontWeight: FontWeight.bold,

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 5),



&#x20;           const Text(

&#x20;             "Masukkan data mahasiswa dengan lengkap.",

&#x20;             style: TextStyle(

&#x20;               color: Colors.black54,

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 20),



&#x20;           Container(

&#x20;             padding: const EdgeInsets.all(20),



&#x20;             decoration: BoxDecoration(

&#x20;               color: Colors.white,

&#x20;               borderRadius:

&#x20;                   BorderRadius.circular(20),



&#x20;               boxShadow: \[

&#x20;                 BoxShadow(

&#x20;                   color:

&#x20;                       Colors.black.withOpacity(0.05),

&#x20;                   blurRadius: 10,

&#x20;                   offset: const Offset(0, 4),

&#x20;                 ),

&#x20;               ],

&#x20;             ),



&#x20;             child: Column(

&#x20;               children: \[



&#x20;                 TextField(

&#x20;                   controller: namaController,



&#x20;                   decoration: InputDecoration(

&#x20;                     labelText: "Nama Lengkap",

&#x20;                     prefixIcon:

&#x20;                         const Icon(Icons.person),

&#x20;                     border:

&#x20;                         OutlineInputBorder(

&#x20;                       borderRadius:

&#x20;                           BorderRadius.circular(

&#x20;                               12),

&#x20;                     ),

&#x20;                   ),

&#x20;                 ),



&#x20;                 const SizedBox(height: 15),



&#x20;                 TextField(

&#x20;                   controller: nimController,



&#x20;                   decoration: InputDecoration(

&#x20;                     labelText: "NIM",

&#x20;                     prefixIcon:

&#x20;                         const Icon(Icons.badge),

&#x20;                     border:

&#x20;                         OutlineInputBorder(

&#x20;                       borderRadius:

&#x20;                           BorderRadius.circular(

&#x20;                               12),

&#x20;                     ),

&#x20;                   ),

&#x20;                 ),



&#x20;                 const SizedBox(height: 15),



&#x20;                 TextField(

&#x20;                   controller: kelasController,



&#x20;                   decoration: InputDecoration(

&#x20;                     labelText: "Kelas",

&#x20;                     prefixIcon:

&#x20;                         const Icon(Icons.class\_),

&#x20;                     border:

&#x20;                         OutlineInputBorder(

&#x20;                       borderRadius:

&#x20;                           BorderRadius.circular(

&#x20;                               12),

&#x20;                     ),

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 20),



&#x20;           SizedBox(

&#x20;             width: double.infinity,



&#x20;             child: ElevatedButton.icon(

&#x20;               icon: const Icon(Icons.save),



&#x20;               style: ElevatedButton.styleFrom(

&#x20;                 backgroundColor: primaryMaroon,

&#x20;                 foregroundColor: Colors.white,

&#x20;                 padding:

&#x20;                     const EdgeInsets.symmetric(

&#x20;                   vertical: 15,

&#x20;                 ),

&#x20;               ),



&#x20;               onPressed: simpanData,



&#x20;               label: const Text(

&#x20;                 "Simpan Data",

&#x20;               ),

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 10),



&#x20;           SizedBox(

&#x20;             width: double.infinity,



&#x20;             child: OutlinedButton.icon(

&#x20;               icon: const Icon(Icons.refresh),



&#x20;               onPressed: resetForm,



&#x20;               style: OutlinedButton.styleFrom(

&#x20;                 foregroundColor: primaryMaroon,

&#x20;               ),



&#x20;               label: const Text(

&#x20;                 "Reset Form",

&#x20;               ),

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 25),



&#x20;           if (nama.isNotEmpty ||

&#x20;               nim.isNotEmpty ||

&#x20;               kelas.isNotEmpty)



&#x20;             Container(

&#x20;               width: double.infinity,

&#x20;               padding:

&#x20;                   const EdgeInsets.all(20),



&#x20;               decoration: BoxDecoration(

&#x20;                 color: const Color(0xFFF8EDEE),

&#x20;                 borderRadius:

&#x20;                     BorderRadius.circular(20),

&#x20;               ),



&#x20;               child: Column(

&#x20;                 crossAxisAlignment:

&#x20;                     CrossAxisAlignment.start,



&#x20;                 children: \[



&#x20;                   Row(

&#x20;                     children: const \[



&#x20;                       Icon(

&#x20;                         Icons.check\_circle,

&#x20;                         color: primaryMaroon,

&#x20;                       ),



&#x20;                       SizedBox(width: 10),



&#x20;                       Text(

&#x20;                         "Data Tersimpan",

&#x20;                         style: TextStyle(

&#x20;                           fontSize: 18,

&#x20;                           fontWeight:

&#x20;                               FontWeight.bold,

&#x20;                         ),

&#x20;                       ),

&#x20;                     ],

&#x20;                   ),



&#x20;                   const Divider(),



&#x20;                   Text(

&#x20;                     "Nama : $nama",

&#x20;                   ),



&#x20;                   const SizedBox(height: 8),



&#x20;                   Text(

&#x20;                     "NIM : $nim",

&#x20;                   ),



&#x20;                   const SizedBox(height: 8),



&#x20;                   Text(

&#x20;                     "Kelas : $kelas",

&#x20;                   ),

&#x20;                 ],

&#x20;               ),

&#x20;             ),



&#x20;           const SizedBox(height: 25),



&#x20;           SizedBox(

&#x20;             width: double.infinity,



&#x20;             child: ElevatedButton.icon(

&#x20;               icon:

&#x20;                   const Icon(Icons.arrow\_back),



&#x20;               style: ElevatedButton.styleFrom(

&#x20;                 backgroundColor:

&#x20;                     Colors.grey.shade700,

&#x20;                 foregroundColor:

&#x20;                     Colors.white,

&#x20;               ),



&#x20;               onPressed: () {

&#x20;                 Navigator.pop(context);

&#x20;               },



&#x20;               label: const Text(

&#x20;                 "Kembali",

&#x20;               ),

&#x20;             ),

&#x20;           ),

&#x20;         ],

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }

}

```

File form\_mahasiswa\_page.dart digunakan untuk mengelola input data mahasiswa. Halaman ini menggunakan StatefulWidget agar data yang dimasukkan pengguna dapat diperbarui dan ditampilkan secara langsung. Selain itu, terdapat fitur penyimpanan data dan notifikasi SnackBar ketika data berhasil disimpan.



\*\*\*profil\_page.dart\*\*\*

```

import 'package:flutter/material.dart';



class ProfilPage extends StatelessWidget {

&#x20; const ProfilPage({super.key});



&#x20; static const Color primaryMaroon =

&#x20;     Color(0xFF7A1F2B);



&#x20; @override

&#x20; Widget build(BuildContext context) {

&#x20;   return Scaffold(

&#x20;     backgroundColor: const Color(0xFFFDF6F7),



&#x20;     appBar: AppBar(

&#x20;       centerTitle: true,

&#x20;       backgroundColor: primaryMaroon,

&#x20;       foregroundColor: Colors.white,

&#x20;       title: const Text(

&#x20;         "Profil Developer",

&#x20;       ),

&#x20;     ),



&#x20;     body: SingleChildScrollView(

&#x20;       padding: const EdgeInsets.all(20),



&#x20;       child: Column(

&#x20;         children: \[



&#x20;           // HEADER PROFILE

&#x20;           Container(

&#x20;             width: double.infinity,

&#x20;             padding: const EdgeInsets.all(24),



&#x20;             decoration: BoxDecoration(

&#x20;               color: primaryMaroon,

&#x20;               borderRadius:

&#x20;                   BorderRadius.circular(24),

&#x20;             ),



&#x20;             child: const Column(

&#x20;               children: \[



&#x20;                 CircleAvatar(

&#x20;                   radius: 50,

&#x20;                   backgroundColor:

&#x20;                       Colors.white24,

&#x20;                   child: Icon(

&#x20;                     Icons.person,

&#x20;                     size: 55,

&#x20;                     color: Colors.white,

&#x20;                   ),

&#x20;                 ),



&#x20;                 SizedBox(height: 15),



&#x20;                 Text(

&#x20;                   "Nabila Shasya Sabrina",

&#x20;                   textAlign: TextAlign.center,

&#x20;                   style: TextStyle(

&#x20;                     color: Colors.white,

&#x20;                     fontSize: 22,

&#x20;                     fontWeight:

&#x20;                         FontWeight.bold,

&#x20;                   ),

&#x20;                 ),



&#x20;                 SizedBox(height: 5),



&#x20;                 Text(

&#x20;                   "Mahasiswa Informatika",

&#x20;                   style: TextStyle(

&#x20;                     color: Colors.white70,

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 25),



&#x20;           // CARD INFORMASI

&#x20;           Container(

&#x20;             width: double.infinity,

&#x20;             padding: const EdgeInsets.all(20),



&#x20;             decoration: BoxDecoration(

&#x20;               color: Colors.white,

&#x20;               borderRadius:

&#x20;                   BorderRadius.circular(20),



&#x20;               boxShadow: \[

&#x20;                 BoxShadow(

&#x20;                   color:

&#x20;                       Colors.black12,

&#x20;                   blurRadius: 10,

&#x20;                   offset:

&#x20;                       const Offset(0, 4),

&#x20;                 ),

&#x20;               ],

&#x20;             ),



&#x20;             child: const Column(

&#x20;               children: \[



&#x20;                 ListTile(

&#x20;                   leading: Icon(

&#x20;                     Icons.badge,

&#x20;                     color: primaryMaroon,

&#x20;                   ),

&#x20;                   title: Text("NIM"),

&#x20;                   subtitle:

&#x20;                       Text("2311102039"),

&#x20;                 ),



&#x20;                 Divider(),



&#x20;                 ListTile(

&#x20;                   leading: Icon(

&#x20;                     Icons.school,

&#x20;                     color: primaryMaroon,

&#x20;                   ),

&#x20;                   title: Text("Program Studi"),

&#x20;                   subtitle:

&#x20;                       Text("S1 Informatika"),

&#x20;                 ),



&#x20;                 Divider(),



&#x20;                 ListTile(

&#x20;                   leading: Icon(

&#x20;                     Icons.email,

&#x20;                     color: primaryMaroon,

&#x20;                   ),

&#x20;                   title: Text("Email"),

&#x20;                   subtitle: Text(

&#x20;                     "shsyaaaaa06@gmail.com",

&#x20;                   ),

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 20),



&#x20;           // CARD DESKRIPSI

&#x20;           Container(

&#x20;             width: double.infinity,

&#x20;             padding: const EdgeInsets.all(20),



&#x20;             decoration: BoxDecoration(

&#x20;               color: const Color(

&#x20;                   0xFFF8EDEE),

&#x20;               borderRadius:

&#x20;                   BorderRadius.circular(20),

&#x20;             ),



&#x20;             child: const Column(

&#x20;               crossAxisAlignment:

&#x20;                   CrossAxisAlignment.start,



&#x20;               children: \[



&#x20;                 Text(

&#x20;                   "Tentang Aplikasi",

&#x20;                   style: TextStyle(

&#x20;                     fontSize: 18,

&#x20;                     fontWeight:

&#x20;                         FontWeight.bold,

&#x20;                   ),

&#x20;                 ),



&#x20;                 SizedBox(height: 10),



&#x20;                 Text(

&#x20;                   "Aplikasi Flutter Form Mahasiswa by Nabila Shasya Sabrina.",

&#x20;                   textAlign:

&#x20;                       TextAlign.justify,

&#x20;                 ),

&#x20;               ],

&#x20;             ),

&#x20;           ),



&#x20;           const SizedBox(height: 25),



&#x20;           SizedBox(

&#x20;             width: double.infinity,



&#x20;             child: ElevatedButton.icon(

&#x20;               icon: const Icon(

&#x20;                 Icons.arrow\_back,

&#x20;               ),



&#x20;               style:

&#x20;                   ElevatedButton.styleFrom(

&#x20;                 backgroundColor:

&#x20;                     primaryMaroon,

&#x20;                 foregroundColor:

&#x20;                     Colors.white,

&#x20;                 padding:

&#x20;                     const EdgeInsets

&#x20;                         .symmetric(

&#x20;                   vertical: 15,

&#x20;                 ),

&#x20;               ),



&#x20;               onPressed: () {

&#x20;                 Navigator.pop(

&#x20;                     context);

&#x20;               },



&#x20;               label: const Text(

&#x20;                 "Kembali",

&#x20;               ),

&#x20;             ),

&#x20;           ),

&#x20;         ],

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }

}

```

File profil\_page.dart berisi informasi mengenai pengembang aplikasi. Halaman ini menampilkan identitas developer serta deskripsi singkat aplikasi. Pengguna dapat kembali ke halaman sebelumnya menggunakan tombol yang memanfaatkan Navigator.pop().



\---



\## 5. Screenshot Mobile

\---

\*\*\*1. Home Page\*\*\*

!\[](assets/1.png)



\*\*\*2. Form Mahasiswa\*\*\*

!\[](assets/2.png)



\*\*\*3. Profile Page\*\*\*

!\[](assets/3.png)

\---



\## Kesimpulan

\---

Aplikasi tersebut berhasil dibuat menggunakan Flutter dengan menerapkan konsep dasar pengembangan aplikasi mobile, seperti penggunaan StatefulWidget dan StatelessWidget, navigasi antar halaman menggunakan Navigator, penggunaan SnackBar sebagai notifikasi, serta desain antarmuka yang modern dengan tema warna maroon dan putih. Aplikasi ini dapat digunakan sebagai media sederhana untuk menginput dan menampilkan data mahasiswa.

