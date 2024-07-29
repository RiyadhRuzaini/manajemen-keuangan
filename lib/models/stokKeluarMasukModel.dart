import 'package:flutter/material.dart';

class StokMasukModelView {
  final String label;
  final String waktu;
  final IconData aksi;
  final IconData icon;
  final Color? warna;

  const StokMasukModelView(
      {required this.label,
      required this.waktu,
      required this.aksi,
      required this.icon,
      required this.warna});
}

class ViewStokMasuk {
  static final List<StokMasukModelView> listItems = [item1, item2];

  static final item1 = StokMasukModelView(
      warna: Colors.greenAccent[400],
      label: 'Masuk',
      waktu: 'Senin, 03 Juni 2024',
      aksi: Icons.read_more_rounded,
      icon: Icons.keyboard_double_arrow_up_rounded);

  static const item2 = StokMasukModelView(
      warna: Colors.redAccent,
      label: 'Keluar',
      waktu: 'Rabu, 05 Juni 2024',
      aksi: Icons.read_more_rounded,
      icon: Icons.keyboard_double_arrow_down_rounded);

  static Widget buildStokStatik(StokMasukModelView item) => ClipRRect(
        child: SizedBox(
          height: 100.0,
          child: Container(
            alignment: Alignment.center,
            // color: Colors.amber,
            child: ListTile(
              style: ListTileStyle.drawer,
              // minVerticalPadding: 20.0,
              // contentPadding: const EdgeInsets.all(20.0),
              horizontalTitleGap: 20.0,
              titleTextStyle: const TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              subtitleTextStyle: const TextStyle(
                letterSpacing: 1.0,
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
              leading: CircleAvatar(
                backgroundColor: item.warna,
                child: Icon(
                  item.icon,
                  color: Colors.white,
                ),
              ),
              title: Text(item.label),
              subtitle: Text(item.waktu),
              trailing: Icon(item.aksi),
            ),
          ),
        ),
      );
}
