import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grocery_app/screens/logins/sign_in.dart';
import 'package:grocery_app/screens/logins/sign_up.dart';

// 2nd page starting

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(seconds: 1),
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
              color: Colors.orange, // Background color
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/logo.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Grocery App",
                    style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Welcome to our Application",
                    style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 29, left: 40, right: 40),
                  child: TabBar(
                    labelColor: Colors.black, // Set tab text color
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, // Set tab text font weight
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

        // calling sign up and sign in

        body: const TabBarView(
          children: [
            // Content of Sign up tab
            SignUp(), // <= click this for sign up

            // Content of Sign in tab

            SignIn(), // <= click this for sign in
          ],
        ),
      ),
    );
  }

  Widget getField(TextEditingController text, String lableText, Icon icon) {
    return TextField(
      controller: text,
      decoration: InputDecoration(
          labelText: lableText,
          prefixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }

// 2nd page ending
}
