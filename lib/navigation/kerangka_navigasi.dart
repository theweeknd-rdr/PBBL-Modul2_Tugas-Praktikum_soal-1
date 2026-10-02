import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import 'app_routes.dart';

class _Tujuan {
  final String label;
  final IconData ikon, ikonAktif;
  const _Tujuan(this.label, this.ikon, this.ikonAktif);
}

class _Menu {
  final String label, route;
  final IconData ikon;
  const _Menu(this.label, this.ikon, this.route);
}

const _tujuan = [
  _Tujuan('Beranda', Icons.home_outlined, Icons.home),
  _Tujuan(
    'Layanan',
    Icons.miscellaneous_services_outlined,
    Icons.miscellaneous_services,
  ),
  _Tujuan('Warga', Icons.person_outline, Icons.person),
];

const _menuPendukung = [
  _Menu('Pengaturan Kota', Icons.settings_outlined, AppRoutes.pengaturanKota),
  _Menu('Tentang Aplikasi', Icons.info_outline, AppRoutes.tentangAplikasi),
  _Menu('Keluar', Icons.logout, AppRoutes.keluar),
];

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeks = 0; // indeks tujuan aktif

  static const _halaman = [BerandaPage(), LayananPage(), WargaPage()];

  // Berpindah tujuan hanya mengganti isi layar, tidak menambah tumpukan route.
  void _pilih(int i) => setState(() => _indeks = i);

  @override
  Widget build(BuildContext context) {
    // Tombol kembali dari Layanan/Warga kembali ke Beranda, bukan menutup aplikasi.
    return PopScope(
      canPop: _indeks == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _pilih(0);
      },
      child: LayoutBuilder(
        builder: (context, batas) {
          final lebar = batas.maxWidth >= 600; // ambang 600 piksel logis
          return Scaffold(
            appBar: AppBar(title: Text(_tujuan[_indeks].label)),
            drawer: _buatDrawer(),
            body: Row(
              children: [
                if (lebar) ...[
                  NavigationRail(
                    selectedIndex: _indeks,
                    onDestinationSelected: _pilih,
                    labelType: NavigationRailLabelType.all,
                    destinations: [
                      for (final t in _tujuan)
                        NavigationRailDestination(
                          icon: Icon(t.ikon),
                          selectedIcon: Icon(t.ikonAktif),
                          label: Text(t.label),
                        ),
                    ],
                  ),
                  const VerticalDivider(width: 1),
                ],
                Expanded(
                  child: IndexedStack(index: _indeks, children: _halaman),
                ),
              ],
            ),
            bottomNavigationBar: lebar
                ? null
                : NavigationBar(
                    selectedIndex: _indeks,
                    onDestinationSelected: _pilih,
                    destinations: [
                      for (final t in _tujuan)
                        NavigationDestination(
                          icon: Icon(t.ikon),
                          selectedIcon: Icon(t.ikonAktif),
                          label: t.label,
                        ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeks,
      onDestinationSelected: (i) {
        Navigator.pop(context); // tutup drawer terlebih dahulu
        if (i < _tujuan.length) {
          _pilih(i);
        } else {
          Navigator.pushNamed(
            context,
            _menuPendukung[i - _tujuan.length].route,
          );
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 20, 16, 10),
          child: Text(
            'Nusantara Cerdas',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        for (final t in _tujuan)
          NavigationDrawerDestination(
            icon: Icon(t.ikon),
            selectedIcon: Icon(t.ikonAktif),
            label: Text(t.label),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Divider(),
        ),
        for (final m in _menuPendukung)
          NavigationDrawerDestination(icon: Icon(m.ikon), label: Text(m.label)),
      ],
    );
  }
}
