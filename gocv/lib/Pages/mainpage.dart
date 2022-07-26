// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gocv/Pages/Profile/mainprofile.dart';
import 'package:gocv/Pages/Profile/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainProfile()),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              }
            },
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            icon: Iconify(
              Gg.profile,
              color: HexColor("#DBF5F0"),
              size: 25,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Profil",
                  style: GoogleFonts.comfortaa(),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(
                  "Ayarlar",
                  style: GoogleFonts.comfortaa(),
                ),
                value: 2,
              ),
            ],
          ),
        ],
        backgroundColor: HexColor("#0C6170"),
        title: Text(
          "Cvgo",
          style: GoogleFonts.josefinSans(fontSize: 23),
        ),
      ),
    );
  }
}
