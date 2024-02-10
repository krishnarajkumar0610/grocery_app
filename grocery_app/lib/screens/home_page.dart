import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya_project/bloc/grocery_bloc.dart';

import 'package:priya_project/components/grocery_items.dart';

import '../bloc/grocery_states.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Good Morning",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 33),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: GoogleFonts.notoSerif(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: BlocConsumer<GroceryBloc, GroceryStates>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: state.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    print("HELLO KRISHNA");
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GroceryItemTile(
                        itemName: state.shopItems[index][0],
                        itemPrice: state.shopItems[index][1],
                        imagePath: state.shopItems[index][2],
                        color: state.shopItems[index][3],
                        index: index,
                      ),
                    );
                  },
                );
              },
              listener: (BuildContext context, state) {},
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            )),
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
