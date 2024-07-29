import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/komponen/utilitis.dart';

class TotalBiayaBarang extends StatefulWidget {
  const TotalBiayaBarang({super.key});

  @override
  State<TotalBiayaBarang> createState() => _TotalBiayaBarangState();
}

class _TotalBiayaBarangState extends State<TotalBiayaBarang> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: totalBiayaCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              rp!,
              style: GoogleFonts.poppins(
                  fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade500,
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0),
          labelText: 'Total Harga',
          hintText: 'Harga Barang..',
        ),
      ),
    );
  }
}
