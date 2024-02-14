import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/screens/new_user.dart';

import '../bloc/grocery_bloc.dart';
import '../bloc/grocery_events.dart';
import '../bloc/grocery_states.dart';
import '../components/grocery_items.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<GroceryBloc, GroceryStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Grocery App",
              style: GoogleFonts.notoSerif(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    print("CALLING THEME");
                    context.read<GroceryBloc>().add(ChangeTheme(
                          themeStatus: state.themeStatus,
                        ));
                  },
                  icon: state.themeStatus!
                      ? const Icon(
                          Icons.dark_mode,
                          size: 30,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.sunny,
                          color: Colors.yellow,
                          size: 30,
                        )),
              const SizedBox(
                width: 30,
              ),
              CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      state.themeStatus! ? Colors.black : Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                      size: 30,
                    ),
                  )),
            ],
          ),
          drawer: const Drawer(
            backgroundColor: Colors.white,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  state.greetingStatus!,
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Let's order fresh items for you 😍",
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color:
                            state.themeStatus! ? Colors.black : Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Fresh Items every day 😋",
                  style: GoogleFonts.notoSerif(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: state.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GroceryItemTile(
                        itemName: state.shopItems[index][0],
                        itemPrice: state.shopItems[index][1],
                        imagePath: state.shopItems[index][2],
                        description: state.shopItems[index][3],
                        color: state.shopItems[index][4],
                        index: index,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
