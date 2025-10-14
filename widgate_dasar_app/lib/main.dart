import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Diri App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 8, 190, 240)),
        useMaterial3: true,
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
      backgroundColor: const Color(0xFFF0F8FF), // Warna latar belakang biru muda
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 217, 249, 1),
        foregroundColor: Colors.white,
        title: const Text(
          'Biodata Diri',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header dengan foto profil
            _buildProfileHeader(),
            const SizedBox(height: 24),
            
            // Section informasi pribadi
            _buildInfoSection(),
            const SizedBox(height: 16),
            
            // Section pendidikan
            _buildEducationSection(),
            const SizedBox(height: 16),
            
            // Section kontak
            _buildContactSection(),
            const SizedBox(height: 24),
            
            // Tombol-tombol aksi
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Widget untuk header profil dengan foto
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Widget - Foto profil
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/PROFIL.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.grey,
                  );
                },
                
                
              ),
            ),
          ),
          const SizedBox(height: 14),
          
          // Text Widget - Nama dan profesi
          const Text(
            'REGA ARDIANSAH S.Kom',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'DIREKTUR UTAMA',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk section informasi pribadi
  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row Widget - Judul section dengan icon
          Row(
            children: [
              Icon(Icons.person_outline, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Informasi Pribadi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Column Widget - Daftar informasi
          Column(
            children: [
              _buildInfoRow('Tempat Lahir', 'Kerinci'),
              _buildInfoRow('Tanggal Lahir', '16 juli 2005'),
              _buildInfoRow('Jenis Kelamin', 'Laki-laki'),
              _buildInfoRow('Alamat', 'Jambi city'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk section pendidikan
  Widget _buildEducationSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.school_outlined, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Pendidikan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildEducationItem('SD Negeri 152 Bukit Sari', '2011-2017'),
              _buildEducationItem('SMP Negeri 17 Kab Tebo', '2017-2020'),
              _buildEducationItem('SMA Negeri 4 Kab Tebo', '2020-2023'),
              _buildEducationItem('Universitas GAJAH MADA - Sistem Informasi', '2023-Sekarang'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk section kontak
  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.contact_phone_outlined, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Kontak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildContactItem(Icons.email, 'regaardiansah812@email.com'),
              _buildContactItem(Icons.phone, '+62 83185450688'),
              _buildContactItem(Icons.location_on, 'Jambi, Indonesia'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk baris informasi
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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

  // Widget untuk item pendidikan
  Widget _buildEducationItem(String school, String year) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 12),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  year,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item kontak
  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }

  // Widget untuk tombol aksi
  Widget _buildActionButtons() {
    return Row(
      children: [
        // Button Widget - ElevatedButton
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Aksi ketika tombol diklik
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message, size: 18),
                SizedBox(width: 8),
                Text('Hubungi Saya'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Button Widget - OutlinedButton
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Aksi ketika tombol diklik
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(color: Colors.blue),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, size: 18),
                SizedBox(width: 8),
                Text('Bagikan'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}