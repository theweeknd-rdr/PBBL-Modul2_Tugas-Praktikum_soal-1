import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Budi Santoso'),
            subtitle: Text('NIK 3271•••••••0001\nKelurahan Nusantara Jaya'),
            isThreeLine: true,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Laporan'),
            subtitle: const Text('Lihat laporan yang pernah Anda kirim'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
          ),
        ),
      ],
    );
  }
}
