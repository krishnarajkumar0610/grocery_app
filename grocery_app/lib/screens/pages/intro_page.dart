import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/bloc/grocery_events.dart';
import 'package:grocery_app/screens/pages/new_user.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<GroceryBloc>(context);
    bloc.add(TimeStatus());
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NewUser(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50, top: 200),
              child: Image.asset("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
  }
}