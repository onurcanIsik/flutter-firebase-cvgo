// ignore_for_file: file_names, unnecessary_null_comparison, use_build_context_synchronously, body_might_complete_normally_nullable

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gocv/Pages/homepage.dart';
import 'package:gocv/Pages/kayitOl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String sifre = "";

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      body: Form(
        key: globalKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                "Cvgo",
                style: GoogleFonts.josefinSans(
                  fontSize: 40,
                  color: HexColor("#0C6170"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 2),
              Text(
                "Giriş Yap",
                style: GoogleFonts.comfortaa(
                    color: HexColor("#0C6170"),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (alinanEmail) {
                    setState(() {
                      email = alinanEmail;
                    });
                  },
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Boş bırakılamaz";
                    }
                  },
                  style: GoogleFonts.comfortaa(),
                  cursorColor: HexColor("#0C6170"),
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
                    labelText: "E-mail",
                    labelStyle: GoogleFonts.comfortaa(
                      color: HexColor("#0C6170"),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: HexColor("#0C6170"),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: HexColor("#0C6170"),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (alinanSifre) {
                    setState(() {
                      sifre = alinanSifre;
                    });
                  },
                  validator: (sifre) {
                    if (sifre!.isEmpty) {
                      return "Boş bırakılamaz";
                    }
                  },
                  obscureText: true,
                  maxLength: 10,
                  style: GoogleFonts.comfortaa(),
                  cursorColor: HexColor("#0C6170"),
                  decoration: InputDecoration(
                    hintText: "1234Abted.",
                    labelText: "Şifre",
                    labelStyle: GoogleFonts.comfortaa(
                      color: HexColor("#0C6170"),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: HexColor("#0C6170"),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: HexColor("#0C6170"),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#37BEB0"),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 40,
                width: 120,
                child: Center(
                  child: TextButton(
                    child: Text(
                      "Giriş Yap",
                      style: GoogleFonts.comfortaa(
                        color: HexColor("#DBF5F0"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      girisYap();
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: Divider(
                        color: HexColor("#0C6170"),
                        height: 3,
                        thickness: 3,
                        indent: 3,
                        endIndent: 3,
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Kayıt Ol",
                      style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.bold,
                        color: HexColor("#0C6170"),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registerpage()));
                    },
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: Divider(
                        color: HexColor("#0C6170"),
                        height: 3,
                        thickness: 3,
                        indent: 3,
                        endIndent: 3,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> girisYap() async {
    if (globalKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: sifre)
          .then((user) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("email", email);
      }).then((value) {
        Fluttertoast.showToast(msg: "Giriş Başarılı").then(
          (value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          ),
        );
      }).catchError(
        (hata) {
          Fluttertoast.showToast(msg: hata);
        },
      );
    }
  }
}
