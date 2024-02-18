import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../bloc/grocery_bloc.dart';
import '../../bloc/grocery_events.dart';
import '../../bloc/grocery_states.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreenAccent,
          centerTitle: true,
          title: Text(
            "My Cart",
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: BlocConsumer<GroceryBloc, GroceryStates>(
          builder: (context, state) {
            // Your UI based on state goes here
            return state.cartItems!.isEmpty
                ? const Center(
                    child: Icon(
                    Icons.remove_shopping_cart,
                    size: 200,
                  ))
                : ListView.builder(
                    itemCount: state.cartItems!.length!,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                              leading: Image.asset(state.cartItems![index][2]),
                              title: Text(
                                state.cartItems![index][0],
                                style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                "Rs.${state.cartItems![index][1]}",
                                style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  print("INSIDE CART : ${state.themeStatus}");
                                  context.read<GroceryBloc>().add(RemoveItem(
                                        index: index,
                                      ));
                                  //Navigator.pop(context);
                                },
                                icon: const Icon(Icons.cancel,
                                    size: 30, color: Colors.black),
                              )),
                        ),
                      );
                    },
                  );
          },
          listener: (context, state) {
            // Handle events or side effects here
          },
        ),
      ),
    );
  }
}
