// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gabung_uts/pages/beranda_login.dart';
import 'package:gabung_uts/pages/pengaturan_bahasa.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF05445E),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          // leading: IconButton(icon: Icon(Icons.arrow_back),
          title: Center(
            child: Text(
              "Pengaturan",
              style: TextStyle(color: Colors.white),
            ),
          )),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (Context) {
                return PengaturanBahasa();
              }));
            },
            child: Container(
              height: 100,
              width: 600,
              //color: Colors.black,
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Pilih Bahasa",
                style: TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
