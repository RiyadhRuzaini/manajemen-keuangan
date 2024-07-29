import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat',
          style: GoogleFonts.roboto(
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 80.0,
        leading: IconButton(
          onPressed: () {
            // setState(() {
            //   namaBarangCtrl.text = '';
            //   jmlBarangCtrl.text = '';
            //   waktuCtrl.text = '';
            //   totalBiayaCtrl.text = '';
            //   kategori = null;
            //   valRadioBtn = null;
            // });
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            size: 22.0,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
