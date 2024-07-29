import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:note_cash_id/komponen/utilitis.dart';

class DateTimePickerStokBarang extends StatefulWidget {
  const DateTimePickerStokBarang({super.key});

  @override
  State<DateTimePickerStokBarang> createState() =>
      _DateTimePickerStokBarangState();
}

class _DateTimePickerStokBarangState extends State<DateTimePickerStokBarang> {
  pickDateTime() async {
    dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
      confirmText: 'Pilih',
      barrierColor: Colors.lightBlueAccent,
    ).then((value) async {
      if (value != null && value != dateTime) {
        setState(() {
          dateTime = value;
          // waktuCtrl.text = dateTime;
          waktuCtrl.text = DateFormat.yMMMMEEEEd('id_ID').format(dateTime!);
        });
      }
    });
  }

  @override
  void initState() {
    initializeDateFormatting('id', 'ID');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: waktuCtrl,
        readOnly: true,
        decoration: InputDecoration(
          labelText: 'Waktu',
          hintText: 'Waktu..',
          suffixIcon: const Icon(FontAwesomeIcons.solidCalendar),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade500,
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0),
        ),
        onTap: () => pickDateTime(),
        onChanged: (value) {
          waktuCtrl.text = value;
        },
      ),
    );
  }
}
