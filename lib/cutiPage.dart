import 'package:flutter/material.dart';

import 'main.dart';
import 'tugasPage.dart';
import 'absensiPage.dart';
import 'profilPage.dart';

// Widget CutiPage: Menyediakan tampilan halaman Kelola Cuti & Izin STAK dengan tata letak Backdrop Layout
class CutiPage extends StatelessWidget {
  const CutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data filter riwayat pengajuan, filter pertama dalam keadaan aktif
    const filter = ['Semua', 'Menunggu', 'Disetujui', 'Ditolak', 'Dibatalkan'];

    // Data riwayat pengajuan: (jenis, tanggal, status, warna latar status, warna teks status)
    const riwayat = [
      (
        'Izin Sakit',
        '25 Sep 2026 • 1 hari',
        'Disetujui',
        Color(0x99D3F7E2),
        Color(0xFF006D42),
      ),
      (
        'Cuti Khusus',
        '10 Agu 2026 • 2 hari',
        'Ditolak',
        Color(0xFFFFDAD6),
        Color(0xFF93000A),
      ),
      (
        'Cuti Tahunan',
        '01–02 Jul 2026 • 2 hari',
        'Dibatalkan',
        Color(0xFFDEEBE1),
        Color(0xFF495B50),
      ),
    ];

    // Widget Scaffold: Berfungsi sebagai struktur tata letak dasar halaman cuti (latar belakang, body, dan bottom navigation bar)
    return Scaffold(
      backgroundColor: const Color(0xFF003D24),
      // Widget SafeArea: Berfungsi memastikan konten bagian atas tidak terpotong oleh notch, kamera, atau status bar perangkat
      body: SafeArea(
        bottom: false,
        // Widget SingleChildScrollView: Berfungsi memungkinkan seluruh halaman cuti (backdrop dan sheet konten) dapat digulir
        child: SingleChildScrollView(
          // Widget Stack: Berfungsi menumpuk gambar ilustrasi hero dan gradasi hijau di belakang, lalu header dan sheet cuti di atasnya
          child: Stack(
            children: [
              // ==============================================================
              // 1. BACKDROP HEADER (ILUSTRASI, GRADASI HIJAU, JUDUL CUTI)
              // ==============================================================
              // Lapisan 1: Gambar Ilustrasi di Latar Belakang
              // Widget Positioned: Berfungsi menempatkan gambar hero dengan tinggi tetap 340 yang sama seperti Beranda
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
              // Widget Positioned: Berfungsi menempatkan lapisan gradasi hijau setinggi gambar hero
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

              // Lapisan 3: Header dan Sheet Cuti
              // Widget Column: Berfungsi menyusun header backdrop di atas dan sheet cuti di bawahnya
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget Container: Berfungsi membungkus konten header dan judul halaman dengan jarak dalam yang proporsional
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 28.0),
                    // Widget Column: Berfungsi menyusun bar header dan judul Kelola Cuti & Izin secara vertikal
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
                                // Widget Column: Berfungsi menyusun nama STAK dan label halaman Cuti secara vertikal
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
                                    // Widget Text: Berfungsi menampilkan label halaman Cuti berwarna hijau muda
                                    Text(
                                      'Cuti',
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
                        // 1.2 JUDUL KELOLA CUTI & IZIN
                        // --------------------------------------------------------
                        // Widget Text: Berfungsi menampilkan judul halaman Kelola Cuti & Izin dengan teks putih tebal
                        const Text(
                          'Kelola Cuti & Izin',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        // Widget SizedBox: Berfungsi memberi jarak kecil antara judul dan info periode
                        const SizedBox(height: 2),
                        // Widget Row: Berfungsi menyusun titik hijau terang dan teks periode tahun
                        Row(
                          children: [
                            // Widget Container: Berfungsi membentuk titik hijau terang bercahaya penanda periode aktif
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEEFBD8),
                                shape: BoxShape.circle,
                              ),
                            ),
                            // Widget SizedBox: Berfungsi memberi jarak antara titik dan teks periode
                            const SizedBox(width: 6),
                            // Widget Text: Berfungsi menampilkan periode tahun cuti
                            const Text(
                              'Periode Tahun 2026',
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
                  ),

                  // ==============================================================
                  // 2. BACKDROP SHEET (SALDO CUTI, PENGAJUAN AKTIF, RIWAYAT)
                  // ==============================================================
                  // Widget Container: Berfungsi sebagai permukaan sheet cuti dengan sudut atas melengkung khas Backdrop Layout
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
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 24.0),
                    // Widget Column: Berfungsi menyusun handle sheet, kartu saldo, tombol ajukan, dan daftar pengajuan secara vertikal
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // --------------------------------------------------------
                        // 2.0 INDIKATOR HANDLE DRAG DI ATAS SHEET
                        // --------------------------------------------------------
                        // Widget Center: Berfungsi memposisikan garis handle sheet tepat di tengah secara horizontal
                        Center(
                          // Widget Container: Berfungsi membuat garis kapsul abu-abu kehijauan sebagai indikator sheet
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0x99C9DCCE),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara handle sheet dan kartu saldo
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.1 KARTU SISA SALDO CUTI
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai kartu putih berisi sisa saldo cuti dan peringatan hangus
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xCCDEEBE1)),
                            boxShadow: const [
                              // Widget BoxShadow: Berfungsi memberi bayangan hijau sangat tipis pada kartu
                              BoxShadow(
                                color: Color(0x0A006D42),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          // Widget Column: Berfungsi menyusun isi kartu saldo cuti secara vertikal
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Widget Row: Berfungsi menyusun label Sisa Saldo Cuti di kiri dan badge jenis cuti di kanan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Widget Row: Berfungsi menyusun ikon kalender dan teks Sisa Saldo Cuti
                                  Row(
                                    children: const [
                                      // Widget Icon: Berfungsi menampilkan ikon kalender tersedia berwarna hijau primer
                                      Icon(
                                        Icons.event_available_outlined,
                                        size: 20,
                                        color: Color(0xFF006D42),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                      SizedBox(width: 8),
                                      // Widget Text: Berfungsi menampilkan label SISA SALDO CUTI
                                      Text(
                                        'SISA SALDO CUTI',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                          color: Color(0xFF131E18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Widget Container: Berfungsi sebagai badge abu kehijauan jenis Cuti Tahunan
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDEEBE1),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    // Widget Text: Berfungsi menampilkan teks jenis Cuti Tahunan
                                    child: const Text(
                                      'Cuti Tahunan',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara judul kartu dan angka saldo
                              const SizedBox(height: 14),

                              // Widget Row: Berfungsi menyusun angka sisa cuti di kiri dan info jatah di kanan sejajar garis dasar teks
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: const [
                                  // Widget Text: Berfungsi menampilkan angka sisa hari cuti dengan ukuran besar
                                  Text(
                                    '8',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF006D42),
                                    ),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara angka dan keterangan
                                  SizedBox(width: 8),
                                  // Widget Text: Berfungsi menampilkan keterangan hari tersisa
                                  Text(
                                    'hari tersisa',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                  // Widget Spacer: Berfungsi mendorong info jatah ke sisi kanan
                                  Spacer(),
                                  // Widget Text: Berfungsi menampilkan jatah dan jumlah cuti terpakai
                                  Text(
                                    'Jatah 12 · Terpakai 4',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara angka saldo dan kotak peringatan
                              const SizedBox(height: 12),

                              // Widget Container: Berfungsi sebagai kotak peringatan kuning cuti yang akan hangus
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF9E6),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFFDE49E),
                                  ),
                                ),
                                // Widget Row: Berfungsi menyusun ikon peringatan dan teks info hangus
                                child: Row(
                                  children: const [
                                    // Widget Icon: Berfungsi menampilkan ikon segitiga peringatan berwarna kuning tua
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      size: 18,
                                      color: Color(0xFF8A5D00),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks peringatan
                                    SizedBox(width: 8),
                                    // Widget Text: Berfungsi menampilkan info jumlah cuti yang akan hangus
                                    Text(
                                      '2 hari akan hangus pada 31 Des 2026',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8A5D00),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara kartu saldo dan tombol ajukan
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.2 TOMBOL AJUKAN CUTI / IZIN
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai tombol Ajukan cuti / izin bergradasi hijau dengan bayangan
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1EA66A), Color(0xFF006D42)],
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              // Widget BoxShadow: Berfungsi memberi bayangan agar tombol ajukan tampak menonjol
                              BoxShadow(
                                color: Color(0x33006D42),
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          // Widget Row: Berfungsi menyusun ikon tambah dan teks tombol di tengah
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              // Widget Icon: Berfungsi menampilkan ikon tambah putih
                              Icon(Icons.add, size: 20, color: Colors.white),
                              // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                              SizedBox(width: 8),
                              // Widget Text: Berfungsi menampilkan label tombol Ajukan cuti / izin
                              Text(
                                'Ajukan cuti / izin',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara tombol ajukan dan judul pengajuan aktif
                        const SizedBox(height: 20),

                        // --------------------------------------------------------
                        // 2.3 PENGAJUAN AKTIF
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun judul Pengajuan Aktif di kiri dan badge jumlah berjalan di kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Widget Text: Berfungsi menampilkan judul bagian Pengajuan Aktif
                            const Text(
                              'PENGAJUAN AKTIF',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                color: Color(0xFF526357),
                              ),
                            ),
                            // Widget Container: Berfungsi sebagai badge hijau muda jumlah pengajuan berjalan
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x99D3F7E2),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              // Widget Text: Berfungsi menampilkan teks 1 Berjalan
                              child: const Text(
                                '1 Berjalan',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF006D42),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara judul dan kartu pengajuan aktif
                        const SizedBox(height: 10),

                        // Widget Container: Berfungsi sebagai kartu putih pengajuan cuti yang sedang menunggu persetujuan
                        Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: const Color(0xB3DEEBE1)),
                          ),
                          // Widget Column: Berfungsi menyusun judul, detail, dan tombol batalkan secara vertikal
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Widget Row: Berfungsi menyusun jenis cuti di kiri dan badge status di kanan
                              Row(
                                children: [
                                  // Widget Icon: Berfungsi menampilkan ikon rentang tanggal berwarna hijau primer
                                  const Icon(
                                    Icons.date_range_outlined,
                                    size: 20,
                                    color: Color(0xFF006D42),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                  const SizedBox(width: 8),
                                  // Widget Text: Berfungsi menampilkan jenis pengajuan Cuti Tahunan
                                  const Text(
                                    'Cuti Tahunan',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF131E18),
                                    ),
                                  ),
                                  // Widget Spacer: Berfungsi mendorong badge status ke sisi kanan
                                  const Spacer(),
                                  // Widget Container: Berfungsi sebagai badge kuning status Menunggu
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF2CD),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    // Widget Text: Berfungsi menampilkan teks status Menunggu
                                    child: const Text(
                                      'Menunggu',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF916200),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara judul dan detail pengajuan
                              const SizedBox(height: 12),

                              // Widget Row: Berfungsi menyusun tanggal cuti di kiri dan nama approver di kanan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  // Widget Text: Berfungsi menampilkan rentang tanggal dan jumlah hari cuti
                                  Text(
                                    '12–14 Okt 2026 • 3 hari',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                  // Widget Text: Berfungsi menampilkan pihak yang menyetujui pengajuan
                                  Text(
                                    'Approver: HR Manager',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget Divider: Berfungsi memberi garis pemisah tipis sebelum tombol batalkan
                              const Divider(
                                height: 24,
                                color: Color(0x99DEEBE1),
                              ),

                              // Widget Row: Berfungsi menyusun ikon dan teks Batalkan di sisi kanan kartu
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  // Widget Icon: Berfungsi menampilkan ikon silang batal berwarna merah
                                  Icon(
                                    Icons.cancel_outlined,
                                    size: 15,
                                    color: Color(0xFFBA1A1A),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                  SizedBox(width: 4),
                                  // Widget Text: Berfungsi menampilkan label tombol Batalkan
                                  Text(
                                    'Batalkan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFBA1A1A),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara pengajuan aktif dan judul riwayat
                        const SizedBox(height: 20),

                        // --------------------------------------------------------
                        // 2.4 RIWAYAT PENGAJUAN & FILTER STATUS
                        // --------------------------------------------------------
                        // Widget Text: Berfungsi menampilkan judul bagian Riwayat Pengajuan
                        const Text(
                          'RIWAYAT PENGAJUAN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF526357),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara judul riwayat dan chip filter
                        const SizedBox(height: 10),

                        // Widget SingleChildScrollView: Berfungsi membuat baris chip filter dapat digulir secara horizontal
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          // Widget Row: Berfungsi menyusun chip filter status secara horizontal
                          child: Row(
                            children: [
                              for (final item in filter)
                                // Widget Container: Berfungsi sebagai chip filter kapsul, hijau penuh bila aktif
                                Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: item == 'Semua'
                                        ? const Color(0xFF006D42)
                                        : const Color(0xFFF6FCF8),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: item == 'Semua'
                                          ? const Color(0xFF006D42)
                                          : const Color(0x99DEEBE1),
                                    ),
                                  ),
                                  // Widget Text: Berfungsi menampilkan nama filter status
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: item == 'Semua'
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      color: item == 'Semua'
                                          ? Colors.white
                                          : const Color(0xFF526357),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara chip filter dan kartu riwayat
                        const SizedBox(height: 10),

                        for (final (jenis, tanggal, status, latar, teks)
                            in riwayat)
                          // Widget Container: Berfungsi sebagai kartu putih riwayat satu pengajuan cuti atau izin
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: const Color(0xB3DEEBE1),
                              ),
                            ),
                            // Widget Row: Berfungsi menyusun info pengajuan di kiri dan badge status di kanan
                            child: Row(
                              children: [
                                // Widget Expanded: Berfungsi membuat info pengajuan mengisi sisa lebar kartu
                                Expanded(
                                  // Widget Column: Berfungsi menyusun jenis dan tanggal pengajuan secara vertikal
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Widget Text: Berfungsi menampilkan jenis pengajuan
                                      Text(
                                        jenis,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF131E18),
                                        ),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara jenis dan tanggal
                                      const SizedBox(height: 2),
                                      // Widget Text: Berfungsi menampilkan tanggal dan lama pengajuan
                                      Text(
                                        tanggal,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF526357),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Widget Container: Berfungsi sebagai badge status pengajuan dengan warna sesuai status
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: latar,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  // Widget Text: Berfungsi menampilkan teks status pengajuan
                                  child: Text(
                                    status,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: teks,
                                    ),
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
      // 3. BOTTOM NAVIGATION BAR (5 MENU STAK, TAB CUTI AKTIF)
      // ==============================================================
      // Widget NavigationBar: Berfungsi sebagai bar navigasi bawah, tab Cuti aktif (index 3)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (index) {
          if (index != 3) {
            // Navigator.push: Berfungsi membuka halaman tujuan di atas halaman Cuti
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => switch (index) {
                  0 => const HomePage(),
                  1 => const TugasPage(),
                  2 => const AbsensiPage(),
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
