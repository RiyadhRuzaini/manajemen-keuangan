import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/komponen/utilitis.dart';

class SignUpDataModel {
  final String lebel;
  final String subLebel;
  final TextEditingController ctrl;
  final IconData leadingIcon;

  const SignUpDataModel(
      {required this.lebel,
      required this.subLebel,
      required this.ctrl,
      required this.leadingIcon});
}

class SignUpModels {
  static final List<SignUpDataModel> listInputText = [input1, input2, input3];

  static final input1 = SignUpDataModel(
      lebel: 'Email',
      subLebel: 'Ketik email..',
      ctrl: emailCtrl,
      leadingIcon: FontAwesomeIcons.solidEnvelope);

  static final input2 = SignUpDataModel(
      lebel: 'Kata Sandi',
      subLebel: 'Ketik kata sandi..',
      ctrl: sandiCtrl,
      leadingIcon: FontAwesomeIcons.lock);

  static final input3 = SignUpDataModel(
      lebel: 'Komfirmasi Kata Sandi',
      subLebel: 'Komfirmasi..',
      ctrl: konfirSandiCtrl,
      leadingIcon: FontAwesomeIcons.lock);

  @override
  static Widget buildSignUpInput(SignUpDataModel item) => ClipRRect(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: SizedBox(
            child: TextFormField(
              controller: item.ctrl,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                labelText: item.lebel,
                hintText: item.subLebel,
                labelStyle: GoogleFonts.roboto(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(item.leadingIcon),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
        ),
      );
}
