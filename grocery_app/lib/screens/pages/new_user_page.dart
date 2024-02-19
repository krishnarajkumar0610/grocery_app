import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/logins/sign_in.dart';
import 'package:grocery_app/screens/logins/sign_up.dart';

class NewUser extends StatelessWidget {
  const NewUser({Key? key});

  Widget getAppText(String greetingText, double size) {
    return Text(
      greetingText,
      style: GoogleFonts.notoSerif(
        fontWeight: FontWeight.w700,
        fontSize: size.sp,
        color: Colors.black,
        letterSpacing: 0.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(isPortrait ? 250 : 200),
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
                  gradient: const LinearGradient(
                    colors: [Colors.lightGreen, Colors.white60],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: isPortrait ? 120.w : 50.w,
                        height: isPortrait ? 100.w : 20.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/logo.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    getAppText(
                      "Grocery App",
                      isPortrait ? 18.w : 5.w,
                    ),
                    getAppText(
                      "Welcome to our Application",
                      isPortrait ? 18.w : 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: isPortrait ? 27.5.h : 43.h,
                        left: isPortrait ? 40.w : 20.w,
                        right: isPortrait ? 40.w : 20.w,
                      ),
                      child: const TabBar(
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
              )),
          body: const TabBarView(
            children: [
              SignUp(),
              SignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
