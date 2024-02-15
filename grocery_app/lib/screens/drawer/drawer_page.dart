import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/new_user.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/user_profile.png"),
              ),
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
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
          title: Text(
            'Settings',
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            // Add navigation functionality here
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
          title: Text(
            'Edit Profile',
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            // Add navigation functionality here
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          title: Text(
            'Log out',
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            // Add navigation functionality here
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewUser(),
                ));
          },
        ),
        // Add more ListTile widgets for additional items
      ],
    );
  }
}
