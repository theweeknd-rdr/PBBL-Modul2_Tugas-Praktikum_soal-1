import 'package:flutter/material.dart';

class PengaturanKotaPage extends StatelessWidget {
  const PengaturanKotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Kota'),
            subtitle: Text('Nusantara'),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            subtitle: Text('Indonesia'),
          ),
          const SizedBox(height: 16),
          // Tombol uji: memanggil nama route yang tidak terdaftar.
          OutlinedButton.icon(
            icon: const Icon(Icons.bug_report_outlined),
            label: const Text('Uji Route Tidak Dikenal'),
            onPressed: () => Navigator.pushNamed(context, '/rute-salah-tulis'),
          ),
        ],
      ),
    );
  }
}

