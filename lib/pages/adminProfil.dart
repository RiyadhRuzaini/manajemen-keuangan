import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/komponen/utilitis.dart';
import 'package:note_cash_id/models/profilSettingModel.dart';

class ProfilAdminPage extends StatefulWidget {
  const ProfilAdminPage({super.key});

  @override
  State<ProfilAdminPage> createState() => _ProfilAdminPageState();
}

class _ProfilAdminPageState extends State<ProfilAdminPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil'.toUpperCase().toString(),
          style: GoogleFonts.roboto(
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        toolbarHeight: 60.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        primary: true,
        actions: [
          ClipRRect(
            child: IconButton(
              onPressed: () {
                setState(() {
                  auth.signOut();
                });
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  FontAwesomeIcons.signOut,
                  color: Colors.white,
                  size: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            controller: scrollCtrl,
            child: Column(
              children: [
                ClipRRect(
                  child: Container(
                    height: 250.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade100,
                      // image: const DecorationImage(
                      //   image: AssetImage('assets/img/img2.jpg'),
                      //   fit: BoxFit.fill,
                      //   // invertColors: true,
                      //   colorFilter: ColorFilter.mode(
                      //     Colors.black,
                      //     BlendMode.plus,
                      //   ),
                      //   matchTextDirection: true,
                      // ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: SizedBox(
                            height: 120.0,
                            width: 120.0,
                            child: CircleAvatar(
                              radius: 120.0,
                              child: Icon(
                                FontAwesomeIcons.solidCircleUser,
                                size: 115.0,
                                color: Colors.blueGrey.shade400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ClipRRect(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: SizedBox(
                                  child: Text(
                                    'Nama User',
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                      backgroundColor: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox(
                                  child: Text(
                                    'Nama User',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      backgroundColor: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  child: Container(
                    width: size.width,
                    height: 250,
                    margin: const EdgeInsets.only(
                        top: 20.0, left: 10.0, bottom: 20.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...PengaturanProfilBuilding.listItems.map(
                          (e) => ClipRRect(
                            child: SizedBox(
                              child:
                                  PengaturanProfilBuilding.buildWidgetProfil(e),
                            ),
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
    );
  }
}
