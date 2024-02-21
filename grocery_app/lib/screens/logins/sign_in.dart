import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home_page.dart';

// this is sign in page

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _username = TextEditingController();
  final _signInPass = TextEditingController();

  Widget getField(
      {double? left,
      double? right,
      double? top,
      double? bottom,
      TextEditingController? controller,
      String? hintText,
      Icon? icon}) {
    return Padding(
        padding: EdgeInsets.only(
            left: left ?? 0,
            right: right ?? 0,
            top: top ?? 0,
            bottom: bottom ?? 0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ));
  }

  Widget otherSignUp(
          {double? width, double? height, String? text, Color? color}) =>
      Container(
          width: width ?? 0,
          height: height ?? 0,
          decoration: BoxDecoration(
            color: color,
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
              text ?? "",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return ListView(children: [
      Column(
        children: [
          // left 30,right 20, top 30
          const SizedBox(
            height: 30,
          ),
          getField(
              controller: _username,
              icon: const Icon(Icons.person),
              hintText: "User name",
              top: 30,
              left: 30,
              right: 20),
          getField(
              controller: _signInPass,
              icon: const Icon(Icons.lock),
              hintText: "Password",
              top: 30,
              left: 30,
              right: 20),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
                onTap: () {
                  // when i sign up then it need to display a box to tell go to sign in page
                  _username.clear();
                  _signInPass.clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                  print(
                      "Successfully Created account for this app, You can log in");
                }, //w:250,h:50,
                child: otherSignUp(
                    width: 250,
                    height: 50,
                    text: "SIGN IN",
                    color: Colors.lightGreen)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180.0, top: 20),
            child: GestureDetector(
              onTap: () {
                print("Pressed forget password");
              },
              child: Text(
                "Forget password?",
                style: GoogleFonts.notoSerif(
                    fontSize: isPortrait ? 15 : 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
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

// ending sing in
