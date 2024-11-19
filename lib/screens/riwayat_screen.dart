import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: kehadiranProvider.riwayat.length,
        itemBuilder: (context, index) {
          final riwayat = kehadiranProvider.riwayat[index];
          return ListTile(
            title: Text(riwayat.tanggal),
            subtitle: Text(
                'Hadir: ${riwayat.hadir}, Tidak Hadir: ${riwayat.tidakHadir}'),
          );
        },
      ),
    );
  }
}
