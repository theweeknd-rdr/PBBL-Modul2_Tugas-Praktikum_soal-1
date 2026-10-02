import 'package:flutter/material.dart';

import 'data_layanan.dart';

class RincianLayananPage extends StatelessWidget {
  const RincianLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data berasal dari arguments pada named route.
    final l = ModalRoute.of(context)!.settings.arguments as Layanan;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Layanan'),
      ), // tombol kembali otomatis
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l.nama, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text('Dinas Penanggung Jawab'),
            subtitle: Text(l.dinas),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Jam Operasional'),
            subtitle: Text(l.jam),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Keterangan'),
            subtitle: Text(l.keterangan),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('Ajukan Permohonan'),
            onPressed: () =>
                Navigator.pop(context, 'Permohonan ${l.nama} telah diajukan'),
          ),
        ],
      ),
    );
  }
}
