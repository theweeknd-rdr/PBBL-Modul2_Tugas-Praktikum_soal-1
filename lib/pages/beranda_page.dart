import 'package:flutter/material.dart';

class _Pilar {
  final String nama, ringkasan;
  final IconData ikon;
  const _Pilar(this.nama, this.ikon, this.ringkasan);
}

const _pilar = [
  _Pilar('Smart Governance', Icons.account_balance, '24 layanan digital'),
  _Pilar('Smart Branding', Icons.campaign, '12 agenda wisata'),
  _Pilar('Smart Economy', Icons.storefront, '1.250 UMKM terdaftar'),
  _Pilar('Smart Living', Icons.health_and_safety, '18 fasilitas kesehatan'),
  _Pilar('Smart Society', Icons.groups, '320 komunitas aktif'),
  _Pilar('Smart Environment', Icons.eco, 'Indeks udara baik'),
];

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Ringkasan Enam Pilar Smart City',
          style: tema.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        GridView.extent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final p in _pilar)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(p.ikon, size: 36, color: tema.colorScheme.primary),
                      const SizedBox(height: 8),
                      Text(
                        p.nama,
                        textAlign: TextAlign.center,
                        style: tema.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(p.ringkasan, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
