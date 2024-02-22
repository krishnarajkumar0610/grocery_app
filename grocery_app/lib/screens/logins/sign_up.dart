import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// this is sing up page

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  Widget getField(
      {double? vertical,
      double? horizontal,
      TextEditingController? controller,
      String? hintText,
      Icon? icon}) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 0,
          vertical: vertical ?? 0,
        ),
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
          {double? width,
          double? height,
          String? text,
          Color? color,
          Color? textColor}) =>
      Container(
          width: width,
          height: height,
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
                  fontWeight: FontWeight.bold, fontSize: 15, color: textColor),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return ListView(children: [
      Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          getField(
              horizontal: orientation == Orientation.portrait ? 30 : 100,
              vertical: 10,
              hintText: "Full Name",
              icon: const Icon(Icons.person),
              controller: _fullName),
          getField(
              horizontal: orientation == Orientation.portrait ? 30 : 100,
              vertical: 10,
              hintText: "Email",
              icon: const Icon(Icons.mail),
              controller: _email),
          getField(
              horizontal: orientation == Orientation.portrait ? 30 : 100,
              vertical: 10,
              hintText: "Password",
              icon: const Icon(Icons.lock),
              controller: _password),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
                onTap: () {
                  // when i sign up then it need to display a box to tell go to sign in page
                  _fullName.clear();
                  _email.clear();
                  _password.clear();
                  print(
                      "Successfully Created account for this app, You can log in");
                },
                child: otherSignUp(
                    width: 250,
                    height: 50,
                    text: "SIGN UP",
                    color: Colors.lightGreen)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "--------------or Sign up with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          //w:120,h:50,
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                otherSignUp(
                    color: Colors.white,
                    height: 50,
                    width: 120,
                    text: "Google",
                    textColor: Colors.black),
                otherSignUp(
                    color: Colors.deepPurple[700],
                    text: "Facebook",
                    width: 120,
                    height: 50,
                    textColor: Colors.white)
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ]);
  }
}

// end of sign up page
