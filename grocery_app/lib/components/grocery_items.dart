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
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

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
                left: orientation == Orientation.portrait
                    ? deviceWidth * 0.200
                    : deviceWidth * 0.250,
                top: orientation == Orientation.portrait
                    ? deviceHeight * 0.100
                    : deviceHeight * 0.95,
                child: CircleAvatar(
                  radius: orientation == Orientation.portrait
                      ? deviceWidth * 0.05
                      : deviceWidth * 0.03,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: orientation == Orientation.portrait
                          ? deviceWidth * 0.05
                          : deviceWidth * 0.03,
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
                left: orientation == Orientation.portrait ? 15 : 12,
                top: orientation == Orientation.portrait ? 20 : 15,
                child: Image.asset(
                  imagePath,
                  height: orientation == Orientation.portrait
                      ? deviceHeight * 0.15
                      : deviceHeight * 0.20,
                ),
              ),
              Positioned(
                  left: orientation == Orientation.portrait
                      ? deviceWidth * 0.20
                      : deviceWidth * 0.1,
                  top: orientation == Orientation.portrait ? 100 : 90,
                  child: Text(itemName,
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: orientation == Orientation.portrait
                            ? deviceHeight * 0.1
                            : deviceHeight * 0.1,
                      ))),
              Positioned(
                top: orientation == Orientation.portrait ? 130 : 120,
                left: orientation == Orientation.portrait ? 10 : 10,
                child: SizedBox(
                  width: 150,
                  height: 50,
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
