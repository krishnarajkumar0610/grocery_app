import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30),
              child: TextField(
                controller: _fullName,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: "Mail id",
                    prefixIcon: const Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: () {
                // when i sign up then it need to display a box to tell go to sign in page
                _fullName.clear();
                _email.clear();
                _password.clear();
                print(
                    "Successfully Created accout for this app, You can log in");
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
                    "Sign Up",
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "--------------or Sign up with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
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
