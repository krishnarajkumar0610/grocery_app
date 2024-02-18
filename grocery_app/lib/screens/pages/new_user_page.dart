import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grocery_app/screens/logins/sign_in.dart';
import 'package:grocery_app/screens/logins/sign_up.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.4.sh),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.0.h),
                      child: SizedBox(
                        width: 120.w,
                        height: 120.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Image.asset(
                              "assets/logo.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Grocery App",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      "Welcome to our Application",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25.h,
                        left: 45.w,
                        right: 45.w,
                      ),
                      child: TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(
                            text: "Sign up",
                          ),
                          Tab(
                            text: "Sign in",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 0.6.sh, // Adjust height as necessary
              child: TabBarView(
                children: [
                  SignUp(),
                  SignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
