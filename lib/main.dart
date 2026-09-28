import 'package:flutter/material.dart';

import 'tugasPage.dart';
import 'absensiPage.dart';
import 'cutiPage.dart';
import 'profilPage.dart';

void main() {
  runApp(const MyApp());
}

// Widget MaterialApp: Berfungsi sebagai wrapper utama aplikasi dan mengatur tema serta konfigurasi dasar
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget MaterialApp: Root widget aplikasi Flutter yang mengatur konfigurasi tema, font, dan rute awal
    return MaterialApp(
      title: 'STAK - Sistem Aplikasi Karyawan',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Plus Jakarta Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006D42),
          primary: const Color(0xFF006D42),
          secondary: const Color(0xFF526357),
          surface: Colors.white,
        ),
        // NavigationBarThemeData: Berfungsi menyeragamkan gaya bottom navigation di semua halaman
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: const Color(0x33006D42),
          elevation: 8,
          height: 68,
          indicatorColor: const Color(0xFFDEEBE1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          iconTheme: WidgetStateProperty.resolveWith(
            (states) => IconThemeData(
              size: 24,
              color: states.contains(WidgetState.selected)
                  ? const Color(0xFF006D42)
                  : const Color(0xFF495B50),
            ),
          ),
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => TextStyle(
              fontSize: 11,
              fontWeight: states.contains(WidgetState.selected)
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: states.contains(WidgetState.selected)
                  ? const Color(0xFF006D42)
                  : const Color(0xFF495B50),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // Widget HomePage: Halaman beranda utama aplikasi STAK dengan tata letak Backdrop Layout
      home: const HomePage(),
    );
  }
}

// Widget HomePage: Menyediakan tampilan halaman beranda STAK dengan tata letak Backdrop Layout
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold: Berfungsi sebagai struktur tata letak dasar halaman (latar belakang, body, dan bottom navigation bar)
    return Scaffold(
      backgroundColor: const Color(0xFF003D24),
      // Widget SafeArea: Berfungsi memastikan konten bagian atas tidak terpotong oleh notch, kamera, atau status bar perangkat
      body: SafeArea(
        bottom: false,
        // Widget SingleChildScrollView: Berfungsi memungkinkan seluruh halaman beranda (backdrop dan sheet konten) dapat digulir secara fleksibel
        child: SingleChildScrollView(
          // Widget Stack: Berfungsi menumpuk gambar ilustrasi hero dan gradasi hijau di belakang, lalu header dan sheet konten di atasnya
          child: Stack(
            children: [
              // ==============================================================
              // 1. BACKDROP HEADER & GREETING (AREA HERO DENGAN ILUSTRASI & GRADASI HIJAU)
              // ==============================================================
              // Lapisan 1: Gambar Ilustrasi Hero Section di Latar Belakang
              // Widget Positioned: Berfungsi menempatkan gambar hero di atas dengan tinggi tetap 340 agar posisinya sama persis di halaman Beranda dan Tugas
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 340,
                // Widget Image: Berfungsi menampilkan gambar ilustrasi hero section dari folder assets
                child: Image.asset(
                  'assets/hero_illustration.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Lapisan 2: Overlay Gradasi Hijau Khas STAK
              // Widget Positioned: Berfungsi menempatkan lapisan gradasi hijau setinggi gambar hero agar teks tetap kontras
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 340,
                // Widget Container: Berfungsi memberi efek gradasi warna hijau gelap ke hijau primer khas tema STAK di atas gambar
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

              // Lapisan 3: Header dan Sheet Konten
              // Widget Column: Berfungsi menyusun header backdrop di atas dan sheet kartu melengkung di bawahnya, sheet menimpa bagian bawah gambar hero
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget Container: Berfungsi membungkus konten header, penanggalan, dan sapaan karyawan dengan batas jarak dalam yang proporsional
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                    // Widget Column: Berfungsi menyusun bar header, penanggalan, sapaan karyawan, dan sub-judul secara vertikal di dalam backdrop
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --------------------------------------------------------
                        // 1.1 BAR NAVIGASI ATAS / HEADER DALAM BACKDROP
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun logo STAK di sisi kiri dan tombol aksi (notifikasi & foto profil) di sisi kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Sisi Kiri: Logo dan Nama STAK
                            // Widget Row: Berfungsi menyusun gambar logo dan teks judul aplikasi secara horizontal
                            Row(
                              children: [
                                // Widget Container: Berfungsi membungkus logo aplikasi dengan batas sudut melengkung
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
                                // Widget SizedBox: Berfungsi memberikan jarak horizontal antara logo dan teks judul aplikasi
                                const SizedBox(width: 10),
                                // Widget Column: Berfungsi menyusun nama STAK dan teks penanda halaman Beranda secara vertikal
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    // Widget Text: Berfungsi menampilkan nama utama aplikasi STAK dengan teks tebal putih bersih
                                    Text(
                                      'STAK',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    // Widget Text: Berfungsi menampilkan label halaman Beranda dengan warna hijau muda cerah
                                    Text(
                                      'Beranda',
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

                            // Sisi Kanan: Notifikasi dan Avatar Profil
                            // Widget Row: Berfungsi menyusun tombol ikon notifikasi dan avatar foto profil secara horizontal
                            Row(
                              children: [
                                // Widget Stack: Berfungsi menumpuk ikon lonceng notifikasi dan titik indikator merah penanda pesan baru
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Widget Container: Berfungsi sebagai tombol lingkaran transparan putih untuk ikon notifikasi
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
                                    // Widget Positioned: Berfungsi mengatur posisi titik indikator merah di sudut kanan atas tombol notifikasi
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      // Widget Container: Berfungsi membentuk titik merah bulat indikator notifikasi baru
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

                        // Widget SizedBox: Berfungsi memberikan jarak vertikal antara bar header dan informasi tanggal
                        const SizedBox(height: 120),

                        // --------------------------------------------------------
                        // 1.2 TANGGAL & STATUS JAM KERJA AKTIF
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun informasi tanggal di sisi kiri dan status jam kerja aktif di sisi kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Sisi Kiri: Ikon Kalender dan Teks Tanggal
                            // Widget Row: Berfungsi menyusun ikon kalender dan teks tanggal kerja secara horizontal
                            Row(
                              children: const [
                                // Widget Icon: Berfungsi menampilkan ikon kalender penanggalan berwarna hijau muda cerah
                                Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: Color(0xFFEEFBD8),
                                ),
                                // Widget SizedBox: Berfungsi memberi jarak kecil antara ikon kalender dan teks tanggal
                                SizedBox(width: 6),
                                // Widget Text: Berfungsi menampilkan teks tanggal hari ini dengan huruf kapital berwarna putih
                                Text(
                                  'SENIN, 28 SEPTEMBER 2026',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ],
                            ),
                            // Sisi Kanan: Kapsul Badge Jam Kerja Aktif
                            // Widget Container: Berfungsi sebagai kapsul badge penanda status jam kerja aktif berwarna hijau muda lembut
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEFBD8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // Widget Row: Berfungsi menyusun titik hijau status dan teks label jam kerja aktif
                              child: Row(
                                children: [
                                  // Widget Container: Berfungsi menampilkan titik hijau kecil penanda status aktif
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF006D42),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak kecil antara titik indikator dan label status
                                  const SizedBox(width: 6),
                                  // Widget Text: Berfungsi menampilkan label teks status Jam Kerja Aktif berwarna hijau tua
                                  const Text(
                                    'Jam Kerja Aktif',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF274800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal menuju teks sapaan karyawan
                        const SizedBox(height: 4),

                        // --------------------------------------------------------
                        // 1.3 SAPAAN KARYAWAN & JABATAN
                        // --------------------------------------------------------
                        // Widget Text: Berfungsi menampilkan sapaan ramah kepada karyawan dengan teks putih tebal
                        const Text(
                          'Selamat pagi, Haykal 👋',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak kecil antara judul sapaan dan info divisi
                        const SizedBox(height: 4),

                        // Widget Text: Berfungsi menampilkan posisi jabatan dan divisi kerja karyawan dengan teks putih transparan lembut
                        const Text(
                          'Product Designer • Digital Experience Group',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xE6FFFFFF),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal di bagian bawah backdrop sebelum kurva sheet dimulai
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  // ==============================================================
                  // 2. BACKDROP BOTTOM SHEET (KURVA MELENGKUNG DENGAN SHADOW & LATAR #F4FBF5)
                  // ==============================================================
                  // Widget Container: Berfungsi sebagai permukaan sheet konten utama beranda dengan sudut atas melengkung khas Backdrop Layout
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4FBF5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.0),
                        topRight: Radius.circular(28.0),
                      ),
                      boxShadow: [
                        // Widget BoxShadow: Berfungsi memberikan efek bayangan lembut ke atas pada lengkungan sheet backdrop
                        BoxShadow(
                          color: Color(0x1F000000),
                          blurRadius: 24,
                          offset: Offset(0, -8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    // Widget Column: Berfungsi menyusun handle sheet, menu layanan cepat, kartu cuti, tugas prioritas, dan pengumuman secara vertikal
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --------------------------------------------------------
                        // 2.1 INDIKATOR HANDLE DRAG DI ATAS SHEET
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

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara handle sheet dan judul Layanan Cepat
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.2 MENU LAYANAN CEPAT (4 TOMBOL KARTU HORIZONTAL)
                        // --------------------------------------------------------
                        // Widget Padding: Berfungsi memberi jarak kiri kecil pada judul kategori Layanan Cepat
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          // Widget Text: Berfungsi menampilkan label kategori Layanan Cepat dengan huruf kapital berwarna abu kehijauan
                          child: Text(
                            'LAYANAN CEPAT',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF526357),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara label kategori dan baris tombol menu layanan
                        const SizedBox(height: 10),

                        // Widget Row: Berfungsi menyusun 4 kartu menu layanan cepat (Cuti, Riwayat, Lembur, Klaim) secara berjajar horizontal
                        Row(
                          children: [
                            // Item Layanan 1: Cuti
                            // Widget Expanded: Berfungsi membuat kartu menu Cuti memiliki porsi lebar yang sama rata dengan item lainnya
                            Expanded(
                              // Widget Container: Berfungsi sebagai kartu putih tombol menu Cuti dengan border halus dan bayangan lembut
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberikan efek elevasi lembut pada kartu Cuti
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun kotak ikon Cuti dan teks label Cuti secara vertikal
                                child: Column(
                                  children: [
                                    // Widget Container: Berfungsi sebagai kotak latar gradasi hijau muda lembut untuk ikon Cuti
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEEFBD8),
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                      // Widget Icon: Berfungsi menampilkan ikon spa daun untuk menu pengajuan cuti berwarna hijau primer
                                      child: const Icon(
                                        Icons.spa,
                                        size: 22,
                                        color: Color(0xFF006D42),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil antara ikon dan teks label
                                    const SizedBox(height: 6),
                                    // Widget Text: Berfungsi menampilkan label menu Cuti berwarna gelap
                                    const Text(
                                      'Cuti',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF131E18),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Widget SizedBox: Berfungsi memberi jarak horizontal antar tombol kartu menu
                            const SizedBox(width: 8),

                            // Item Layanan 2: Riwayat
                            // Widget Expanded: Berfungsi membagi ruang kartu menu Riwayat secara fleksibel dan seragam
                            Expanded(
                              // Widget Container: Berfungsi sebagai kartu putih tombol menu Riwayat
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberikan efek bayangan halus pada kartu Riwayat
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun wadah ikon dan label teks Riwayat
                                child: Column(
                                  children: [
                                    // Widget Container: Berfungsi sebagai kotak latar hijau lembut untuk ikon Riwayat
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBF6EE),
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                      // Widget Icon: Berfungsi menampilkan ikon kalender riwayat berwarna hijau primer
                                      child: const Icon(
                                        Icons.calendar_month,
                                        size: 22,
                                        color: Color(0xFF006D42),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil menuju teks label
                                    const SizedBox(height: 6),
                                    // Widget Text: Berfungsi menampilkan label teks Riwayat
                                    const Text(
                                      'Riwayat',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF131E18),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Widget SizedBox: Berfungsi memberi jarak horizontal antar tombol kartu menu
                            const SizedBox(width: 8),

                            // Item Layanan 3: Lembur
                            // Widget Expanded: Berfungsi membagi ruang kartu menu Lembur secara proporsional
                            Expanded(
                              // Widget Container: Berfungsi sebagai kartu putih tombol menu Lembur
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi kedalaman visual halus pada kartu Lembur
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun kotak ikon dan teks label Lembur
                                child: Column(
                                  children: [
                                    // Widget Container: Berfungsi sebagai wadah latar hijau lembut untuk ikon Lembur
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBF6EE),
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                      // Widget Icon: Berfungsi menampilkan ikon penambahan waktu untuk menu lembur
                                      child: const Icon(
                                        Icons.more_time,
                                        size: 22,
                                        color: Color(0xFF006D42),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil antara ikon dan teks
                                    const SizedBox(height: 6),
                                    // Widget Text: Berfungsi menampilkan label menu Lembur
                                    const Text(
                                      'Lembur',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF131E18),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Widget SizedBox: Berfungsi memberi jarak horizontal antar kartu
                            const SizedBox(width: 8),

                            // Item Layanan 4: Klaim
                            // Widget Expanded: Berfungsi memastikan kartu menu Klaim memiliki lebar seimbang di ujung kanan
                            Expanded(
                              // Widget Container: Berfungsi sebagai kartu putih tombol menu Klaim
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFDEEBE1),
                                    width: 1.0,
                                  ),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberikan efek bayangan halus pada kartu Klaim
                                    BoxShadow(
                                      color: Color(0x0A006D42),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                // Widget Column: Berfungsi menyusun kotak ikon dan teks label Klaim
                                child: Column(
                                  children: [
                                    // Widget Container: Berfungsi sebagai wadah latar hijau muda untuk ikon Klaim
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBF6EE),
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                      // Widget Icon: Berfungsi menampilkan ikon kuitansi untuk menu klaim keuangan/reimburse
                                      child: const Icon(
                                        Icons.receipt_long,
                                        size: 22,
                                        color: Color(0xFF006D42),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil antara ikon dan label
                                    const SizedBox(height: 6),
                                    // Widget Text: Berfungsi menampilkan label teks menu Klaim
                                    const Text(
                                      'Klaim',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF131E18),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal sebelum kartu Saldo Cuti
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.3 KARTU SALDO CUTI
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai kartu informasi sisa saldo cuti tahunan karyawan
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
                              // Widget BoxShadow: Berfungsi memberikan bayangan lembut pada kartu saldo cuti
                              BoxShadow(
                                color: Color(0x0A006D42),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // Widget Column: Berfungsi menyusun baris header judul cuti, angka saldo cuti, dan tautan pengajuan secara vertikal
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Baris Atas Kartu Cuti: Judul dan Ikon Pantai
                              // Widget Row: Berfungsi menyusun label Saldo Cuti di kiri dan ikon beach_access di kanan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  // Widget Text: Berfungsi menampilkan label judul Saldo Cuti berwarna abu kehijauan
                                  Text(
                                    'Saldo Cuti',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                  // Widget Icon: Berfungsi menampilkan ikon payung pantai penanda liburan/cuti berwarna hijau primer
                                  Icon(
                                    Icons.beach_access,
                                    size: 18,
                                    color: Color(0xFF006D42),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak vertikal menuju angka saldo cuti
                              const SizedBox(height: 12),

                              // Angka Saldo Cuti: "8 / 12 hari"
                              // Widget Row: Berfungsi menyusun angka besar sisa hari cuti dan total hak cuti secara horizontal
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: const [
                                  // Widget Text: Berfungsi menampilkan angka besar sisa kuota cuti karyawan (8)
                                  Text(
                                    '8',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF131E18),
                                    ),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak kecil antara angka utama dan satuan hari
                                  SizedBox(width: 4),
                                  // Widget Text: Berfungsi menampilkan teks total kuota cuti tahunan (/ 12 hari)
                                  Text(
                                    '/ 12 hari',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak kecil menuju masa berlaku cuti
                              const SizedBox(height: 4),

                              // Keterangan Masa Berlaku Cuti
                              // Widget Text: Berfungsi menampilkan catatan masa kedaluwarsa kuota cuti karyawan
                              const Text(
                                '2 hari s/d Des 2026',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3C6752),
                                ),
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak menuju tautan aksi pengajuan cuti
                              const SizedBox(height: 12),

                              // Tautan Aksi: "Ajukan ->"
                              // Widget Row: Berfungsi menyusun teks Ajukan dan ikon panah kanan secara horizontal
                              Row(
                                children: const [
                                  // Widget Text: Berfungsi menampilkan teks tautan aksi Ajukan berwarna hijau primer
                                  Text(
                                    'Ajukan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006D42),
                                    ),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak kecil antara teks dan ikon panah
                                  SizedBox(width: 4),
                                  // Widget Icon: Berfungsi menampilkan ikon panah kanan penunjuk alur formulir cuti
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 14,
                                    color: Color(0xFF006D42),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak vertikal sebelum bagian Tugas Prioritas
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.4 TUGAS PRIORITAS
                        // --------------------------------------------------------
                        // Baris Header Tugas Prioritas: Judul di kiri dan Link Lihat Semua di kanan
                        // Widget Row: Berfungsi menyusun header bagian tugas prioritas dan tombol lihat semua secara horizontal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Sisi Kiri: Ikon Checkmark dan Judul
                            // Widget Row: Berfungsi menyusun ikon tugas dan judul bagian secara horizontal
                            Row(
                              children: const [
                                // Widget Icon: Berfungsi menampilkan ikon centang tugas terselesaikan berwarna hijau primer #006D42
                                Icon(
                                  Icons.task_alt,
                                  size: 18,
                                  color: Color(0xFF006D42),
                                ),
                                // Widget SizedBox: Berfungsi memberi jarak antara ikon tugas dan teks judul
                                SizedBox(width: 6),
                                // Widget Text: Berfungsi menampilkan nama judul bagian Tugas Prioritas
                                Text(
                                  'Tugas Prioritas',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF131E18),
                                  ),
                                ),
                              ],
                            ),
                            // Sisi Kanan: Tautan Lihat Semua (5)
                            // Widget GestureDetector: Berfungsi mendeteksi ketukan pada tautan Lihat Semua untuk membuka halaman Tugas
                            GestureDetector(
                              // Navigator.push: Berfungsi membuka halaman TugasPage di atas halaman Beranda
                              onTap: () => Navigator.push(
                                context,
                                // MaterialPageRoute: Berfungsi membuat rute transisi halaman menuju TugasPage
                                MaterialPageRoute(
                                  builder: (context) => const TugasPage(),
                                ),
                              ),
                              // Widget Text: Berfungsi menampilkan link teks untuk melihat seluruh daftar tugas aktif karyawan
                              child: const Text(
                                'Lihat Semua (5)',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF006D42),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak menuju item tugas pertama
                        const SizedBox(height: 10),

                        // Item Tugas 1: "Finalisasi Mockup Desain STAK v1.0"
                        // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas prioritas pertama
                        Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: const Color(0xFFDEEBE1),
                              width: 1.0,
                            ),
                            boxShadow: const [
                              // Widget BoxShadow: Berfungsi memberi efek bayangan lembut pada kartu tugas pertama
                              BoxShadow(
                                color: Color(0x08006D42),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // Widget Row: Berfungsi menyusun isi keterangan tugas di kiri dan panah navigasi di kanan
                          child: Row(
                            children: [
                              // Widget Expanded: Berfungsi membuat kolom judul tugas dan metadata fleksibel memenuhi lebar kartu
                              Expanded(
                                // Widget Column: Berfungsi menyusun judul tugas dan baris status deadline secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Text: Berfungsi menampilkan judul deskripsi pekerjaan tugas pertama
                                    const Text(
                                      'Finalisasi Mockup Desain STAK v1.0',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil menuju info status pengerjaan
                                    const SizedBox(height: 6),
                                    // Widget Row: Berfungsi menyusun badge status In Progress, titik pemisah, dan tenggat waktu
                                    Row(
                                      children: [
                                        // Widget Container: Berfungsi sebagai kapsul badge penanda status In Progress berwarna hijau muda
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                            vertical: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0x99D3F7E2),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan teks status In Progress berwarna hijau primer
                                          child: const Text(
                                            'In Progress',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF006D42),
                                            ),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan tanda pemisah bulat antar informasi
                                        const Text(
                                          '•',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF526357),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan tenggat waktu penyelesaian tugas berwarna merah peringatan
                                        const Text(
                                          'Hari ini, 17:00',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFBA1A1A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Widget Icon: Berfungsi menampilkan ikon chevron penunjuk navigasi ke detail tugas
                              const Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Color(0xFF6D7A70),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antar item kartu tugas
                        const SizedBox(height: 8),

                        // Item Tugas 2: "Review Alur Approval Cuti Karyawan"
                        // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas prioritas kedua
                        Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: const Color(0xFFDEEBE1),
                              width: 1.0,
                            ),
                            boxShadow: const [
                              // Widget BoxShadow: Berfungsi memberi efek bayangan lembut pada kartu tugas kedua
                              BoxShadow(
                                color: Color(0x08006D42),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // Widget Row: Berfungsi menyusun konten tugas kedua di kiri dan panah navigasi di kanan
                          child: Row(
                            children: [
                              // Widget Expanded: Berfungsi membuat kolom teks tugas kedua fleksibel memenuhi ruang kartu
                              Expanded(
                                // Widget Column: Berfungsi menyusun judul tugas kedua dan baris statusnya secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Text: Berfungsi menampilkan judul deskripsi pekerjaan tugas kedua
                                    const Text(
                                      'Review Alur Approval Cuti Karyawan',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil menuju info status tugas
                                    const SizedBox(height: 6),
                                    // Widget Row: Berfungsi menyusun badge status To Do, titik pemisah, dan jadwal pengerjaan
                                    Row(
                                      children: [
                                        // Widget Container: Berfungsi sebagai kapsul badge penanda status To Do berwarna abu muda
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                            vertical: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan teks status To Do berwarna abu kehijauan
                                          child: const Text(
                                            'To Do',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF526357),
                                            ),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan titik pemisah bulat antar info
                                        const Text(
                                          '•',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF526357),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan jadwal batas waktu pengerjaan tugas kedua
                                        const Text(
                                          'Besok, 12:00',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF526357),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Widget Icon: Berfungsi menampilkan ikon panah navigasi chevron kanan
                              const Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Color(0xFF6D7A70),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antar item kartu tugas
                        const SizedBox(height: 8),

                        // Item Tugas 3: "Uji Coba Liveness Check & GPS Geofence"
                        // Widget Container: Berfungsi sebagai kartu putih pembungkus informasi tugas prioritas ketiga
                        Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: const Color(0xFFDEEBE1),
                              width: 1.0,
                            ),
                            boxShadow: const [
                              // Widget BoxShadow: Berfungsi memberi efek bayangan lembut pada kartu tugas ketiga
                              BoxShadow(
                                color: Color(0x08006D42),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // Widget Row: Berfungsi menyusun konten tugas ketiga di kiri dan panah navigasi di kanan
                          child: Row(
                            children: [
                              // Widget Expanded: Berfungsi membuat kolom teks tugas ketiga fleksibel memenuhi ruang kartu
                              Expanded(
                                // Widget Column: Berfungsi menyusun judul tugas ketiga dan baris statusnya secara vertikal
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Widget Text: Berfungsi menampilkan judul deskripsi pekerjaan tugas ketiga
                                    const Text(
                                      'Uji Coba Liveness Check & GPS Geofence',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak kecil menuju info status tugas
                                    const SizedBox(height: 6),
                                    // Widget Row: Berfungsi menyusun badge status Review, titik pemisah, dan tanggal tenggat
                                    Row(
                                      children: [
                                        // Widget Container: Berfungsi sebagai kapsul badge penanda status Review berwarna hijau tersier
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                            vertical: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFBEEDD2),
                                            borderRadius: BorderRadius.circular(
                                              4.0,
                                            ),
                                          ),
                                          // Widget Text: Berfungsi menampilkan teks status Review berwarna hijau tua
                                          child: const Text(
                                            'Review',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF244F3B),
                                            ),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan titik pemisah bulat antar info
                                        const Text(
                                          '•',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF526357),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak horizontal kecil
                                        const SizedBox(width: 6),
                                        // Widget Text: Berfungsi menampilkan tanggal tenggat tugas ketiga
                                        const Text(
                                          '29 Sep 2026',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF526357),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Widget Icon: Berfungsi menampilkan ikon panah navigasi chevron kanan
                              const Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Color(0xFF6D7A70),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi ruang kosong di bagian paling bawah sheet agar konten tidak terpotong nav bar
                        const SizedBox(height: 20),
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
      // 3. BOTTOM NAVIGATION BAR (5 MENU STAK)
      // ==============================================================
      // Widget NavigationBar: Berfungsi sebagai bar navigasi bawah, tab Beranda aktif (index 0)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index != 0) {
            // Navigator.push: Berfungsi membuka halaman tujuan di atas halaman Beranda
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => switch (index) {
                  1 => const TugasPage(),
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
