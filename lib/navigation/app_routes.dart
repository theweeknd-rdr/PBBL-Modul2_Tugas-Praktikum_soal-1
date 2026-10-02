import 'package:flutter/material.dart';

import '../pages/data_layanan.dart';
import '../pages/keluar_page.dart';
import '../pages/pengaturan_kota_page.dart';
import '../pages/rincian_layanan_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import '../pages/tentang_aplikasi_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  AppRoutes._();

  static const String beranda = '/';
  static const String rincianLayanan = '/layanan/rincian';
  static const String riwayatLaporan = '/warga/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';
  static const String keluar = '/keluar';

  /// Untuk properti `routes` pada MaterialApp.
  static Map<String, WidgetBuilder> daftarRoute() => {
    beranda: (_) => const KerangkaNavigasi(),
    riwayatLaporan: (_) => const RiwayatLaporanPage(),
    pengaturanKota: (_) => const PengaturanKotaPage(),
    tentangAplikasi: (_) => const TentangAplikasiPage(),
    keluar: (_) => const KeluarPage(),
  };

  /// Untuk `onGenerateRoute`: route yang membawa arguments.
  /// Mengembalikan null agar diteruskan ke onUnknownRoute.
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == rincianLayanan && settings.arguments is Layanan) {
      return MaterialPageRoute<String>(
        settings: settings,
        builder: (_) => const RincianLayananPage(),
      );
    }
    return null;
  }

  /// Untuk `onUnknownRoute`: nama route salah tulis tidak membuat aplikasi berhenti.
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => RouteTidakDikenalPage(nama: settings.name),
    );
  }
}
