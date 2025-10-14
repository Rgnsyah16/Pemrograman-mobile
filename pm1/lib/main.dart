import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Biodata Saya'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BIODATA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 15),
                BiodataItem(label: 'Nama', value: 'Rega ardiansah'),
                BiodataItem(label: 'TTL', value: 'Kerinci, 16 Juli 2005'),
                BiodataItem(label: 'Jenis Kelamin', value: 'Laki-laki'),
                BiodataItem(label: 'Alamat', value: 'Jambi city, Simpang Rimbo'),
                BiodataItem(label: 'Email', value: 'boyy77@gmail.com'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BiodataItem extends StatelessWidget {
  final String label;
  final String value;

  const BiodataItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}