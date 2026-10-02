import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  static const _laporan = [
    ('Jalan berlubang di Jl. Merdeka', 'Selesai'),
    ('Lampu jalan padam di Jl. Melati', 'Diproses'),
    ('Sampah menumpuk di Pasar Baru', 'Diterima'),
    ('Halte bus rusak di Jl. Sudirman', 'Selesai'),
  ];

  void _info(BuildContext context, String teks) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: ListView(
        children: [
          for (final (judul, status) in _laporan)
            ListTile(
              leading: const Icon(Icons.report_outlined),
              title: Text(judul),
              subtitle: Text('Status: $status'),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buat laporan',
        onPressed: () => _info(context, 'Buat laporan baru'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Filter',
              icon: const Icon(Icons.filter_list),
              onPressed: () => _info(context, 'Filter laporan'),
            ),
            IconButton(
              tooltip: 'Cari',
              icon: const Icon(Icons.search),
              onPressed: () => _info(context, 'Cari laporan'),
            ),
            IconButton(
              tooltip: 'Bagikan',
              icon: const Icon(Icons.share),
              onPressed: () => _info(context, 'Bagikan riwayat'),
            ),
          ],
        ),
      ),
    );
  }
}
