import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import 'data_layanan.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: daftarBidang.length,
      child: Column(
        children: [
          TabBar(tabs: [for (final b in daftarBidang) Tab(text: b)]),
          Expanded(
            child: TabBarView(
              children: [
                for (final b in daftarBidang) _DaftarLayanan(bidang: b),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DaftarLayanan extends StatelessWidget {
  final String bidang;
  const _DaftarLayanan({required this.bidang});

  @override
  Widget build(BuildContext context) {
    final items = daftarLayanan.where((l) => l.bidang == bidang).toList();
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final l = items[i];
        return ListTile(
          leading: const Icon(Icons.description_outlined),
          title: Text(l.nama),
          subtitle: Text(l.dinas),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            // Menunggu nilai balik dari halaman rincian (Navigator.pop).
            final pesan = await Navigator.pushNamed<String>(
              context,
              AppRoutes.rincianLayanan,
              arguments: l,
            );
            if (pesan != null && context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(pesan)));
            }
          },
        );
      },
    );
  }
}
