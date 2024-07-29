import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_cash_id/service/authService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onKlik});

  final Function()? onKlik;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static AuthService authServe = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: Text(
                      'Silahkan Masuk',
                      style: GoogleFonts.roboto(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ClipRRect(
                    child: Container(
                      height: 250,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: MaterialButton(
                              minWidth: 250.0,
                              height: 60.0,
                              color: Colors.lightBlueAccent.shade700,
                              textColor: Colors.white,
                              textTheme: ButtonTextTheme.accent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  width: 4.0,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const ClipRRect(
                                    child: SizedBox(
                                      child: Icon(FontAwesomeIcons.google),
                                    ),
                                  ),
                                  ClipRRect(
                                    child: SizedBox(
                                      child: Text(
                                        'Google',
                                        style: GoogleFonts.roboto(
                                          letterSpacing: 1.0,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                    child: Text(' '),
                                  )
                                ],
                              ),
                              // leading: Icon(Icons.abc_rounded),
                              onPressed: () => authServe.googleAuth(),
                            ),
                          ),
                          ClipRRect(
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 20.0,
                              child: Flex(
                                direction: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150.0,
                                    height: 10.0,
                                    child: Divider(
                                      height: 4.0,
                                      indent: 10.0,
                                      color: Colors.blueGrey.shade700,
                                      endIndent: 10.0,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      'atau',
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.0,
                                    height: 10.0,
                                    child: Divider(
                                      height: 4.0,
                                      indent: 10.0,
                                      color: Colors.blueGrey.shade700,
                                      endIndent: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: SizedBox(
                              child: MaterialButton(
                                minWidth: 250.0,
                                height: 60.0,
                                color: Colors.transparent,
                                textColor: Colors.white,
                                textTheme: ButtonTextTheme.accent,
                                elevation: 0.1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    width: 4.0,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const ClipRRect(
                                      child: SizedBox(
                                        child: Icon(FontAwesomeIcons.phone),
                                      ),
                                    ),
                                    ClipRRect(
                                      child: SizedBox(
                                        child: Text(
                                          'Nomor Telepon',
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 1.0,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                      child: Text(' '),
                                    )
                                  ],
                                ),
                                // leading: Icon(Icons.abc_rounded),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ClipRRect(
                            child: Text('Belum punya akun?'),
                          ),
                          GestureDetector(
                            onTap: widget.onKlik,
                            child: Text(
                              ' Daftar',
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
    );
  }
}
