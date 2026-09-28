import 'package:flutter/material.dart';

import 'main.dart';
import 'absensiPage.dart';
import 'cutiPage.dart';
import 'profilPage.dart';

// Widget TugasPage: Menyediakan tampilan halaman Daftar Tugas STAK dengan tata letak Backdrop Layout
class TugasPage extends StatelessWidget {
  const TugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold: Berfungsi sebagai struktur tata letak dasar halaman tugas (latar belakang, body, dan bottom navigation bar)
    return Scaffold(
      backgroundColor: const Color(0xFF003D24),
      // Widget SafeArea: Berfungsi memastikan konten bagian atas tidak terpotong oleh notch, kamera, atau status bar perangkat
      body: SafeArea(
        bottom: false,
        // Widget SingleChildScrollView: Berfungsi memungkinkan seluruh halaman tugas (backdrop dan sheet daftar tugas) dapat digulir
        child: SingleChildScrollView(
          // Widget Stack: Berfungsi menumpuk gambar ilustrasi hero dan gradasi hijau di belakang, lalu header dan sheet daftar tugas di atasnya
          child: Stack(
            children: [
              // ==============================================================
              // 1. BACKDROP HEADER (ILUSTRASI, GRADASI HIJAU, JUDUL DAFTAR TUGAS)
              // ==============================================================
              // Lapisan 1: Gambar Ilustrasi di Latar Belakang
              // Widget Positioned: Berfungsi menempatkan gambar hero dengan tinggi tetap 340 yang sama seperti Beranda agar posisinya tidak berubah
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 340,
                // Widget Image: Berfungsi menampilkan gambar ilustrasi latar dari folder assets
                child: Image.asset(
                  'assets/hero_illustration.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Lapisan 2: Overlay Gradasi Hijau Khas STAK
              // Widget Positioned: Berfungsi menempatkan lapisan gradasi hijau setinggi gambar hero, sama seperti Beranda
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 340,
                // Widget Container: Berfungsi memberi efek gradasi hijau gelap ke hijau primer di atas gambar
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xE6003D24),
                        Color(0xBF005231),
                        Color(0xE6006D42),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Lapisan 3: Header dan Sheet Daftar Tugas
              // Widget Column: Berfungsi menyusun header backdrop di atas dan sheet daftar tugas di bawahnya, sheet menimpa bagian bawah gambar hero
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget Container: Berfungsi membungkus konten header dan judul halaman dengan jarak dalam yang proporsional
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                    // Widget Column: Berfungsi menyusun bar header dan baris judul Daftar Tugas secara vertikal
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --------------------------------------------------------
                        // 1.1 BAR NAVIGASI ATAS / HEADER DALAM BACKDROP
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun logo STAK di kiri dan tombol notifikasi serta foto profil di kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Widget Row: Berfungsi menyusun gambar logo dan teks judul aplikasi secara horizontal
                            Row(
                              children: [
                                // Widget Container: Berfungsi membungkus logo aplikasi dengan sudut melengkung
                                Container(
                                  width: 36,
                                  height: 36,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  // Widget Image: Berfungsi menampilkan gambar logo STAK dari folder assets
                                  child: Image.asset(
                                    'assets/logo.png',
                                    width: 36,
                                    height: 36,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // Widget SizedBox: Berfungsi memberi jarak horizontal antara logo dan teks judul
                                const SizedBox(width: 10),
                                // Widget Column: Berfungsi menyusun nama STAK dan label halaman Tugas Stak secara vertikal
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    // Widget Text: Berfungsi menampilkan nama aplikasi STAK dengan teks tebal putih
                                    Text(
                                      'STAK',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    // Widget Text: Berfungsi menampilkan label halaman Tugas Stak berwarna hijau muda
                                    Text(
                                      'Daftar Tugas',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEEFBD8),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Widget Row: Berfungsi menyusun ikon notifikasi dan avatar profil secara horizontal
                            Row(
                              children: [
                                // Widget Stack: Berfungsi menumpuk ikon lonceng dan titik merah indikator notifikasi baru
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Widget Container: Berfungsi sebagai area lingkaran untuk ikon notifikasi
                                    Container(
                                      width: 38,
                                      height: 38,
                                      decoration: const BoxDecoration(
                                        color: Color(0x26FFFFFF),
                                        shape: BoxShape.circle,
                                      ),
                                      // Widget Icon: Berfungsi menampilkan ikon lonceng notifikasi berwarna putih
                                      child: const Icon(
                                        Icons.notifications_outlined,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // Widget Positioned: Berfungsi mengatur posisi titik merah di sudut kanan atas ikon notifikasi
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      // Widget Container: Berfungsi membentuk titik merah bulat penanda notifikasi baru
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFBA1A1A),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF006D42),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara bar header dan judul halaman
                        const SizedBox(height: 32),

                        // --------------------------------------------------------
                        // 1.2 JUDUL DAFTAR TUGAS & TOMBOL TAMBAH
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun judul Daftar Tugas di kiri dan tombol Tambah di kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Widget Column: Berfungsi menyusun judul halaman dan info jumlah tugas berlangsung secara vertikal
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Widget Text: Berfungsi menampilkan judul halaman Daftar Tugas dengan teks putih tebal
                                const Text(
                                  'Daftar Tugas',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                // Widget SizedBox: Berfungsi memberi jarak kecil antara judul dan info jumlah tugas
                                const SizedBox(height: 2),
                                // Widget Row: Berfungsi menyusun titik hijau status dan teks jumlah tugas berlangsung
                                Row(
                                  children: [
                                    // Widget Container: Berfungsi membentuk titik hijau terang penanda tugas aktif
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEEFBD8),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara titik status dan teks
                                    const SizedBox(width: 6),
                                    // Widget Text: Berfungsi menampilkan jumlah tugas yang sedang berlangsung
                                    const Text(
                                      '4 tugas berlangsung',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xE6FFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Widget Container: Berfungsi sebagai tombol putih Tambah tugas dengan sudut melengkung dan bayangan
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  // Widget BoxShadow: Berfungsi memberi bayangan agar tombol Tambah tampak menonjol
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              // Widget Row: Berfungsi menyusun ikon plus dan teks Tambah secara horizontal
                              child: Row(
                                children: const [
                                  // Widget Icon: Berfungsi menampilkan ikon tambah berwarna hijau primer
                                  Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Color(0xFF006D42),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                  SizedBox(width: 6),
                                  // Widget Text: Berfungsi menampilkan label tombol Tambah
                                  Text(
                                    'Tambah',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006D42),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ==============================================================
                  // 2. BACKDROP SHEET (PENCARIAN, FILTER KATEGORI, DAFTAR KARTU TUGAS)
                  // ==============================================================
                  // Widget Container: Berfungsi sebagai permukaan sheet daftar tugas dengan sudut atas melengkung khas Backdrop Layout
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4FBF5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.0),
                        topRight: Radius.circular(28.0),
                      ),
                      boxShadow: [
                        // Widget BoxShadow: Berfungsi memberi bayangan lembut ke atas pada lengkungan sheet
                        BoxShadow(
                          color: Color(0x1F000000),
                          blurRadius: 24,
                          offset: Offset(0, -8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
                    // Widget Column: Berfungsi menyusun handle sheet, kolom pencarian, tab filter, dan daftar kartu tugas secara vertikal
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // --------------------------------------------------------
                        // 2.0 INDIKATOR HANDLE DRAG DI ATAS SHEET
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi memposisikan garis handle sheet agar tepat berada di tengah secara horizontal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Widget Container: Berfungsi membuat garis kapsul abu-abu kehijauan lembut sebagai indikator sheet
                            Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: const Color(0x99C9DCCE),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara handle sheet dan kolom pencarian
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.1 KOLOM PENCARIAN & TOMBOL FILTER
                        // --------------------------------------------------------
                        // Widget Padding: Berfungsi memberi jarak kiri dan kanan pada baris pencarian
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          // Widget Row: Berfungsi menyusun kolom pencarian dan tombol filter secara horizontal
                          child: Row(
                            children: [
                              // Widget Expanded: Berfungsi membuat kolom pencarian mengisi sisa lebar baris
                              Expanded(
                                // Widget Container: Berfungsi sebagai kotak putih pembungkus kolom pencarian dengan border halus
                                child: Container(
                                  height: 44,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: const Color(0xFFDEEBE1),
                                      width: 1.0,
                                    ),
                                  ),
                                  // Widget Row: Berfungsi menyusun ikon pencarian dan input teks secara horizontal
                                  child: Row(
                                    children: [
                                      // Widget Icon: Berfungsi menampilkan ikon kaca pembesar penanda kolom pencarian
                                      const Icon(
                                        Icons.search,
                                        size: 20,
                                        color: Color(0xFF6D7A70),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara ikon dan input teks
                                      const SizedBox(width: 8),
                                      // Widget Expanded: Berfungsi membuat input teks mengisi sisa ruang di dalam kotak pencarian
                                      const Expanded(
                                        // Widget TextField: Berfungsi sebagai input teks untuk mencari nama tugas atau proyek
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF131E18),
                                          ),
                                          // Widget InputDecoration: Berfungsi mengatur placeholder dan menghilangkan garis bawah bawaan TextField
                                          decoration: InputDecoration(
                                            hintText: 'Cari nama tugas atau proyek...',
                                            hintStyle: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF6D7A70),
                                            ),
                                            border: InputBorder.none,
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antara kolom pencarian dan tombol filter
                              const SizedBox(width: 8),
                              // Widget Container: Berfungsi sebagai tombol kotak putih untuk membuka opsi filter
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                ),
                                // Widget Icon: Berfungsi menampilkan ikon pengaturan filter
                                child: const Icon(
                                  Icons.tune,
                                  size: 20,
                                  color: Color(0xFF495B50),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara pencarian dan tab filter kategori
                        const SizedBox(height: 12),

                        // --------------------------------------------------------
                        // 2.2 TAB FILTER KATEGORI (GULIR HORIZONTAL)
                        // --------------------------------------------------------
                        // Widget SingleChildScrollView: Berfungsi membuat deretan tab filter kategori dapat digulir ke samping
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          // Widget Row: Berfungsi menyusun tab filter Semua, Digital Product, People & Culture, dan Engineering
                          child: Row(
                            children: [
                              // Tab Filter 1: Semua (Aktif)
                              // Widget Container: Berfungsi sebagai tab filter aktif berwarna hijau primer
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF006D42),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                // Widget Text: Berfungsi menampilkan label tab Semua beserta jumlah tugasnya
                                child: const Text(
                                  'Semua (4)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antar tab filter
                              const SizedBox(width: 8),
                              // Tab Filter 2: Digital Product
                              // Widget Container: Berfungsi sebagai tab filter tidak aktif berlatar putih dengan border halus
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                ),
                                // Widget Text: Berfungsi menampilkan label tab Digital Product beserta jumlah tugasnya
                                child: const Text(
                                  'Digital Product (1)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF495B50),
                                  ),
                                ),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antar tab filter
                              const SizedBox(width: 8),
                              // Tab Filter 3: People & Culture
                              // Widget Container: Berfungsi sebagai tab filter tidak aktif berlatar putih dengan border halus
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                ),
                                // Widget Text: Berfungsi menampilkan label tab People & Culture beserta jumlah tugasnya
                                child: const Text(
                                  'People & Culture (1)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF495B50),
                                  ),
                                ),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antar tab filter
                              const SizedBox(width: 8),
                              // Tab Filter 4: Engineering
                              // Widget Container: Berfungsi sebagai tab filter tidak aktif berlatar putih dengan border halus
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                ),
                                // Widget Text: Berfungsi menampilkan label tab Engineering beserta jumlah tugasnya
                                child: const Text(
                                  'Engineering (2)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF495B50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal sebelum daftar kartu tugas
                        const SizedBox(height: 14),

                        // --------------------------------------------------------
                        // 2.3 DAFTAR KARTU TUGAS
                        // --------------------------------------------------------
                        // Widget Padding: Berfungsi memberi jarak kiri dan kanan pada daftar kartu tugas
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          // Widget Column: Berfungsi menyusun empat kartu tugas secara vertikal
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Kartu Tugas 1: "Finalisasi Mockup Desain STAK v1.0"
                              // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas pertama
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi bayangan lembut pada kartu tugas pertama
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun baris badge, judul tugas, dan baris tenggat secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Row: Berfungsi menyusun badge kategori di kiri dan badge status di kanan
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Widget Container: Berfungsi sebagai badge kategori Digital Product berlatar hijau muda
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0x99D3F7E2),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan nama kategori Digital Product
                                          child: const Text(
                                            'Digital Product',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF006D42),
                                            ),
                                          ),
                                        ),
                                        // Widget Container: Berfungsi sebagai badge status In Progress berlatar hijau muda
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD3F7E2),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan status dan persentase progres tugas
                                          child: const Text(
                                            'In Progress',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF006D42),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara baris badge dan judul tugas
                                    const SizedBox(height: 10),
                                    // Widget Text: Berfungsi menampilkan judul tugas pertama dengan teks tebal
                                    const Text(
                                      'Finalisasi Mockup Desain STAK v1.0',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara judul dan garis pemisah
                                    const SizedBox(height: 12),
                                    // Widget Container: Berfungsi memberi garis pemisah atas dan membungkus baris tenggat waktu
                                    Container(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(0x99DEEBE1),
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      // Widget Row: Berfungsi menjaga badge tenggat agar selebar isinya dan rata kiri
                                      child: Row(
                                        children: [
                                          // Widget Container: Berfungsi sebagai badge tenggat merah penanda tugas mendesak
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0x99FFDAD6),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            // Widget Row: Berfungsi menyusun ikon jam dan teks tenggat waktu
                                            child: Row(
                                              children: const [
                                                // Widget Icon: Berfungsi menampilkan ikon jam penanda tenggat waktu
                                                Icon(
                                                  Icons.schedule,
                                                  size: 15,
                                                  color: Color(0xFFBA1A1A),
                                                ),
                                                // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                                SizedBox(width: 6),
                                                // Widget Text: Berfungsi menampilkan tenggat waktu tugas pertama
                                                Text(
                                                  'Hari ini, 17:00 WIB',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFFBA1A1A),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antar kartu tugas
                              const SizedBox(height: 14),

                              // Kartu Tugas 2: "Review Alur Approval Cuti Karyawan"
                              // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas kedua
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi bayangan lembut pada kartu tugas kedua
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun baris badge, judul tugas, dan baris tenggat secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Row: Berfungsi menyusun badge kategori di kiri dan badge status di kanan
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Widget Container: Berfungsi sebagai badge kategori People & Culture berlatar hijau pucat
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan nama kategori People & Culture
                                          child: const Text(
                                            'People & Culture',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ),
                                        // Widget Container: Berfungsi sebagai badge status To Do berlatar hijau pucat
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan status dan persentase progres tugas
                                          child: const Text(
                                            'To Do',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara baris badge dan judul tugas
                                    const SizedBox(height: 10),
                                    // Widget Text: Berfungsi menampilkan judul tugas kedua dengan teks tebal
                                    const Text(
                                      'Review Alur Approval Cuti Karyawan',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara judul dan garis pemisah
                                    const SizedBox(height: 12),
                                    // Widget Container: Berfungsi memberi garis pemisah atas dan membungkus baris tenggat waktu
                                    Container(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(0x99DEEBE1),
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      // Widget Row: Berfungsi menjaga badge tenggat agar selebar isinya dan rata kiri
                                      child: Row(
                                        children: [
                                          // Widget Container: Berfungsi sebagai badge tenggat berlatar hijau muda
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0x80D3F7E2),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            // Widget Row: Berfungsi menyusun ikon kalender dan teks tenggat waktu
                                            child: Row(
                                              children: const [
                                                // Widget Icon: Berfungsi menampilkan ikon kalender penanda jadwal tugas
                                                Icon(
                                                  Icons.event,
                                                  size: 15,
                                                  color: Color(0xFF006D42),
                                                ),
                                                // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                                SizedBox(width: 6),
                                                // Widget Text: Berfungsi menampilkan tenggat waktu tugas kedua
                                                Text(
                                                  'Besok, 12:00 WIB',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF006D42),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antar kartu tugas
                              const SizedBox(height: 14),

                              // Kartu Tugas 3: "Uji Coba Liveness Check & GPS Geofence"
                              // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas ketiga
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi bayangan lembut pada kartu tugas ketiga
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun baris badge, judul tugas, dan baris tanggal secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Row: Berfungsi menyusun badge kategori di kiri dan badge status di kanan
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Widget Container: Berfungsi sebagai badge kategori Engineering berlatar hijau pucat
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan nama kategori Engineering
                                          child: const Text(
                                            'Engineering',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF3C6752),
                                            ),
                                          ),
                                        ),
                                        // Widget Container: Berfungsi sebagai badge status Review berlatar hijau tersier
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFBEEDD2),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan status dan persentase progres tugas
                                          child: const Text(
                                            'Review',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF244F3B),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara baris badge dan judul tugas
                                    const SizedBox(height: 10),
                                    // Widget Text: Berfungsi menampilkan judul tugas ketiga dengan teks tebal
                                    const Text(
                                      'Uji Coba Liveness Check & GPS Geofence',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara judul dan garis pemisah
                                    const SizedBox(height: 12),
                                    // Widget Container: Berfungsi memberi garis pemisah atas dan membungkus baris tanggal
                                    Container(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(0x99DEEBE1),
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      // Widget Row: Berfungsi menyusun ikon kalender dan teks tanggal tugas
                                      child: Row(
                                        children: const [
                                          // Widget Icon: Berfungsi menampilkan ikon kalender berwarna hijau primer
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: Color(0xFF006D42),
                                          ),
                                          // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks tanggal
                                          SizedBox(width: 6),
                                          // Widget Text: Berfungsi menampilkan tanggal tenggat tugas ketiga
                                          Text(
                                            '29 Sep 2026',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antar kartu tugas
                              const SizedBox(height: 14),

                              // Kartu Tugas 4: "Dokumentasi API Integrasi Presensi"
                              // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas keempat
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi bayangan lembut pada kartu tugas keempat
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun baris badge, judul tugas, dan baris tanggal secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Row: Berfungsi menyusun badge kategori di kiri dan badge status di kanan
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Widget Container: Berfungsi sebagai badge kategori Engineering berlatar hijau pucat
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan nama kategori Engineering
                                          child: const Text(
                                            'Engineering',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF3C6752),
                                            ),
                                          ),
                                        ),
                                        // Widget Container: Berfungsi sebagai badge status To Do berlatar hijau pucat
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan status dan persentase progres tugas
                                          child: const Text(
                                            'To Do',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara baris badge dan judul tugas
                                    const SizedBox(height: 10),
                                    // Widget Text: Berfungsi menampilkan judul tugas keempat dengan teks tebal
                                    const Text(
                                      'Dokumentasi API Integrasi Presensi',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara judul dan garis pemisah
                                    const SizedBox(height: 12),
                                    // Widget Container: Berfungsi memberi garis pemisah atas dan membungkus baris tanggal
                                    Container(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(0x99DEEBE1),
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      // Widget Row: Berfungsi menyusun ikon kalender dan teks tanggal tugas
                                      child: Row(
                                        children: const [
                                          // Widget Icon: Berfungsi menampilkan ikon kalender berwarna hijau primer
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: Color(0xFF006D42),
                                          ),
                                          // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks tanggal
                                          SizedBox(width: 6),
                                          // Widget Text: Berfungsi menampilkan tanggal tenggat tugas keempat
                                          Text(
                                            '30 Sep 2026',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // ==============================================================
      // 3. BOTTOM NAVIGATION BAR (5 MENU STAK, TAB TUGAS AKTIF)
      // ==============================================================
      // Widget NavigationBar: Berfungsi sebagai bar navigasi bawah, tab Tugas aktif (index 1)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index != 1) {
            // Navigator.push: Berfungsi membuka halaman tujuan di atas halaman Tugas
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => switch (index) {
                  0 => const HomePage(),
                  2 => const AbsensiPage(),
                  3 => const CutiPage(),
                  _ => const ProfilPage(),
                },
              ),
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Beranda",
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: "Tugas",
          ),
          NavigationDestination(
            icon: Icon(Icons.fingerprint),
            label: "Absensi",
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note),
            label: "Cuti",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
