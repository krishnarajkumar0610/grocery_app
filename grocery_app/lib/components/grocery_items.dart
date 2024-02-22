import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../bloc/grocery_bloc.dart';
import '../bloc/grocery_events.dart';
import '../bloc/grocery_states.dart';
import '../screens/pages/cart_page.dart';
import '../screens/pages/order_page.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String imagePath;
  final String description;
  final color;
  final int? index;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.description,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color[100],
        borderRadius: BorderRadius.circular(20),
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
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<GroceryBloc>().add(AddToCart(index: index));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CartPage(), // <= click it for cart page
                          ));
                    },
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 90,
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            itemName: itemName,
                            itemPrice: itemPrice,
                            imagePath: imagePath,
                            description: description,
                            index: index,
                            color: color,
                          ),
                        ));
                  },
                  child: Text(
                    "Buy Rs.$itemPrice/-",
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
