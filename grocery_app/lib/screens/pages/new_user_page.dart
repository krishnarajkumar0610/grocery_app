import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/logins/sign_in.dart';
import 'package:grocery_app/screens/logins/sign_up.dart';

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
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(280),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: 120,
                                height: 100,
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
                              18,
                            ),
                            getAppText(
                              "Welcome to our Application",
                              18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 27.5,
                        left: 40,
                        right: 40,
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
