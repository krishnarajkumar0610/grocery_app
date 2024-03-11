import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_event.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';

import 'package:grocery_app/bloc/shop/shop_event.dart';

import '../../bloc/shop/shop_state.dart';

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
    context.read<CartBloc>().add(GetInitialCartData());
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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) =>
                  BlocBuilder<InitialShopBloc, InitialShopState>(
                builder: (context, shopBloc) {
                  return state.cartItem!.isEmpty
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Center(
                                  child: Text(
                                    "⚠️",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                content: const Text(
                                  "Clear cart items",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                actions: [
                                  MaterialButton(
                                    color: Colors.green,
                                    onPressed: () {
                                      context.read<InitialShopBloc>().add(
                                          ChangeAllIcon(
                                              shopItem: shopBloc.shopItems));
                                      context.read<CartBloc>().add(Clearcart());
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Clear"),
                                  )
                                ],
                              ),
                            );
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
                          ),
                        );
                },
              ),
            ),
          ],
        ),
        body: BlocConsumer<CartBloc, CartState>(
          builder: (context, state) {
            return BlocBuilder<InitialShopBloc, InitialShopState>(
              builder: (context, shopState) {
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
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 600,
                              child: ListView.builder(
                                itemCount: state.cartItem!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 290,
                                            top: 10,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Assuming this is how your shopItem is stored
                                                context
                                                    .read<InitialShopBloc>()
                                                    .add(ChangeToShopCart(
                                                        itemName:
                                                            state.cartItem![
                                                                index][1],
                                                        shopItem: shopState
                                                            .shopItems));

                                                context.read<CartBloc>().add(
                                                    RemoveItem(index: index));
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 5,
                                            top: 40,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Image.asset(
                                                state.cartItem![index][3],
                                                height: 120,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 160,
                                            top: 50,
                                            child: Text(
                                              "Name : ${state.cartItem![index][1]}",
                                              style: GoogleFonts.notoSerif(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 160,
                                            top: 85,
                                            child: Text(
                                              "Price : Rs.${state.cartItem![index][2] * state.cartItem![index][0]}/-",
                                              style: GoogleFonts.notoSerif(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Positioned(
                                            left: 160,
                                            top: 120,
                                            child: Text(
                                              "Total Quantity : ${state.cartItem![index][0] ?? 0}",
                                              style: GoogleFonts.notoSerif(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green),
                              child: Center(
                                child: Text(
                                  "Total amount : ${state.totalAmount!} ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
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
