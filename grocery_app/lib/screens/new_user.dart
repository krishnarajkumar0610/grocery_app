import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logins/sign_in.dart';
import 'logins/sign_up.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  Widget getAppText(String greetingText, double size) {
    return Text(
      greetingText,
      style: GoogleFonts.notoSerif(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.black,
        letterSpacing: 0.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(deviceHeight * 0.35),
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(children: [
                Positioned(
                  left: deviceWidth * 0.35,
                  top: deviceHeight * 0.07,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/logo.png",
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.120,
                      ),
                      getAppText(
                        "Grocery App",
                        18,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      getAppText(
                        "Welcome to our Application",
                        18,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.350,
                    left: deviceWidth * 0.1,
                    right: deviceWidth * 0.1,
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
              ]),
            )),
        body: const TabBarView(
          children: [
            SignUp(),
            SignIn(),
          ],
        ),
      ),
    );
  }
}
