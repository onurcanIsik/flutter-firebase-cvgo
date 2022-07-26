import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gocv/Pages/homepage.dart';
import 'package:gocv/Pages/loginPage.dart';
import 'package:gocv/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? const MyApp() : const HomePage(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("Assets/Images/logo.png"),
      title: Text(
        "Cvgo",
        style: GoogleFonts.josefinSans(fontSize: 40),
      ),
      backgroundColor: HexColor("#DBF5F0"),
      showLoader: true,
      loaderColor: HexColor("#0C6170"),
      navigator: const LoginPage(),
      durationInSeconds: 4,
    );
  }
}
