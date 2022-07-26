import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C6170"),
        title: Text(
          "Ayarlar",
          style: GoogleFonts.josefinSans(fontSize: 23),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 10,
              child: ListTile(
                title: Text(
                  "Çıkış Yap",
                  style: GoogleFonts.comfortaa(),
                ),
                trailing: IconButton(
                  icon: const Iconify(Fluent.arrow_exit_20_filled),
                  onPressed: () {
                    logOut();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut().then((logOut) => prefs
        .remove("email")
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyApp()))));
  }
}
