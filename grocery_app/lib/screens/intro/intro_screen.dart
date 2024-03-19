import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../new_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _IntroPageState();
}

class _IntroPageState extends State<SplashScreen> {
  // calling 2nd page
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NewUser(), // <= click this for new user
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Splash screen
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: deviceWidth * 0.1,
                right: deviceWidth * 0.1,
                top: deviceHeight * 0.2,
              ),
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("We Deliver Groceries at your doorstep ❤️",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aclonica(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ]),
    );

    // Splash screen
  }
}
