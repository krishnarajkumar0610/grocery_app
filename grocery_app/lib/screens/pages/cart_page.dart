import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_event.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreenAccent,
          title: Text(
            "My Cart",
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Center(
                              child: Text(
                                "⚠️",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            content: const Text(
                              "Clear cart items",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              MaterialButton(
                                color: Colors.green,
                                onPressed: () {
                                  context.read<CartBloc>().add(Clearcart());
                                  Navigator.pop(context);
                                },
                                child: const Text("Clear"),
                              )
                            ],
                          ));
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent),
                  child: Center(
                    child: Text(
                      "Clear cart",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ))
          ],
        ),
        body: BlocConsumer<CartBloc, CartState>(
          builder: (context, state) {
            // Your UI based on state goes here
            return state.cartItem!.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🛒",
                        style: TextStyle(fontSize: 200),
                      ),
                      Text(
                        "Cart is empty 🥲",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ))
                : ListView.builder(
                    itemCount: state.cartItem!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                              leading: Image.asset(state.cartItem![index][3]),
                              title: Text(
                                state.cartItem![index][1],
                                style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                "Rs.${state.cartItem![index][2]}",
                                style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  //context.read<GroceryBloc>().add(RemoveItem(index: index,));
                                  //Navigator.pop(context);
                                },
                                icon: const Icon(Icons.remove_circle,
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
