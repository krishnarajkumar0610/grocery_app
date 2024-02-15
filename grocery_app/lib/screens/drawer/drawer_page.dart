import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/new_user.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget getOptions(
      {required Icon icon,
      required String text,
      required bool navigateToLogout}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[500], borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            // Add navigation functionality here
            if (navigateToLogout) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewUser(),
                  ));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blueAccent, Colors.white]),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/user_profile.png"),
            ),
            accountName: Text(
              "Priyadharshini P",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            accountEmail: Text(
              "pd02102005@gmail.com",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, color: Colors.black),
            )),
        getOptions(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            text: 'Settings',
            navigateToLogout: false),
        getOptions(
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            text: "Edit Profile",
            navigateToLogout: false),
        getOptions(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            text: "Logout",
            navigateToLogout: true),

        Padding(
            padding: const EdgeInsets.only(top: 100, left: 50),
            child: Text(
              "Enjoy your food 😇",
              style: GoogleFonts.notoSerif(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
        // Add more ListTile widgets for additional items
      ],
    );
  }
}
