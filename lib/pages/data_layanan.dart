class Layanan {
  final String nama, dinas, jam, keterangan, bidang;
  const Layanan(this.nama, this.dinas, this.jam, this.keterangan, this.bidang);
}

const daftarBidang = ['Perizinan', 'Kesehatan', 'Transportasi'];

const daftarLayanan = [
  Layanan(
    'Izin Usaha',
    'Dinas Penanaman Modal dan PTSP',
    'Senin–Jumat, 08.00–15.00 WIB',
    'Pengurusan NIB dan izin usaha bagi pelaku usaha mikro dan kecil.',
    'Perizinan',
  ),
  Layanan(
    'Persetujuan Bangunan Gedung',
    'Dinas Pekerjaan Umum dan Penataan Ruang',
    'Senin–Jumat, 08.00–15.00 WIB',
    'Persetujuan mendirikan atau mengubah bangunan gedung.',
    'Perizinan',              
  ),
  Layanan(
    'Izin Keramaian',
    'Satuan Polisi Pamong Praja',
    'Senin–Jumat, 08.00–14.00 WIB',
    'Izin penyelenggaraan acara dan kegiatan di ruang publik.',
    'Perizinan',
  ),
  Layanan(
    'Pendaftaran Puskesmas Daring',
    'Dinas Kesehatan',
    'Setiap hari, 06.00–20.00 WIB',
    'Pendaftaran antrean pemeriksaan di puskesmas tanpa datang lebih awal.',
    'Kesehatan',
  ),
  Layanan(
    'Imunisasi Anak',
    'Dinas Kesehatan',
    'Selasa & Kamis, 08.00–12.00 WIB',
    'Jadwal dan pendaftaran imunisasi dasar di posyandu.',
    'Kesehatan',
  ),
  Layanan(
    'Ambulans Gawat Darurat',
    'Dinas Kesehatan',
    'Setiap hari, 24 jam',
    'Layanan jemput pasien gawat darurat di seluruh wilayah kota.',
    'Kesehatan',
  ),
  Layanan(
    'Uji Kendaraan Bermotor',
    'Dinas Perhubungan',
    'Senin–Jumat, 08.00–15.00 WIB',
    'Pendaftaran dan jadwal uji berkala kendaraan angkutan umum.',
    'Transportasi',
  ),
  Layanan(
    'Trayek Bus Kota',
    'Dinas Perhubungan',
    'Setiap hari, 05.00–22.00 WIB',
    'Informasi rute, halte, dan jadwal bus kota.',
    'Transportasi',
  ),
  Layanan(
    'Parkir Berlangganan',
    'UPTD Perparkiran',
    'Senin–Sabtu, 08.00–16.00 WIB',
    'Pendaftaran parkir tepi jalan umum dengan sistem langganan bulanan.',
    'Transportasi',
  ),
];
