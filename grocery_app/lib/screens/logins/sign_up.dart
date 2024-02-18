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
      {double? left,
      double? right,
      double? top,
      double? bottom,
      TextEditingController? controller,
      String? hintText,
      Icon? icon}) {
    return Padding(
        padding: EdgeInsets.only(
            left: left?.w ?? 0,
            right: right?.w ?? 0,
            top: top?.h ?? 0,
            bottom: bottom?.w ?? 0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r))),
        ));
  }

  Widget otherSignUp(
          {double? width, double? height, String? text, Color? color}) =>
      Container(
          width: width?.w ?? 0,
          height: height?.h ?? 0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
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
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: Colors.black),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          //l:30,r:20,t:30
          getField(
              left: 30,
              right: 20,
              top: 20,
              hintText: "Full Name",
              icon: const Icon(Icons.person),
              controller: _fullName),
          getField(
              left: 30,
              right: 20,
              top: 20,
              hintText: "Email",
              icon: const Icon(Icons.mail),
              controller: _email),
          getField(
              left: 30,
              right: 20,
              top: 20,
              hintText: "Password",
              icon: const Icon(Icons.lock),
              controller: _password),

          Padding(
            padding: EdgeInsets.only(top: 20.h),
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
                    width: 250,
                    height: 50,
                    text: "SIGN UP",
                    color: Colors.orange)),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Text(
              "--------------or Sign up with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700, fontSize: 15.sp),
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
                    height: 50,
                    width: 120,
                    text: "Google"),
                otherSignUp(
                    color: Colors.deepPurple,
                    text: "Facebook",
                    width: 120,
                    height: 50)
              ],
            ),
          )
        ],
      ),
    ]);
  }
}

// end of sign up page
