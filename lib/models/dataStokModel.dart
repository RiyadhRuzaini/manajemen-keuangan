import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_cash_id/komponen/utilitis.dart';

class StockModelDataBarang {
  final String lebel;
  final String subLebel;
  final String leading;
  final IconData icon;
  final Color color;

  StockModelDataBarang(
      {required this.lebel,
      required this.subLebel,
      required this.leading,
      required this.icon,
      required this.color});
}

class StokModelBuildWiget {
  static String? lebel;
  static String? subLebel;
  static String? leading;
  static final Stream<QuerySnapshot> data = firestoreDB
      .collection('stok')
      .doc('barang-mk')
      .collection('masuk')
      .snapshots();

  static const List<StockModelDataBarang> listData = [];

  static final items = StockModelDataBarang(
    lebel: lebel!,
    subLebel: subLebel!,
    leading: leading!,
    icon: Icons.keyboard_double_arrow_down_rounded,
    color: valRadioBtn == 'Keluar'
        ? Colors.redAccent
        : Colors.greenAccent.shade400,
  );

  Widget buildWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: data,
      builder: (context, snapshot) {
        return ListTile();
      },
    );
  }
}
