import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StokModelView {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color? warna;
  final double? fontSize;

  const StokModelView({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.warna,
    required this.fontSize,
  });
}

class ViewStok {
  static final List<StokModelView> listItems1 = [item1];
  static final List<StokModelView> listItems2 = [item2, item3];

  static const item1 = StokModelView(
      warna: Colors.lightBlue,
      fontSize: 35.0,
      label: '434',
      subtitle: 'Tersedia',
      icon: Icons.archive_sharp);
  static final item2 = StokModelView(
      warna: Colors.greenAccent[400],
      fontSize: 22.0,
      label: '334',
      subtitle: 'Masuk',
      icon: Icons.keyboard_double_arrow_up_rounded);

  static const item3 = StokModelView(
      warna: Colors.redAccent,
      fontSize: 22.0,
      label: '234',
      subtitle: 'Keluar',
      icon: Icons.keyboard_double_arrow_down_rounded);

  static Widget buildStokStatik(StokModelView item) => ClipRRect(
        child: SizedBox(
          // height: 40.0,
          // width: 20,
          child: Container(
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundColor: item.warna,
                        radius: item.fontSize,
                        child: Icon(
                          item.icon,
                          size: item.fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ClipRRect(
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Text(
                                item.label,
                                style: TextStyle(
                                  fontSize: item.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                item.subtitle,
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
