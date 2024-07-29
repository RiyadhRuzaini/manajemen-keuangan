import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/models/signUpModel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.onKlik});
  final Function()? onKlik;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: SizedBox.expand(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      child: SizedBox(
                        child: Text(
                          'Silahkan Daftar..',
                          style: GoogleFonts.roboto(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    ClipRRect(
                      child: Container(
                        height: 350.0,
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...SignUpModels.listInputText.map(
                                (e) => ClipRRect(
                                  child: SizedBox(
                                    child: SignUpModels.buildSignUpInput(e),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ClipRRect(
                                child: MaterialButton(
                                  color: Colors.lightBlueAccent.shade700,
                                  minWidth: 150.0,
                                  height: 45.0,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blueGrey.shade400),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    'Daftar',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.0),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ClipRRect(
                              child: Text('Sudah punya akun?'),
                            ),
                            GestureDetector(
                              onTap: widget.onKlik,
                              child: Text(
                                ' Masuk',
                                style: GoogleFonts.roboto(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
