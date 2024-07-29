import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_cash_id/komponen/utilitis.dart';
import 'package:note_cash_id/models/stokKeluarMasukModel.dart';
import 'package:note_cash_id/models/stokModel.dart';
import 'package:note_cash_id/pages/screens/riwayat.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Welcome.. Nama',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            // controller: scrollCtrl,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 200.0,
                  width: size.width,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      // fit: StackFit.passthrough,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: size.width,
                          // height: 250.0,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.deepOrange,
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ...ViewStokMasuk.listItems.map(
                                    (e) => SizedBox(
                                      child: ViewStokMasuk.buildStokStatik(e),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 200.0,
                  // width: size.width,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...ViewStok.listItems1.map(
                            (e) => Align(
                              alignment: Alignment.center,
                              // color: Colors.amber,
                              child: SizedBox(
                                width: 180.0,
                                child: Center(
                                  child: ViewStok.buildStokStatik(e),
                                ),
                              ),
                            ),
                          ),
                          const Divider(height: 10.0),
                          ClipRRect(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...ViewStok.listItems2.map(
                                  (e) => ClipRRect(
                                    child: SizedBox(
                                        child: ViewStok.buildStokStatik(e)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                ClipRRect(
                  child: Column(
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              SizedBox(
                                width: size.width,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.only(
                                      left: 10.0, top: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.0,
                                        color: Colors.blueGrey.shade200,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Riwayat Transaksi',
                                        style: GoogleFonts.roboto(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'Lihat semua..',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              backgroundColor: Colors
                                                  .lightBlueAccent.shade200,
                                              letterSpacing: 1.5),
                                        ),
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const RiwayatPage(),
                                          ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ClipRRect(
                        child: SizedBox(
                          height: 120.0,
                          width: size.width,
                          child: Center(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: firestoreDB
                                    .collection('stok')
                                    .doc('barang-mk')
                                    .collection('masuk')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  List dataList = [];
                                  var dt;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.lightBlueAccent.shade100,
                                      ),
                                    );
                                  } else {
                                    final docs = snapshot.data?.docs.cast();
                                    for (var data in docs!) {
                                      dt = data.data();
                                    }
                                  }
                                  return Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemExtent: 360.0,
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return ClipRRect(
                                            child: SizedBox(
                                              height: 70.0,
                                              width: 350.0,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15.0, right: 15.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15.0),
                                                ),
                                                child: Center(
                                                  child: ListTile(
                                                    title: Text('${dt['barang']}'
                                                        .capitalize
                                                        .toString()),
                                                    subtitle:
                                                        Text('${dt['waktu']}'),
                                                    leading: Text(
                                                      '${dt['jumlah']}',
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 30.0,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
