import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/logins/sign_in.dart';
import 'package:grocery_app/screens/logins/sign_up.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  Widget getAppText(String greetingText) {
    return Text(
      "Grocery App",
      style: GoogleFonts.notoSerif(
        fontWeight: FontWeight.bold,
        fontSize: 20,
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
            preferredSize: const Size.fromHeight(200),
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 120,
                      height: 60,
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
                  getAppText("Grocery App"),
                  Text(
                    "Welcome to our Application",
                    style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 45,
                      right: 45,
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
