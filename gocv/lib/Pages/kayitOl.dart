// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gocv/Pages/loginPage.dart';
import 'package:gocv/Pages/verify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _globalKey = GlobalKey<FormState>();
  String sifre = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      body: Form(
        key: _globalKey,
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
                "Kayıt Ol",
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
                  validator: (alinanEmail) {
                    return EmailValidator.validate(email)
                        ? null
                        : "Geçerli bir email giriniz";
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
                  obscureText: true,
                  onChanged: (alinanSifre) {
                    setState(() {
                      sifre = alinanSifre;
                    });
                  },
                  validator: (alinanSifre) {
                    return alinanSifre!.length >= 5
                        ? null
                        : "Daha uzun bir şifre giriniz";
                  },
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
                      "Kayıt Ol",
                      style: GoogleFonts.comfortaa(
                        color: HexColor("#DBF5F0"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        kayitOl();
                      });
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
                      "Giriş Yap",
                      style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.bold,
                        color: HexColor("#0C6170"),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
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

  Future<void> kayitOl() async {
    if (_globalKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: sifre)
          .then(
        (kullanici) {
          FirebaseFirestore.instance
              .collection("Kullanicilar")
              .doc(email)
              .set({"KullaniciEposta": email, "KullaniciSifre": sifre})
              .whenComplete(
                () => Fluttertoast.showToast(msg: "Başarıyla Eklendi"),
              )
              .then((page) => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const VerifyPage())));
        },
      );
    }
  }
}
