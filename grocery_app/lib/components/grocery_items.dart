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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              itemName,
              style: GoogleFonts.notoSerif(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          BlocConsumer<GroceryBloc, GroceryStates>(
            builder: (BuildContext context, GroceryStates state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    context.read<GroceryBloc>().add(AddItem(index: index));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                  },
                  color: color,
                  child: Text(
                    "Rs.$itemPrice"+"/-",
                    style: GoogleFonts.notoSerif(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            listener: (BuildContext context, GroceryStates state) {},
          )
        ],
      ),
    );
  }
}
