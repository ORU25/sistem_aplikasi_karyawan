import 'package:flutter/material.dart';

import 'main.dart';
import 'tugasPage.dart';
import 'absensiPage.dart';
import 'cutiPage.dart';

// Widget ProfilPage: Menyediakan tampilan halaman Profil Karyawan STAK dengan tata letak Backdrop Layout
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data informasi kerja: (label, nilai)
    const infoKerja = [
      ('Atasan Langsung', 'Budi Santoso · Head of Design'),
      ('Tipe Kerja', 'Kantor (WFO)'),
      ('Lokasi', 'Kantor Pusat · Samarinda'),
      ('Bergabung', '15 Januari 2023'),
      ('Jam Kerja', '08.00 – 17.00 WITA'),
    ];

    // Data kontak: (ikon, label, nilai)
    const kontak = [
      (Icons.mail_outline, 'Email Perusahaan', 'dimas.pratama@stak.co.id'),
      (Icons.call_outlined, 'Nomor Telepon', '+62 812-3456-7890'),
    ];

    // Data grup menu: (judul grup, daftar menu (ikon, judul, keterangan, nilai di kanan, tampilkan panah))
    const grupMenu = [
      (
        'KEAMANAN & AKUN',
        [(Icons.lock_reset, 'Ganti Kata Sandi', '', '', true)],
      ),
      (
        'PENGATURAN',
        [
          (
            Icons.notifications_active_outlined,
            'Notifikasi',
            'Pengingat absen & tugas harian',
            '',
            true,
          ),
          (Icons.translate, 'Bahasa', '', 'Bahasa Indonesia', true),
        ],
      ),
      (
        'LAINNYA',
        [
          (Icons.policy_outlined, 'Privasi & Persetujuan Data', '', '', true),
          (Icons.help_outline, 'Pusat Bantuan & Dukungan', '', '', true),
          (
            Icons.info_outline,
            'Versi Aplikasi',
            '',
            'v1.0.0 (Build 2026.09)',
            false,
          ),
        ],
      ),
    ];

    // Widget Scaffold: Berfungsi sebagai struktur tata letak dasar halaman profil (latar belakang, body, dan bottom navigation bar)
    return Scaffold(
      backgroundColor: const Color(0xFF003D24),
      // Widget SafeArea: Berfungsi memastikan konten bagian atas tidak terpotong oleh notch, kamera, atau status bar perangkat
      body: SafeArea(
        bottom: false,
        // Widget SingleChildScrollView: Berfungsi memungkinkan seluruh halaman profil (backdrop dan sheet konten) dapat digulir
        child: SingleChildScrollView(
          // Widget Stack: Berfungsi menumpuk gambar ilustrasi hero dan gradasi hijau di belakang, lalu header dan sheet profil di atasnya
          child: Stack(
            children: [
              // ==============================================================
              // 1. BACKDROP HEADER (ILUSTRASI, GRADASI HIJAU, IDENTITAS KARYAWAN)
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

              // Lapisan 3: Header dan Sheet Profil
              // Widget Column: Berfungsi menyusun header backdrop di atas dan sheet profil di bawahnya
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget Container: Berfungsi membungkus konten header dan identitas karyawan dengan jarak dalam yang proporsional
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 28.0),
                    // Widget Column: Berfungsi menyusun bar header dan identitas karyawan secara vertikal
                    child: Column(
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
                                // Widget Column: Berfungsi menyusun nama STAK dan label halaman Profil secara vertikal
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
                                    // Widget Text: Berfungsi menampilkan label halaman Profil berwarna hijau muda
                                    Text(
                                      'Profil',
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

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara bar header dan foto profil besar
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 1.2 FOTO PROFIL, NAMA, JABATAN, DAN NIK
                        // --------------------------------------------------------
                        // Widget Stack: Berfungsi menumpuk foto profil besar dan tombol kamera kecil di sudut kanan bawah
                        Stack(
                          children: [
                            // Widget Container: Berfungsi membentuk cincin putih tebal (lewat padding) dan bayangan di sekeliling foto profil
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  // Widget BoxShadow: Berfungsi memberi bayangan agar foto profil tampak menonjol
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              // Widget ClipOval: Berfungsi memotong foto menjadi lingkaran penuh di dalam cincin putih
                              child: ClipOval(
                                // Widget Image: Berfungsi menampilkan foto profil karyawan yang mengisi penuh lingkaran
                                child: Image.asset(
                                  'assets/profil.png',
                                  width: 76,
                                  height: 76,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Widget Positioned: Berfungsi menempatkan tombol kamera di sudut kanan bawah foto
                            Positioned(
                              right: 0,
                              bottom: 0,
                              // Widget Container: Berfungsi membentuk tombol lingkaran hijau untuk mengubah foto profil
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF006D42),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                // Widget Icon: Berfungsi menampilkan ikon kamera putih
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara foto profil dan nama karyawan
                        const SizedBox(height: 12),

                        // Widget Text: Berfungsi menampilkan nama lengkap karyawan dengan teks putih tebal
                        const Text(
                          'Muhammad Haykal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        // Widget SizedBox: Berfungsi memberi jarak kecil antara nama dan jabatan
                        const SizedBox(height: 2),
                        // Widget Text: Berfungsi menampilkan jabatan dan divisi karyawan
                        const Text(
                          'Product Designer · Digital Experience Group',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xD9FFFFFF),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara jabatan dan badge NIK
                        const SizedBox(height: 10),

                        // Widget Container: Berfungsi sebagai badge kapsul transparan berisi nomor induk karyawan
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0x33FFFFFF),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0x40FFFFFF)),
                          ),
                          // Widget Row: Berfungsi menyusun ikon kartu identitas dan teks NIK
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              // Widget Icon: Berfungsi menampilkan ikon kartu identitas berwarna hijau terang
                              Icon(
                                Icons.badge_outlined,
                                size: 14,
                                color: Color(0xFFADF84E),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks NIK
                              SizedBox(width: 6),
                              // Widget Text: Berfungsi menampilkan nomor induk karyawan
                              Text(
                                'NIK 2023-0147',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ==============================================================
                  // 2. BACKDROP SHEET (INFORMASI KERJA, KONTAK, MENU PENGATURAN)
                  // ==============================================================
                  // Widget Container: Berfungsi sebagai permukaan sheet profil dengan sudut atas melengkung khas Backdrop Layout
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
                    // Widget Column: Berfungsi menyusun handle sheet, kartu informasi, kontak, menu, dan tombol keluar secara vertikal
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

                        // Widget SizedBox: Berfungsi memberi jarak antara handle sheet dan kartu informasi kerja
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.1 KARTU INFORMASI KERJA
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai kartu putih berisi detail informasi pekerjaan karyawan
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xCCDEEBE1)),
                          ),
                          // Widget Column: Berfungsi menyusun judul kartu dan baris-baris informasi kerja
                          child: Column(
                            children: [
                              // Widget Row: Berfungsi menyusun ikon dan judul Informasi Kerja di kiri serta badge Aktif di kanan
                              Row(
                                children: [
                                  // Widget Icon: Berfungsi menampilkan ikon kartu identitas berwarna hijau primer
                                  const Icon(
                                    Icons.badge_outlined,
                                    size: 20,
                                    color: Color(0xFF006D42),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan judul
                                  const SizedBox(width: 8),
                                  // Widget Text: Berfungsi menampilkan judul kartu Informasi Kerja
                                  const Text(
                                    'Informasi Kerja',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF131E18),
                                    ),
                                  ),
                                  // Widget Spacer: Berfungsi mendorong badge Aktif ke sisi kanan
                                  const Spacer(),
                                  // Widget Container: Berfungsi sebagai badge hijau muda status karyawan Aktif
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0x99D3F7E2),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    // Widget Text: Berfungsi menampilkan teks status Aktif
                                    child: const Text(
                                      'Aktif',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF006D42),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (final (label, nilai) in infoKerja) ...[
                                // Widget Divider: Berfungsi memberi garis pemisah tipis antar baris informasi
                                const Divider(
                                  height: 20,
                                  color: Color(0x99DEEBE1),
                                ),
                                // Widget Row: Berfungsi menyusun label di kiri dan nilai informasi di kanan
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Widget Text: Berfungsi menampilkan label informasi kerja
                                    Text(
                                      label,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF6D7A70),
                                      ),
                                    ),
                                    // Widget Text: Berfungsi menampilkan nilai informasi kerja dengan teks tebal
                                    Text(
                                      nilai,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF131E18),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara kartu informasi kerja dan kartu kontak
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.2 KARTU KONTAK
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai kartu putih berisi email dan nomor telepon karyawan
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xCCDEEBE1)),
                          ),
                          // Widget Column: Berfungsi menyusun judul kontak, baris kontak, dan tautan Hubungi HR
                          child: Column(
                            children: [
                              // Widget Row: Berfungsi menyusun ikon dan judul kartu Kontak
                              Row(
                                children: const [
                                  // Widget Icon: Berfungsi menampilkan ikon telepon kontak berwarna hijau primer
                                  Icon(
                                    Icons.contact_phone_outlined,
                                    size: 20,
                                    color: Color(0xFF006D42),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan judul
                                  SizedBox(width: 8),
                                  // Widget Text: Berfungsi menampilkan judul kartu Kontak
                                  Text(
                                    'Kontak',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF131E18),
                                    ),
                                  ),
                                ],
                              ),
                              // Widget Divider: Berfungsi memberi garis pemisah di bawah judul kartu
                              const Divider(
                                height: 20,
                                color: Color(0x99DEEBE1),
                              ),
                              for (final (ikon, label, nilai) in kontak)
                                // Widget Padding: Berfungsi memberi jarak vertikal antar baris kontak
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  // Widget Row: Berfungsi menyusun ikon dan label di kiri serta nilai kontak di kanan
                                  child: Row(
                                    children: [
                                      // Widget Icon: Berfungsi menampilkan ikon jenis kontak berwarna hijau tersier
                                      Icon(
                                        ikon,
                                        size: 18,
                                        color: const Color(0xFF3C6752),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara ikon dan label
                                      const SizedBox(width: 10),
                                      // Widget Text: Berfungsi menampilkan label jenis kontak
                                      Text(
                                        label,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF6D7A70),
                                        ),
                                      ),
                                      // Widget Spacer: Berfungsi mendorong nilai kontak ke sisi kanan
                                      const Spacer(),
                                      // Widget Text: Berfungsi menampilkan nilai kontak dengan teks tebal
                                      Text(
                                        nilai,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF131E18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              // Widget Divider: Berfungsi memberi garis pemisah sebelum tautan Hubungi HR
                              const Divider(
                                height: 20,
                                color: Color(0x99DEEBE1),
                              ),
                              // Widget Row: Berfungsi menyusun teks Data salah? di kiri dan tautan Hubungi HR di kanan
                              Row(
                                children: const [
                                  // Widget Text: Berfungsi menampilkan pertanyaan Data salah?
                                  Text(
                                    'Data salah?',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF6D7A70),
                                    ),
                                  ),
                                  // Widget Spacer: Berfungsi mendorong tautan Hubungi HR ke sisi kanan
                                  Spacer(),
                                  // Widget Text: Berfungsi menampilkan tautan Hubungi HR berwarna hijau primer
                                  Text(
                                    'Hubungi HR',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006D42),
                                    ),
                                  ),
                                  // Widget Icon: Berfungsi menampilkan ikon panah kanan di samping tautan
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

                        // --------------------------------------------------------
                        // 2.3 GRUP MENU (KEAMANAN & AKUN, PENGATURAN, LAINNYA)
                        // --------------------------------------------------------
                        for (final (judul, menu) in grupMenu) ...[
                          // Widget SizedBox: Berfungsi memberi jarak sebelum judul grup menu
                          const SizedBox(height: 18),
                          // Widget Padding: Berfungsi memberi jarak kiri pada judul grup menu
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 6),
                            // Widget Text: Berfungsi menampilkan judul grup menu dalam huruf kapital
                            child: Text(
                              judul,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                color: Color(0xFF6D7A70),
                              ),
                            ),
                          ),
                          // Widget Container: Berfungsi sebagai kartu putih pembungkus daftar menu dalam satu grup
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: const Color(0xCCDEEBE1),
                              ),
                            ),
                            // Widget Column: Berfungsi menyusun baris-baris menu secara vertikal
                            child: Column(
                              children: [
                                for (final (ikon, nama, ket, nilai, panah)
                                    in menu) ...[
                                  // Widget Divider: Berfungsi memberi garis pemisah antar menu kecuali sebelum menu pertama
                                  if (nama != menu.first.$2)
                                    const Divider(
                                      height: 1,
                                      color: Color(0x99DEEBE1),
                                    ),
                                  // Widget Padding: Berfungsi memberi jarak dalam pada setiap baris menu
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    // Widget Row: Berfungsi menyusun ikon, nama menu, nilai, dan panah secara horizontal
                                    child: Row(
                                      children: [
                                        // Widget Container: Berfungsi sebagai kotak hijau muda pembungkus ikon menu
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEBF6EE),
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                          ),
                                          // Widget Icon: Berfungsi menampilkan ikon menu berwarna hijau primer
                                          child: Icon(
                                            ikon,
                                            size: 18,
                                            color: const Color(0xFF006D42),
                                          ),
                                        ),
                                        // Widget SizedBox: Berfungsi memberi jarak antara ikon dan nama menu
                                        const SizedBox(width: 12),
                                        // Widget Expanded: Berfungsi membuat nama menu mengisi sisa lebar baris
                                        Expanded(
                                          // Widget Column: Berfungsi menyusun nama menu dan keterangan singkatnya
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Widget Text: Berfungsi menampilkan nama menu
                                              Text(
                                                nama,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF131E18),
                                                ),
                                              ),
                                              // Widget Text: Berfungsi menampilkan keterangan menu bila ada
                                              if (ket.isNotEmpty)
                                                Text(
                                                  ket,
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xFF6D7A70),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        // Widget Container: Berfungsi sebagai label abu kecil berisi nilai menu bila ada
                                        if (nilai.isNotEmpty)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFEBF6EE),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            // Widget Text: Berfungsi menampilkan nilai menu seperti bahasa atau versi aplikasi
                                            child: Text(
                                              nilai,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF526357),
                                              ),
                                            ),
                                          ),
                                        // Widget Icon: Berfungsi menampilkan ikon panah kanan penanda menu dapat dibuka
                                        if (panah)
                                          const Icon(
                                            Icons.chevron_right,
                                            size: 18,
                                            color: Color(0xFF9AA69D),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],

                        // Widget SizedBox: Berfungsi memberi jarak antara grup menu terakhir dan tombol keluar
                        const SizedBox(height: 20),

                        // --------------------------------------------------------
                        // 2.4 TOMBOL KELUAR DARI AKUN
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai tombol merah muda Keluar dari Akun dengan border merah
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF2F2),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: const Color(0xFFFECACA)),
                          ),
                          // Widget Row: Berfungsi menyusun ikon keluar dan teks tombol di tengah
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              // Widget Icon: Berfungsi menampilkan ikon logout berwarna merah
                              Icon(
                                Icons.logout,
                                size: 20,
                                color: Color(0xFFDC2626),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                              SizedBox(width: 8),
                              // Widget Text: Berfungsi menampilkan label tombol Keluar dari Akun
                              Text(
                                'Keluar dari Akun',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFDC2626),
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
      // 3. BOTTOM NAVIGATION BAR (5 MENU STAK, TAB PROFIL AKTIF)
      // ==============================================================
      // Widget NavigationBar: Berfungsi sebagai bar navigasi bawah, tab Profil aktif (index 4)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (index) {
          if (index != 4) {
            // Navigator.push: Berfungsi membuka halaman tujuan di atas halaman Profil
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => switch (index) {
                  0 => const HomePage(),
                  1 => const TugasPage(),
                  2 => const AbsensiPage(),
                  _ => const CutiPage(),
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
