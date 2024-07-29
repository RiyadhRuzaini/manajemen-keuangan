import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_cash_id/kontrol/authServiceCtrl.dart';
import 'package:note_cash_id/kontrol/loginSignUpCtrl.dart';
import 'package:note_cash_id/pages/beranda.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_cash_id/pages/screens/loginPage.dart';
import 'package:note_cash_id/pages/screens/signUpPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        scaffoldBackgroundColor: Colors.lightBlueAccent.shade700,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthController(),
      // home: const BerandaPage(),
    );
  }
}
