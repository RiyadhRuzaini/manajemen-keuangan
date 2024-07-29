import 'package:flutter/material.dart';
import 'package:note_cash_id/pages/screens/loginPage.dart';
import 'package:note_cash_id/pages/screens/signUpPage.dart';

class LoginSignupController extends StatefulWidget {
  const LoginSignupController({super.key});

  @override
  State<LoginSignupController> createState() => _LoginSignupControllerState();
}

class _LoginSignupControllerState extends State<LoginSignupController> {
  bool currentPage = true;

  void onKlikChange() {
    setState(() {
      currentPage = !currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentPage) {
      return LoginPage(
        onKlik: () => onKlikChange(),
      );
    } else {
      return SignUpPage(
        onKlik: () => onKlikChange(),
      );
    }
  }
}
