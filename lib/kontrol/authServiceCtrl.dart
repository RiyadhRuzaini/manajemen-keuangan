import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_cash_id/komponen/utilitis.dart';
import 'package:note_cash_id/kontrol/loginSignUpCtrl.dart';
import 'package:note_cash_id/kontrol/navigateCtrl.dart';

class AuthController extends StatefulWidget {
  const AuthController({super.key});

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      // initialData: auth.currentUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NavigationViewController();
        } else {
          return const LoginSignupController();
        }
      },
    );
  }
}
