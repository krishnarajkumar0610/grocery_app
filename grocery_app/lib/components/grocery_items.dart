import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya_project/bloc/grocery_bloc.dart';
import 'package:priya_project/bloc/grocery_events.dart';
import 'package:priya_project/bloc/grocery_states.dart';
import 'package:priya_project/screens/cart_page.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  int index;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocConsumer<GroceryBloc, GroceryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                left: 15,
                top: 10,
                child: Image.asset(
                  imagePath,
                  height: 60,
                ),
              ),
              Positioned(
                left: 110,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<GroceryBloc>().add(AddItem(index: index));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ));
                    },
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 80,
                child: Text(
                  itemName,
                  style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Positioned(
                top: 120,
                left: 10,
                child: MaterialButton(
                  color: color,
                  onPressed: () {},
                  child: Text(
                    "Buy Rs.${itemPrice}/-",
                    style: GoogleFonts.notoSerif(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
