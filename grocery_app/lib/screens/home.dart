import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/greetings/greeting_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';
import 'package:grocery_app/bloc/theme/theme_bloc.dart';
import 'package:grocery_app/bloc/theme/theme_state.dart';
import 'package:grocery_app/bloc/theme/theme_event.dart';

import 'drawer/drawer_page.dart';

class HomePage extends StatelessWidget {
  bool isAdmin;

  HomePage({Key? key, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GreetingBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Grocery App",
            style: GoogleFonts.notoSerif(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            BlocConsumer<ThemeBloc, ThemeState>(
              listener: (context, state) {},
              builder: (context, state) => IconButton(
                onPressed: () {
                  print("CALLING THEME");
                  context.read<ThemeBloc>().add(ChangeTheme());
                },
                icon: state is LightThemeState
                    ? const Icon(
                        Icons.dark_mode,
                        size: 30,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.sunny,
                        color: Colors.yellow,
                        size: 25,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            isAdmin
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CartPage(),
                        //   ),
                        // ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(width: 10),
          ],
        ),
        drawer: const Drawer(
            backgroundColor: Colors.white,
            child: MyDrawer() // <= click this for Drawer
            ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<GreetingBloc, GreetingState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      state is GetMyGreetingState ? state.message : "Sorry",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(19),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Let's order fresh items for you 😍",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
