import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final ScrollController scrollCtrl = ScrollController();
final TextEditingController emailCtrl = TextEditingController();
final TextEditingController sandiCtrl = TextEditingController();
final TextEditingController konfirSandiCtrl = TextEditingController();
final TextEditingController namaBarangCtrl = TextEditingController();
final TextEditingController jmlBarangCtrl = TextEditingController();
final TextEditingController totalBiayaCtrl = TextEditingController();
TextEditingController waktuCtrl = TextEditingController();

final auth = FirebaseAuth.instance;
final firestoreDB = FirebaseFirestore.instance;

String? kategori;
String? valRadioBtn;
String? waktu;
String? rp = 'Rp.';

DateTime? dateTime;
