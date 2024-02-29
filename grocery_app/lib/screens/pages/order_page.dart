import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../bloc/grocery_bloc.dart';
import '../../bloc/grocery_states.dart';

class OrderPage extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String imagePath;
  final String description;
  final int? index;
  final color;

  const OrderPage(
      {super.key,
        required this.itemName,
        required this.itemPrice,
        required this.imagePath,
        required this.description,
        required this.color,
        this.index});

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
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                        const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  "Product Name : $itemName",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: state.themeStatus ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                          const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Text(
                            description,
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
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  "Product Price : $itemPrice/-",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: state.themeStatus ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                        const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Quantity :",
                          style: GoogleFonts.notoSerif(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 20),
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
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text(
                          "Grocery App",
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        content: ListTile(
                          title: Text(
                            "Ordering $itemName",
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                          Text("TOTAL PRICE : ${state.totalAmount ?? 0}"),
                        )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                          const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ])),
    );
  }
}