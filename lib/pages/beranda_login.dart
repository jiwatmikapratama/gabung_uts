// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gabung_uts/main.dart';
import 'package:gabung_uts/pages/daftar_pengelola.dart';
import 'package:gabung_uts/pages/pengaturan.dart';
import 'package:gabung_uts/pages/riwayat.dart';
import 'package:gabung_uts/pages/detail_profil.dart';

class Beranda_login extends StatelessWidget {
  const Beranda_login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xFF00FF85),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                height: 30,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daftar_pengelola()),
                    );
                  },
                  child: Center(
                      child: Text(
                    "Daftar Sebagai Pengelola?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
                ),
              ),
            ),
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "images/fix.png",
          ),
          fit: BoxFit.fill,
        )),
        child: Container(
          height: 100,
          margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 660),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xFF189AB4),
          ),
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.search, color: Colors.white),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10),
                child: Text("Search",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Container(
                child: GestureDetector(
                  child: Text(
                    "Nama Pengguna",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Detail_profil())),
                ),
              ),
              accountEmail: null,
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage('images/catur.jpg')),
              decoration: BoxDecoration(),
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: Text(
                "Riwayat",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Riwayat())),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Pengaturan",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pengaturan())),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login())),
            ),
          ],
        ),
      ),
    );
  }
}
