import 'package:flutter/material.dart';

class ProfilModel {
  final String? label;
  final IconData icon;
  final String? subtitle;

  const ProfilModel(
      {required this.label, required this.subtitle, required this.icon});
}

class ProfilBuildModel {
  static const List<ProfilModel> listItem = [item1, item2, item3];

  static const item1 = ProfilModel(
      label: 'Pengaturan',
      subtitle: 'Nama, Email dan Kata Sandi',
      icon: Icons.settings_rounded);
  static const item2 = ProfilModel(
      label: 'Pengaturan',
      subtitle: 'Nama, Email dan Kata Sandi',
      icon: Icons.settings_rounded);
  static const item3 = ProfilModel(
      label: 'Pengaturan',
      subtitle: 'Nama, Email dan Kata Sandi',
      icon: Icons.settings_rounded);

  static Widget buildAkunSetting(ProfilModel item) => SafeArea(
        child: SizedBox(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(
                  item.icon,
                  size: 40,
                  color: Colors.blueGrey.shade400,
                ),
                title: SizedBox(
                  child: Text(item.label!),
                ),
                subtitle: SizedBox(
                  child: Text(item.subtitle!),
                ),
              );
            },
          ),
        ),
      );
}
