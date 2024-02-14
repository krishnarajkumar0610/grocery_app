import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/grocery_bloc.dart';
import '../bloc/grocery_states.dart';

class OrderPage extends StatelessWidget {
  final String? itemName;
  final String? itemPrice;
  final String? imagePath;
  final String? description;
  final color;

  const OrderPage(
      {super.key,
      required this.itemName,
      this.itemPrice,
      this.imagePath,
      this.description,
      this.color});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroceryBloc, GroceryStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: color,
            centerTitle: true,
            title: Text(
              "Order Page",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: ListView(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(imagePath!),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0),
                child: Text(
                  "Product Name : ${itemName!}",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0),
                child: Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          Text(
                            description!,
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0),
                child: Text(
                  "Product Price : ${itemPrice!}",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0),
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: color),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          "Quantity :",
                          style: GoogleFonts.notoSerif(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5),
                        child: Text(
                          "${state.quantity}",
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  // add quantity function is here
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0),
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: color),
                  child: Center(
                    child: Text(
                      "Order",
                      style: GoogleFonts.notoSerif(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.black),
                    ),
                  ),
                ),
              )
            ]),
          ])),
    );
  }
}
