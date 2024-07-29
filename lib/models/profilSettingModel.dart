import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PengaturanProfilModel {
  final String label;
  final IconData icon;

  const PengaturanProfilModel({required this.label, required this.icon});
}

class PengaturanProfilBuilding {
  static const List<PengaturanProfilModel> listItems = [item1, item2, item3];

  static const item1 = PengaturanProfilModel(
    label: 'Pengaturan Akun',
    icon: FontAwesomeIcons.gear,
  );
  static const item2 = PengaturanProfilModel(
    label: 'Riwayat',
    icon: FontAwesomeIcons.history,
  );
  static const item3 = PengaturanProfilModel(
    label: 'Tentang',
    icon: FontAwesomeIcons.circleInfo,
  );

  static Widget buildWidgetProfil(PengaturanProfilModel item) {
    return ClipRRect(
      child: SizedBox(
        child: ListTile(
          title: Text(item.label),
          leading: Icon(item.icon),
          trailing: const Icon(FontAwesomeIcons.circleChevronRight),
        ),
      ),
    );
  }
}
