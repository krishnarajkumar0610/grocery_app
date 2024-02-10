import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 80, bottom: 40, top: 160),
              child: Image.asset("assets/avocado.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("We Deliver Groceries at your doorstep",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Fresh items everyday",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  )),
              child: Container(
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink),
                child: Center(
                    child: Text(
                  "Get Started",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
