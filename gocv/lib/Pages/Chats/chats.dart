import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C6170"),
        title: Text(
          "Sohbet",
          style: GoogleFonts.josefinSans(fontSize: 23),
        ),
      ),
    );
  }
}
