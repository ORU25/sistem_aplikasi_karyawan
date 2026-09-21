import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Widget MaterialApp: membungkus seluruh aplikasi dan mengatur tema dasar
    return MaterialApp(
      title: 'STAK - Sisstem Aplikasi Karyawan',
      // Widget ThemeData: mengatur warna dan gaya keseluruhan aplikasi
      theme: ThemeData(
        useMaterial3: true,
        // Widget ColorScheme: mengatur palet warna
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A7C59), // Warna acuan dasar
          primary: const Color(0xFF4A7C59), // Warna primary kustom
          secondary: const Color(0xFF8FA89B), // Warna secondary kustom
          surface: const Color(0xFFF7F9F8), // Warna buat latar
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Widget Scaffold: menyediakan struktur tata letak dasar halaman
    return Scaffold(
      backgroundColor: Colors.white,

      // Widget Appbar: Bar navigasi paling atas pada layar
      appBar: AppBar(
        backgroundColor: colors.secondary,
        elevation: 0,
        titleSpacing: 16,
        // Widget Row: menyusun child didalamnya secara horizontal
        title: Row(
          children: [
            // 1. Logo Sementara
            // Widget Container: membungkus widget lain untuk memberikan dekorasi (warna, border)
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              // Widget Icon: untuk menampilkan ikon bawaan Flutter
              child: Icon(Icons.api_outlined, color: Colors.white, size: 26),
            ),

            // Widget SizedBox: untuk memberi jarak ruang kosong antar widget
            SizedBox(width: 12),

            // 2. Nama Aplikasi
            // Widget Column: menyusun child didalamnya secara vertikal (atas ke bawah)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget Text: untuk menampilkan teks di layar
                Text(
                  'STAK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),

                SizedBox(height: 2),

                // Nama Perusahaan
                Text(
                  'PT Sejahtera Selalu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Widget SafeArea: Memastikan tampilan konten tidak tertutup notch atau ujung layar HP
      body: SafeArea(
        // Widget SingleChildScrollView: membuat area konten di dalamnya dapat digulir (di-scroll)
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          // Widget Column: menyusun konten dari atas ke bawah
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Bagian Awal (Greeting & Info)
              // Row untuk menyusun sapaan dan foto profil secara sejajar (kiri-kanan)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selamat pagi, Haykal!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'Product Designer • Divisi Produk & Desain',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              SizedBox(height: 12),

              // Widget Container: digunakan sebagai wadah "chip" informasi tanggal
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: colors.primary),
                    const SizedBox(width: 6),
                    Text(
                      'Rabu, 08 September 2026',
                      style: TextStyle(fontSize: 12, color: colors.primary),
                    ),
                    // Widget Padding: memberi jarak khusus di sekeliling child-nya
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('•', style: TextStyle(color: Colors.grey)),
                    ),
                    Icon(Icons.location_on, size: 16, color: colors.primary),
                    SizedBox(width: 6),
                    Text(
                      'Kantor Sudirman',
                      style: TextStyle(fontSize: 12, color: colors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Bagian Kartu Absensi Utama (Attendance Card)
              // Wadah utama kartu menggunakan Container dengan bayangan (box-shadow)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Baris atas kartu absensi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'WFO • JAM KERJA AKTIF',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Detail Shift >',
                          style: TextStyle(
                            color: colors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Bagian info jam
                    Row(
                      children: [
                        // Widget Expanded: Memaksa widget di dalamnya memenuhi ruang tersisa
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.login,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Jam Masuk',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '08:15 WIB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Tepat',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Jam Keluar',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '17:00 WIB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Estimasi',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Tombol Aksi: Presensi
                    SizedBox(
                      width: double.infinity,
                      // Widget ElevatedButton: Membuat tombol
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.fingerprint, color: Colors.white),
                        label: Text(
                          'Presensi Pulang (Check-Out)',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Baris bawah kartu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.edit_location_alt,
                              size: 16,
                              color: colors.primary,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Ajukan Pindah Lokasi / WFH',
                              style: TextStyle(
                                color: colors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.my_location,
                              size: 16,
                              color: Colors.green[600],
                            ),
                            SizedBox(width: 4),
                            Text(
                              'GPS Akurat',
                              style: TextStyle(
                                color: Colors.green[600],
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // 3. Bagian Fitur Cepat (Menu Grid)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fitur Cepat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pintasan Layanan',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Widget Column: membungkus baris-baris menu
              Column(
                children: [
                  // Baris Pertama Menu
                  Row(
                    children: [
                      // Menu 1: Izin & Cuti
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.orange.withOpacity(
                                      0.1,
                                    ),
                                    radius: 18,
                                    child: Icon(
                                      Icons.event_note,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '8 Hari',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Izin & Cuti',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Sisa cuti tahunan',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),

                      // Menu 2: Slip Gaji
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue.withOpacity(
                                      0.1,
                                    ),
                                    radius: 18,
                                    child: Icon(
                                      Icons.receipt_long,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'April',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Slip Gaji',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Bulan terakhir',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Baris Kedua Menu
                  Row(
                    children: [
                      // Menu 3: Reimburse
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.purple.withOpacity(
                                      0.1,
                                    ),
                                    radius: 18,
                                    child: Icon(
                                      Icons.monetization_on,
                                      color: Colors.purple,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Pending',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Reimburse',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Pengajuan dana',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),

                      // Menu 4: KPI
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.teal.withOpacity(
                                      0.1,
                                    ),
                                    radius: 18,
                                    child: Icon(
                                      Icons.assignment,
                                      color: Colors.teal,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '98%',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'KPI Saya',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Performa Q1',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Widget NavigationBar: Bar navigasi di bagian bawah layar untuk pindah halaman
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: 0,
        destinations: const [
          // Widget NavigationDestination: Mewakili setiap item/tab di NavigationBar
          NavigationDestination(icon: Icon(Icons.home), label: "Beranda"),
          NavigationDestination(
            icon: Icon(Icons.fingerprint),
            label: "Absensi",
          ),
          NavigationDestination(icon: Icon(Icons.task), label: "Tugas"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
