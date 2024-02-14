import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/home_page.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: TabBarView(
          children: [
            // Content of Sign up tab
            ListView(children: [
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 20.0, top: 30),
                      child: getField(
                          _fullName,
                          "Full Name",
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 20.0, top: 30),
                      child: getField(
                          _email,
                          "Email",
                          const Icon(
                            Icons.email,
                            color: Colors.black,
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 20.0, top: 30),
                      child: getField(
                          _fullName,
                          "Password",
                          const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        // when i sign up then it need to display a box to tell go to sign in page
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "--------------or Sign up with--------------",
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  )
                ],
              ),
            ]),
            // Content of Sign in tab
            const Center(
              child: Text(
                'Sign in content',
                style: TextStyle(fontSize: 20),
              ),
            ),
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
}
