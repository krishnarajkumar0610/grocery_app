import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/home_page.dart';
import 'package:grocery_app/screens/newUser_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () =>
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NewUser(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: ListView(
        children: [
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
                child: Text(
                  "We Deliver Groceries at your doorstep ❤️",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aclonica(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
