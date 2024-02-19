import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          {double? width, double? height, String? text, Color? color}) =>
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
        children: <Widget>[
          //l:30,r:20,t:30
          const SizedBox(
            height: 20,
          ),
          getField(
              horizontal: 30,
              vertical: 10,
              hintText: "Full Name",
              icon: const Icon(Icons.person),
              controller: _fullName),
          getField(
              horizontal: 30,
              vertical: 10,
              hintText: "Email",
              icon: const Icon(Icons.mail),
              controller: _email),
          getField(
              horizontal: 30,
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
                }, //w:250,h:50,
                child: otherSignUp(
                    width: 250.w,
                    height: 50.h,
                    text: "SIGN UP",
                    color: Colors.orange)),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Text(
              "--------------or Sign up with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          //w:120,h:50,
          Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                otherSignUp(
                    color: Colors.white,
                    height: 50.h,
                    width: 120.w,
                    text: "Google"),
                otherSignUp(
                    color: Colors.deepPurple,
                    text: "Facebook",
                    width: 120.w,
                    height: 50.h)
              ],
            ),
          )
        ],
      ),
    ]);
  }
}

// end of sign up page
