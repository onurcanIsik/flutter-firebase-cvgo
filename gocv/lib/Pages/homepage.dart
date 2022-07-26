// ignore_for_file: sort_child_properties_last, unused_field, unused_element

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gocv/Pages/Chats/chats.dart';
import 'package:gocv/Pages/Search/search.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/fe.dart';

import 'mainpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final pages = [
    const SearchPage(),
    const MainPage(),
    const ChatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          backgroundColor: HexColor("#0C6170"),
          currentIndex: selectedIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey,
          // enableFloatingNavBar: false,
          onTap: changePage,
          items: [
            DotNavigationBarItem(
              icon: Iconify(Bx.search, color: HexColor("#DBF5F0")),
            ),

            DotNavigationBarItem(
              icon: Iconify(
                Fe.home,
                color: HexColor("#DBF5F0"),
              ),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Iconify(Bx.message_square_dots, color: HexColor("#DBF5F0")),
            ),
          ],
        ),
      ),
    );
  }
}
