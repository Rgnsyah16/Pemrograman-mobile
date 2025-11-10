import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetDasarApp());
}

class WidgetDasarApp extends StatelessWidget {
  const WidgetDasarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Dasar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Warna latar belakang
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Diri'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Foto Profil
            _buildProfileSection(),
            const SizedBox(height: 24.0),
            
            // Bagian Informasi Biodata
            _buildBioSection(),
            const SizedBox(height: 24.0),
            
            // Bagian Kontak
            _buildContactSection(),
            const SizedBox(height: 24.0),
            
            // Tombol Aksi
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Widget untuk bagian foto profil
  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image widget - menggunakan asset image
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueAccent, width: 3.0),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/PROFIL.jpg', // Ganti dengan path foto Anda
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 60, color: Colors.grey);
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Nama Lengkap Anda',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Mahasiswa / Developer',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk bagian informasi biodata
  Widget _buildBioSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12.0),
          _buildInfoRow('Tempat Lahir', 'Kota Anda'),
          _buildInfoRow('Tanggal Lahir', '01 Januari 2000'),
          _buildInfoRow('Alamat', 'Jl. Contoh Alamat No. 123'),
          _buildInfoRow('Pendidikan', 'Universitas Contoh'),
          _buildInfoRow('Jurusan', 'Teknik Informatika'),
        ],
      ),
    );
  }

  // Widget untuk baris informasi
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk bagian kontak
  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kontak',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12.0),
          _buildContactItem(Icons.email, 'email@contoh.com'),
          _buildContactItem(Icons.phone, '+62 812-3456-7890'),
          _buildContactItem(Icons.location_on, 'Kota Anda, Indonesia'),
        ],
      ),
    );
  }

  // Widget untuk item kontak
  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 20.0),
          const SizedBox(width: 12.0),
          Text(text),
        ],
      ),
    );
  }

  // Widget untuk tombol aksi
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Aksi untuk tombol Hubungi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message, size: 18.0),
                SizedBox(width: 8.0),
                Text('Hubungi'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Aksi untuk tombol Bagikan
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              side: const BorderSide(color: Colors.blueAccent),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, size: 18.0),
                SizedBox(width: 8.0),
                Text('Bagikan'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}