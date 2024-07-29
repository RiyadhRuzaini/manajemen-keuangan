import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/komponen/formBiaya.dart';
import 'package:note_cash_id/komponen/utilitis.dart';
import 'package:note_cash_id/komponen/waktu.dart';
import 'package:note_cash_id/service/saveDataService.dart';

class FromInputDataBarang extends StatefulWidget {
  const FromInputDataBarang({super.key});

  @override
  State<FromInputDataBarang> createState() => _FromInputDataBarangState();
}

class _FromInputDataBarangState extends State<FromInputDataBarang> {
  // final Stream<QuerySnapshot> db =
  //     firestoreDB.collection('kategori').snapshots();

  static final save = Get.put(SaveDataStokBarang());
  bool? pullPop = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catat Barang',
          style: GoogleFonts.roboto(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              namaBarangCtrl.text = '';
              jmlBarangCtrl.text = '';
              waktuCtrl.text = '';
              totalBiayaCtrl.text = '';
              kategori = null;
              valRadioBtn = null;
            });
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            size: 22.0,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: true,
        toolbarHeight: 80.0,
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueGrey.shade300),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      const SizedBox(height: 15.0),
                      SizedBox(
                        // height: 90.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15.0),
                          child: StreamBuilder<QuerySnapshot>(
                              stream: firestoreDB
                                  .collection('kategori')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<DropdownMenuItem> listMenus = [];
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('salah data nih'),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: Text('salah data nihkan'),
                                  );
                                } else {
                                  final docs = snapshot.data?.docs.toList();
                                  for (var item in docs!) {
                                    listMenus.add(
                                      DropdownMenuItem(
                                        value: item.get('k'),
                                        child: Text(item['k'].toString()),
                                      ),
                                    );
                                  }
                                }
                                return DropdownButtonFormField(
                                  isExpanded: true,
                                  // alignment: AlignmentDirectional.bottomCenter,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueGrey.shade500),
                                    ),
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  hint: const Text('Kategori..'),
                                  items: listMenus,
                                  value: kategori,
                                  onChanged: (value) {
                                    setState(() {
                                      kategori = value;
                                    });
                                  },
                                );
                              }),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ClipRRect(
                        child: SizedBox(
                          // height: 90.0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: namaBarangCtrl,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey.shade500,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15.0),
                                labelText: 'Barang',
                                hintText: 'ketik barang semua barang..',
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 10.0),
                      ClipRRect(
                        child: SizedBox(
                          // height: 90.0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: jmlBarangCtrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey.shade500,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15.0),
                                labelText: 'Jumlah',
                                hintText: 'ketik jumlah..',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ClipRRect(
                        child: SizedBox(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RadioMenuButton(
                                  value: 'Masuk',
                                  groupValue: valRadioBtn,
                                  child: const Text('Barang Masuk'),
                                  onChanged: (value) {
                                    setState(() {
                                      valRadioBtn = value;
                                    });
                                    print(value);
                                  },
                                ),
                                RadioMenuButton(
                                  value: 'Keluar',
                                  groupValue: valRadioBtn,
                                  child: const Text('Barang Keluar'),
                                  onChanged: (value) {
                                    setState(() {
                                      valRadioBtn = value;
                                      print(value);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DateTimePickerStokBarang(),
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: TotalBiayaBarang(),
                      ),

                      const SizedBox(height: 50.0),
                      ClipRRect(
                        child: SizedBox(
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                elevation: 0.0,
                                color: Color.fromRGBO(244, 67, 54, 0.65),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.0,
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                textColor: Colors.white,
                                child: Text('Reset'),
                                onPressed: () {
                                  setState(() {
                                    namaBarangCtrl.text = '';
                                    jmlBarangCtrl.text = '';
                                    waktuCtrl.text = '';
                                    totalBiayaCtrl.text = '';
                                    kategori = null;
                                    valRadioBtn = null;
                                  });
                                },
                              ),
                              MaterialButton(
                                color: Colors.lightBlue.shade600,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                textColor: Colors.white,
                                child: Text('Simpan'),
                                onPressed: () async {
                                  save.saveDataStok(context);
                                  namaBarangCtrl.text = await '';
                                  jmlBarangCtrl.text = await '';
                                  waktuCtrl.text = await '';
                                  totalBiayaCtrl.text = await '';
                                  kategori = await null;
                                  valRadioBtn = await null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
