import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:note_cash_id/komponen/utilitis.dart';

class SaveDataStokBarang extends GetxController {
  static SaveDataStokBarang get permanin => Get.find();

  String getId(int math) {
    final random = Random();
    var char = '1234567890';

    final randomStrg =
        List.generate(math, (index) => char[random.nextInt(char.length)])
            .join();
    return randomStrg;
  }

  void saveDataStok(BuildContext context) async {
    try {
      String id = await getId(10);
      num indek;
      switch (valRadioBtn) {
        case 'Masuk':
          await firestoreDB
              .collection('stok')
              .doc('barang-mk')
              .collection('masuk')
              .add({
            'id': id,
            'barang': namaBarangCtrl.text,
            'jumlah': jmlBarangCtrl.text,
            'kategori': kategori,
            'jenis': valRadioBtn,
            'waktu': waktuCtrl.text,
            'total harga': totalBiayaCtrl.text,
            'time': FieldValue.serverTimestamp(),
          });
          break;
        case 'Keluar':
          await firestoreDB
              .collection('stok')
              .doc('barang-mk')
              .collection('keluar')
              .add({
            'id': id,
            'barang': namaBarangCtrl.text,
            'jumlah': jmlBarangCtrl.text,
            'kategori': kategori,
            'jenis': valRadioBtn,
            'waktu': waktuCtrl.text,
            'total harga': totalBiayaCtrl.text,
            'time': FieldValue.serverTimestamp(),
          });
          break;
        default:
      }
    } catch (e) {
      errorSms('ada kesalahan peyimpana', e.hashCode.toString(), context);
    }
  }

  errorSms(String str, errors, BuildContext context) async {
    final snackbar = await SnackBar(
      content: Card(
        child: ListTile(
          title: Text(str),
          leading: const Icon(
            FontAwesomeIcons.warning,
            size: 25.0,
          ),
          subtitle: Text(errors),
        ),
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
