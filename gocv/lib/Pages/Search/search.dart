import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C6170"),
        title: Text(
          "Arama",
          style: GoogleFonts.josefinSans(fontSize: 23),
        ),
      ),
    );
  }
}
