import 'package:flutter/material.dart';
import '../models/siswa.dart';
import '../models/riwayat.dart';

class KehadiranProvider with ChangeNotifier {
  List<Siswa> _siswa = [
    Siswa(nama: 'Ali'),
    Siswa(nama: 'Budi'),
    Siswa(nama: 'Citra'),
  ];

  List<Riwayat> _riwayat = [];

  List<Siswa> get siswa => _siswa;
  List<Riwayat> get riwayat => _riwayat;

  void toggleKehadiran(int index) {
    _siswa[index].hadir = !_siswa[index].hadir;
    notifyListeners();
  }

  void simpanKehadiran() {
    int jumlahHadir = _siswa.where((s) => s.hadir).length;
    int jumlahTidakHadir = _siswa.length - jumlahHadir;
    _riwayat.add(Riwayat(
      tanggal: DateTime.now().toString(),
      hadir: jumlahHadir,
      tidakHadir: jumlahTidakHadir,
    ));
    _siswa.forEach((s) => s.hadir = false); // Reset kehadiran
    notifyListeners();
  }
}
