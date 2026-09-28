import 'package:flutter/material.dart';

import 'main.dart';
import 'tugasPage.dart';
import 'cutiPage.dart';
import 'profilPage.dart';

// Widget AbsensiPage: Menyediakan tampilan halaman Absensi Karyawan STAK dengan tata letak Backdrop Layout
class AbsensiPage extends StatelessWidget {
  const AbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data ringkasan kehadiran bulan ini: (label, jumlah, warna angka)
    const rekap = [
      ('Hadir', '18', Color(0xFF006D42)),
      ('Terlambat', '2', Color(0xFFBA1A1A)),
      ('Alpa', '0', Color(0xFF131E18)),
      ('Cuti', '1', Color(0xFF3C6752)),
    ];

    // Data riwayat absensi per hari: (tanggal, keterangan, status, warna latar status, warna teks status)
    const riwayat = [
      (
        '25 September 2026',
        '07:55 - 17:02 WITA',
        'Tepat waktu',
        Color(0x99D3F7E2),
        Color(0xFF006D42),
      ),
      (
        '24 September 2026',
        '08:15 - 17:00 WITA',
        'Terlambat',
        Color(0xFFFFDAD6),
        Color(0xFF93000A),
      ),
      (
        '23 September 2026',
        'Cuti Tahunan',
        'Cuti',
        Color(0xFFBEEDD2),
        Color(0xFF002114),
      ),
    ];

    // Widget Scaffold: Berfungsi sebagai struktur tata letak dasar halaman absensi (latar belakang, body, dan bottom navigation bar)
    return Scaffold(
      backgroundColor: const Color(0xFF003D24),
      // Widget SafeArea: Berfungsi memastikan konten bagian atas tidak terpotong oleh notch, kamera, atau status bar perangkat
      body: SafeArea(
        bottom: false,
        // Widget SingleChildScrollView: Berfungsi memungkinkan seluruh halaman absensi (backdrop dan sheet konten) dapat digulir
        child: SingleChildScrollView(
          // Widget Stack: Berfungsi menumpuk gambar ilustrasi hero dan gradasi hijau di belakang, lalu header dan sheet absensi di atasnya
          child: Stack(
            children: [
              // ==============================================================
              // 1. BACKDROP HEADER (ILUSTRASI, GRADASI HIJAU, JUDUL ABSENSI)
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

              // Lapisan 3: Header dan Sheet Absensi
              // Widget Column: Berfungsi menyusun header backdrop di atas dan sheet absensi di bawahnya
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget Container: Berfungsi membungkus konten header dan judul halaman dengan jarak dalam yang proporsional
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 28.0),
                    // Widget Column: Berfungsi menyusun bar header, baris tanggal, dan judul Absensi secara vertikal
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
                                // Widget Column: Berfungsi menyusun nama STAK dan label halaman Absensi secara vertikal
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
                                    // Widget Text: Berfungsi menampilkan label halaman Absensi berwarna hijau muda
                                    Text(
                                      'Absensi',
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

                        // Widget SizedBox: Berfungsi memberi jarak vertikal antara bar header dan baris tanggal
                        const SizedBox(height: 56),

                        // --------------------------------------------------------
                        // 1.2 BARIS TANGGAL & STATUS LOKASI
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun tanggal hari ini di kiri dan badge Lokasi Aktif di kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Widget Row: Berfungsi menyusun ikon kalender dan teks tanggal secara horizontal
                            Row(
                              children: const [
                                // Widget Icon: Berfungsi menampilkan ikon kalender berwarna hijau muda
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 14,
                                  color: Color(0xFFEEFBD8),
                                ),
                                // Widget SizedBox: Berfungsi memberi jarak antara ikon kalender dan teks tanggal
                                SizedBox(width: 6),
                                // Widget Text: Berfungsi menampilkan tanggal hari ini dalam huruf kapital
                                Text(
                                  'SENIN, 28 SEPTEMBER 2026',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    color: Color(0xF2FFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            // Widget Container: Berfungsi sebagai badge kapsul hijau muda penanda lokasi absensi aktif
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEFBD8),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              // Widget Row: Berfungsi menyusun titik hijau dan teks Lokasi Aktif
                              child: Row(
                                children: [
                                  // Widget Container: Berfungsi membentuk titik hijau penanda lokasi aktif
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF006D42),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara titik dan teks
                                  const SizedBox(width: 6),
                                  // Widget Text: Berfungsi menampilkan label Lokasi Aktif
                                  const Text(
                                    'Lokasi Aktif',
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

                        // Widget SizedBox: Berfungsi memberi jarak antara baris tanggal dan judul halaman
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 1.3 JUDUL ABSENSI KARYAWAN
                        // --------------------------------------------------------
                        // Widget Text: Berfungsi menampilkan judul halaman Absensi Karyawan dengan teks putih tebal
                        const Text(
                          'Absensi Karyawan',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        // Widget SizedBox: Berfungsi memberi jarak kecil antara judul dan subjudul
                        const SizedBox(height: 2),
                        // Widget Text: Berfungsi menampilkan subjudul penjelasan halaman absensi
                        const Text(
                          'Kelola kehadiran dan riwayat presensi Anda',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xE6FFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ==============================================================
                  // 2. BACKDROP SHEET (KARTU HARI INI, REKAP BULANAN, RIWAYAT)
                  // ==============================================================
                  // Widget Container: Berfungsi sebagai permukaan sheet absensi dengan sudut atas melengkung khas Backdrop Layout
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
                    // Widget Column: Berfungsi menyusun handle sheet, kartu hari ini, rekap, dan riwayat absensi secara vertikal
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

                        // Widget SizedBox: Berfungsi memberi jarak antara handle sheet dan kartu hari ini
                        const SizedBox(height: 16),

                        // --------------------------------------------------------
                        // 2.1 KARTU ABSENSI HARI INI & TOMBOL CLOCK-IN
                        // --------------------------------------------------------
                        // Widget Container: Berfungsi sebagai kartu putih berisi status, jam kerja, dan tombol clock-in hari ini
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
                          // Widget Column: Berfungsi menyusun isi kartu hari ini secara vertikal
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Widget Row: Berfungsi menyusun label Hari Ini di kiri dan badge Belum absen di kanan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Widget Row: Berfungsi menyusun ikon kalender dan teks Hari Ini
                                  Row(
                                    children: const [
                                      // Widget Icon: Berfungsi menampilkan ikon kalender hari ini berwarna hijau primer
                                      Icon(
                                        Icons.today_outlined,
                                        size: 18,
                                        color: Color(0xFF006D42),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                      SizedBox(width: 6),
                                      // Widget Text: Berfungsi menampilkan label HARI INI
                                      Text(
                                        'HARI INI',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                          color: Color(0xFF131E18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Widget Container: Berfungsi sebagai badge merah muda status Belum absen
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFDAD6),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    // Widget Text: Berfungsi menampilkan teks status Belum absen
                                    child: const Text(
                                      'Belum absen',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF93000A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara baris judul kartu dan baris jadwal
                              const SizedBox(height: 16),

                              // Widget Row: Berfungsi menyusun tanggal di kiri dan jam kerja di kanan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  // Widget Text: Berfungsi menampilkan tanggal hari ini
                                  Text(
                                    'Senin, 28 September 2026',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                  // Widget Text: Berfungsi menampilkan jadwal jam kerja
                                  Text(
                                    '08.00–17.00 WITA',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF131E18),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara baris jadwal dan kotak jam
                              const SizedBox(height: 10),

                              // Widget Row: Berfungsi menyusun kotak Jam Masuk dan Jam Pulang berdampingan
                              Row(
                                children: [
                                  for (final label in [
                                    'Jam Masuk',
                                    'Jam Pulang',
                                  ]) ...[
                                    // Widget Expanded: Berfungsi membuat kedua kotak jam memiliki lebar yang sama
                                    Expanded(
                                      // Widget Container: Berfungsi sebagai kotak hijau sangat muda berisi label dan jam
                                      child: Container(
                                        padding: const EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF6FCF8),
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                          border: Border.all(
                                            color: const Color(0x99DEEBE1),
                                          ),
                                        ),
                                        // Widget Column: Berfungsi menyusun label dan jam secara vertikal di tengah
                                        child: Column(
                                          children: [
                                            // Widget Text: Berfungsi menampilkan label Jam Masuk / Jam Pulang
                                            Text(
                                              label,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF526357),
                                              ),
                                            ),
                                            // Widget SizedBox: Berfungsi memberi jarak antara label dan jam
                                            const SizedBox(height: 2),
                                            // Widget Text: Berfungsi menampilkan jam absen (kosong karena belum absen)
                                            const Text(
                                              '--:--',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF131E18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antar kotak jam
                                    if (label == 'Jam Masuk')
                                      const SizedBox(width: 12),
                                  ],
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara kotak jam dan info lokasi
                              const SizedBox(height: 14),

                              // Widget Row: Berfungsi menyusun ikon lokasi dan teks lokasi kantor
                              Row(
                                children: const [
                                  // Widget Icon: Berfungsi menampilkan ikon pin lokasi berwarna hijau primer
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                    color: Color(0xFF006D42),
                                  ),
                                  // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks lokasi
                                  SizedBox(width: 6),
                                  // Widget Text: Berfungsi menampilkan nama kantor dan radius absensi
                                  Text(
                                    'Kantor Pusat · radius 100 m',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF526357),
                                    ),
                                  ),
                                ],
                              ),

                              // Widget SizedBox: Berfungsi memberi jarak antara info lokasi dan tombol clock-in
                              const SizedBox(height: 14),

                              // Widget Container: Berfungsi sebagai tombol Clock-in bergradasi hijau dengan bayangan
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1EA66A),
                                      Color(0xFF006D42),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: const [
                                    // Widget BoxShadow: Berfungsi memberi bayangan agar tombol clock-in tampak menonjol
                                    BoxShadow(
                                      color: Color(0x33006D42),
                                      blurRadius: 8,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                // Widget Row: Berfungsi menyusun ikon sidik jari dan teks Clock-in di tengah tombol
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    // Widget Icon: Berfungsi menampilkan ikon sidik jari putih
                                    Icon(
                                      Icons.fingerprint,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                                    SizedBox(width: 8),
                                    // Widget Text: Berfungsi menampilkan label tombol Clock-in
                                    Text(
                                      'Clock-in',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara kartu hari ini dan judul rekap bulanan
                        const SizedBox(height: 20),

                        // --------------------------------------------------------
                        // 2.2 REKAP KEHADIRAN BULAN INI
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun judul bulan di kiri dan ikon dropdown di kanan
                        Row(
                          children: const [
                            // Widget Icon: Berfungsi menampilkan ikon rentang tanggal berwarna hijau primer
                            Icon(
                              Icons.date_range_outlined,
                              size: 18,
                              color: Color(0xFF006D42),
                            ),
                            // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks bulan
                            SizedBox(width: 6),
                            // Widget Text: Berfungsi menampilkan bulan rekap kehadiran
                            Text(
                              'September 2026',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF131E18),
                              ),
                            ),
                            // Widget Spacer: Berfungsi mendorong ikon dropdown ke sisi kanan
                            Spacer(),
                            // Widget Icon: Berfungsi menampilkan ikon panah bawah untuk memilih bulan
                            Icon(
                              Icons.expand_more,
                              size: 20,
                              color: Color(0xFF6D7A70),
                            ),
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara judul bulan dan kartu rekap
                        const SizedBox(height: 12),

                        // Widget Row: Berfungsi menyusun 4 kartu rekap (Hadir, Terlambat, Alpa, Cuti) secara merata
                        Row(
                          children: [
                            for (final (label, jumlah, warna) in rekap) ...[
                              // Widget Expanded: Berfungsi membuat keempat kartu rekap memiliki lebar yang sama
                              Expanded(
                                // Widget Container: Berfungsi sebagai kartu putih kecil berisi label dan jumlah rekap
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: const Color(0xB3DEEBE1),
                                    ),
                                  ),
                                  // Widget Column: Berfungsi menyusun label dan angka rekap secara vertikal
                                  child: Column(
                                    children: [
                                      // Widget Text: Berfungsi menampilkan label kategori rekap
                                      Text(
                                        label,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF526357),
                                        ),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara label dan angka
                                      const SizedBox(height: 2),
                                      // Widget Text: Berfungsi menampilkan jumlah hari sesuai warna kategori
                                      Text(
                                        jumlah,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: warna,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Widget SizedBox: Berfungsi memberi jarak antar kartu rekap kecuali setelah kartu terakhir
                              if (label != 'Cuti') const SizedBox(width: 8),
                            ],
                          ],
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara kartu rekap dan judul riwayat
                        const SizedBox(height: 20),

                        // --------------------------------------------------------
                        // 2.3 RIWAYAT ABSENSI PER HARI
                        // --------------------------------------------------------
                        // Widget Text: Berfungsi menampilkan judul bagian Riwayat Per Hari
                        const Text(
                          'RIWAYAT PER HARI',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF526357),
                          ),
                        ),

                        // Widget SizedBox: Berfungsi memberi jarak antara judul riwayat dan kartu pertama
                        const SizedBox(height: 10),

                        for (final (tanggal, keterangan, status, latar, teks)
                            in riwayat)
                          // Widget Container: Berfungsi sebagai kartu putih riwayat absensi satu hari
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
                            // Widget Row: Berfungsi menyusun info tanggal di kiri dan badge status di kanan
                            child: Row(
                              children: [
                                // Widget Expanded: Berfungsi membuat info tanggal mengisi sisa lebar kartu
                                Expanded(
                                  // Widget Column: Berfungsi menyusun tanggal dan keterangan jam secara vertikal
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Widget Text: Berfungsi menampilkan tanggal riwayat absensi
                                      Text(
                                        tanggal,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF131E18),
                                        ),
                                      ),
                                      // Widget SizedBox: Berfungsi memberi jarak antara tanggal dan keterangan
                                      const SizedBox(height: 2),
                                      // Widget Text: Berfungsi menampilkan jam masuk-pulang atau keterangan cuti
                                      Text(
                                        keterangan,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF526357),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Widget Container: Berfungsi sebagai badge status kehadiran dengan warna sesuai status
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: latar,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  // Widget Text: Berfungsi menampilkan teks status kehadiran
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

                        // Widget SizedBox: Berfungsi memberi jarak antara riwayat dan tautan koreksi
                        const SizedBox(height: 12),

                        // --------------------------------------------------------
                        // 2.4 TAUTAN AJUKAN KOREKSI ABSENSI
                        // --------------------------------------------------------
                        // Widget Row: Berfungsi menyusun ikon dan teks tautan koreksi absensi di tengah
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // Widget Icon: Berfungsi menampilkan ikon catatan edit berwarna hijau primer
                            Icon(
                              Icons.edit_note,
                              size: 16,
                              color: Color(0xFF006D42),
                            ),
                            // Widget SizedBox: Berfungsi memberi jarak antara ikon dan teks
                            SizedBox(width: 4),
                            // Widget Text: Berfungsi menampilkan teks tautan Ajukan koreksi absensi
                            Text(
                              'Ajukan koreksi absensi',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF006D42),
                              ),
                            ),
                          ],
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
      // 3. BOTTOM NAVIGATION BAR (5 MENU STAK, TAB ABSENSI AKTIF)
      // ==============================================================
      // Widget NavigationBar: Berfungsi sebagai bar navigasi bawah, tab Absensi aktif (index 2)
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (index) {
          if (index != 2) {
            // Navigator.push: Berfungsi membuka halaman tujuan di atas halaman Absensi
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => switch (index) {
                  0 => const HomePage(),
                  1 => const TugasPage(),
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
