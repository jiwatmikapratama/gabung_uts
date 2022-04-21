// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gabung_uts/main.dart';
import 'package:gabung_uts/pages/daftar_pengelola.dart';
import 'package:gabung_uts/pages/pengaturan.dart';
import 'package:gabung_uts/pages/riwayat.dart';
import 'package:gabung_uts/pages/detail_profil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gabung_uts/src/locations.dart' as locations;

class Beranda_login extends StatefulWidget {
  const Beranda_login({Key? key}) : super(key: key);

  @override
  State<Beranda_login> createState() => _Beranda_loginState();
}

class _Beranda_loginState extends State<Beranda_login> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFF189AB4),
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      // body: Container(
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 11.0,
              ),
              markers: _markers.values.toSet(),
            ),
            Container(
              alignment: Alignment.topCenter,
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Pengaturan())),
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

class DataSearch extends SearchDelegate<String> {
  final pura = ["Besakih", "Tanah Lot", "Uluwatu"];

  final recentPura = ["Besakih", "Tanah Lot"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];

    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentPura
        : pura.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/catur.jpg'),
        ),
        title: Column(
          children: [
            Text(suggestionList[index]),
            Text("Alamat"),
          ],
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
