import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _username = TextEditingController();
  final _signInPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30),
              child: TextField(
                controller: _signInPass,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: GestureDetector(
              onTap: () {
                // when i sign up then it need to display a box to tell go to sign in page
                _username.dispose();
                _signInPass.dispose();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 190.0, top: 10),
            child: GestureDetector(
              onTap: () {
                print("Pressed forget password");
              },
              child: Text(
                "Forget password?",
                style: GoogleFonts.notoSerif(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "--------------or Sign In with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Google",
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    )),
                Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Facebook",
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
