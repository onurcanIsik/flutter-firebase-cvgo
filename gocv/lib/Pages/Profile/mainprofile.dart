// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  late String? email, benKimim, hobi1, hobi2, sertf1, sertf2;

  emailAl(emailTutucu) {
    email = emailTutucu;
  }

  benKimimAl(benTutucu) {
    benKimim = benTutucu;
  }

  hobi1Al(hobi1Tutucu) {
    hobi1 = hobi1Tutucu;
  }

  hobiAl2(hobi1Tutucu2) {
    hobi2 = hobi1Tutucu2;
  }

  sertfAl(sertifikaTutucu) {
    sertf1 = sertifikaTutucu;
  }

  sertfAl2(sertifikaTutucu2) {
    sertf2 = sertifikaTutucu2;
  }

  bool veriEklendi = false;
  String gelenKimim = "";
  String gelenHobi = "";
  String gelenHobi2 = "";
  String gelenSertf = "";
  String gelenSertf2 = "";
  String gelenMail = "";

  Future<void> sharedKaydet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mail", gelenMail);
    prefs.setString("hobi1", gelenHobi);
    prefs.setString("hobi2", gelenHobi2);
    prefs.setString("sertf1", gelenSertf);
    prefs.setString("sertf2", gelenSertf2);
    prefs.setString("benKimim", gelenKimim);
  }

  Future<void> sharedMailOku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mail = prefs.getString("mail");
  }

  Future<void> sharedHobi1Oku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hobi = prefs.getString("hobi1");
  }

  Future<void> sharedHobi2Oku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hobi2 = prefs.getString("hobi2");
  }

  Future<void> sharedSertf1Oku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sertf1 = prefs.getString("sertf1");
  }

  Future<void> sharedSertf2Oku() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sertf2 = prefs.getString("sertf2");
  }

  Future<void> sharedBenKimimGetir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var benKimim = prefs.getString("benKimim");
  }

  @override
  void initState() {
    verileriGetir("onurcannisik@gmail.com");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DBF5F0"),
      appBar: AppBar(
        backgroundColor: HexColor("#0C6170"),
        title: Text(
          "Profil",
          style: GoogleFonts.josefinSans(fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("Assets/Images/logo.png"),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Ad Soyad",
                                suffixIcon: Icon(
                                  Iconsax.pen_add5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: Text(
                              "Resim Seç",
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.bold,
                                color: HexColor("#0C6170"),
                              ),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text(
                              "Kaydet",
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.bold,
                                color: HexColor("#0C6170"),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: sharedMailOku() == null
                        ? TextFormField(
                            onChanged: (emailTutucu) {
                              emailAl(emailTutucu);
                            },
                            decoration: InputDecoration(
                              hintText: "E-mail",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          )
                        : Container(
                            height: 60,
                            child: Card(
                              child: Center(
                                child: Text(gelenMail),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: sharedBenKimimGetir() == null
                        ? TextFormField(
                            onChanged: (benKimimTutucu) {
                              benKimimAl(benKimimTutucu);
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Ben Kimim ?",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          )
                        : Container(
                            height: 60,
                            child: Card(
                              child: Center(
                                child: Text(gelenKimim),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 140,
                    child: sharedHobi1Oku() == null
                        ? TextFormField(
                            onChanged: (hobi1) {
                              hobi1Al(hobi1);
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Hobi-1",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          )
                        : Container(
                            height: 60,
                            child: Card(
                              child: Center(
                                child: Text(gelenHobi),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 140,
                    child: sharedHobi2Oku() == null
                        ? TextFormField(
                            onChanged: (hobi2) {
                              hobiAl2(hobi2);
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Hobi-2",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          )
                        : Container(
                            height: 60,
                            child: Card(
                              child: Center(
                                child: Text(gelenHobi2),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: sharedSertf1Oku() == null
                    ? TextFormField(
                        onChanged: (sertfikia1) {
                          sertfAl(sertfikia1);
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Sertifika-1",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    : Container(
                        height: 60,
                        child: Card(
                          child: Center(
                            child: Text(gelenSertf),
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: sharedSertf2Oku() == null
                    ? TextFormField(
                        onChanged: (sertifika2) {
                          sertfAl2(sertifika2);
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Sertifika-2",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    : Container(
                        height: 60,
                        child: Card(
                          child: Center(
                            child: Text(gelenSertf2),
                          ),
                        ),
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    "Kaydet",
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      color: HexColor("#0C6170"),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      veriEklendi = true;
                      bilgileriEkle();
                    });
                  },
                ),
                TextButton(
                  child: Text(
                    "Tamamla",
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      color: HexColor("#0C6170"),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      verileriGetir("onurcannisik@gmail.com");
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void bilgileriEkle() {
    DocumentReference veriYolu =
        FirebaseFirestore.instance.collection("KullaniciBilgiler").doc(email);

    Map<String, dynamic> bilgiler = {
      "kullanıcıEmail": email,
      "kullanıcıBilgisi": benKimim,
      "Hobi-1": hobi1,
      "Hobi-2": hobi2,
      "sertf-1": sertf1,
      "sertf-2": sertf2,
    };

    veriYolu.set(bilgiler).whenComplete(
          () => Fluttertoast.showToast(msg: "Başarıyla Eklendi"),
        );
  }

  void bilgileriGuncelle() {
    DocumentReference veriGuncelle =
        FirebaseFirestore.instance.collection("KullaniciBilgiler").doc(email);

    Map<String, dynamic> guncellenecekVeri = {
      "kullanıcıEmail": email,
      "kullanıcıBilgisi": benKimim,
      "Hobi-1": hobi1,
      "Hobi-2": hobi2,
      "sertf-1": sertf1,
      "sertf-2": sertf2,
    };
    veriGuncelle.update(guncellenecekVeri).whenComplete(
          () => Fluttertoast.showToast(msg: "Veriler Güncellendi"),
        );
  }

  void verileriGetir(String emailGet) {
    try {
      FirebaseFirestore.instance
          .collection("KullaniciBilgiler")
          .doc(emailGet)
          .get()
          .then((value) {
        gelenMail = value.data()!['kullanıcıEmail'];
        gelenKimim = value.data()!['kullanıcıBilgisi'];
        gelenHobi = value.data()!['Hobi-1'];
        gelenHobi2 = value.data()!['Hobi-2'];
        gelenSertf = value.data()!['sertf-1'];
        gelenSertf2 = value.data()!['sertf-2'];
      });
    } catch (e) {
      Text("Hatamız $e");
    }
  }
}
